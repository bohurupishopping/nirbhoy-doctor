-- 1. DROP THE OLD VERSIONS
-- We drop explicitly to ensure no conflicts or stale permission settings remain.

-- Drop the older 8-argument version (The one without Chief Complaint)
DROP FUNCTION IF EXISTS public.submit_prescription_complete(uuid, jsonb, text, jsonb, jsonb, jsonb, date, text);

-- Drop the 9-argument version (The one that was failing RLS)
DROP FUNCTION IF EXISTS public.submit_prescription_complete(uuid, jsonb, text, text, jsonb, jsonb, jsonb, date, text);


-- 2. CREATE THE NEW SECURE VERSION
CREATE OR REPLACE FUNCTION public.submit_prescription_complete(
    _consult_id uuid,
    _diagnosis jsonb,
    _chief_complaint text,
    _notes text,
    _vitals jsonb,
    _meds jsonb,
    _labs jsonb,
    _next_visit_date date DEFAULT NULL::date,
    _next_visit_text text DEFAULT NULL::text
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER -- Runs as Admin to fix Flutter RLS issues
SET search_path = public, pg_temp
AS $$
DECLARE
    _med JSONB;
    _lab JSONB;
    _appt_id UUID;
    _sort_idx INTEGER := 0;
BEGIN
    -- MANUAL SECURITY CHECK
    -- Ensure the consultation belongs to the user's clinic
    IF NOT EXISTS (
        SELECT 1 
        FROM consultations c
        JOIN appointments a ON c.appointment_id = a.id
        WHERE c.id = _consult_id
        AND a.clinic_id = public.auth_my_clinic_id()
    ) THEN
        RAISE EXCEPTION 'Access Denied: Consultation not found or belongs to another clinic.';
    END IF;

    -- Update Consultation Header
    UPDATE consultations 
    SET diagnosis_codes = _diagnosis,
        chief_complaint = _chief_complaint,
        clinical_notes_internal = _notes,
        vitals_snapshot = _vitals,
        next_visit_date = _next_visit_date,
        next_visit_text = _next_visit_text
    WHERE id = _consult_id
    RETURNING appointment_id INTO _appt_id;

    IF _appt_id IS NULL THEN
        RAISE EXCEPTION 'Consultation ID invalid.';
    END IF;

    -- Insert Medicines (Clean & Insert)
    DELETE FROM prescription_items WHERE consultation_id = _consult_id;

    FOR _med IN SELECT * FROM jsonb_array_elements(_meds)
    LOOP
        _sort_idx := _sort_idx + 1;

        INSERT INTO prescription_items (
            consultation_id, 
            medicine_master_id,
            medicine_name_manual, 
            frequency, 
            duration, 
            instructions_timing,
            special_instructions,
            sort_order,
            cached_composition
        )
        VALUES (
            _consult_id, 
            (_med->>'master_id')::uuid,
            _med->>'name', 
            _med->>'frequency', 
            _med->>'duration', 
            _med->>'instruction',
            _med->>'special_instructions',
            _sort_idx,
            _med->>'composition'
        );
    END LOOP;

    -- Insert Labs (Clean & Insert)
    DELETE FROM lab_orders WHERE consultation_id = _consult_id;

    FOR _lab IN SELECT * FROM jsonb_array_elements(_labs)
    LOOP
        INSERT INTO lab_orders (
            consultation_id, 
            test_name, 
            instruction
        )
        VALUES (
            _consult_id, 
            _lab->>'test_name', 
            _lab->>'instruction'
        );
    END LOOP;

    -- Update Status
    UPDATE appointments 
    SET status = 'completed', 
        consult_ended_at = NOW() 
    WHERE id = _appt_id;

    UPDATE queue_tokens 
    SET status = 'completed' 
    WHERE appointment_id = _appt_id;
END;
$$;