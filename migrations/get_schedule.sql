CREATE OR REPLACE FUNCTION public.get_my_appointments_grid(_date date) 
RETURNS jsonb
LANGUAGE plpgsql STABLE SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $$
DECLARE
    _doctor_id uuid;
BEGIN
    -- 1. Security Check: Only Doctors
    IF public.auth_user_role() != 'doctor' THEN
        RAISE EXCEPTION 'Unauthorized: Only doctors can access their personal schedule grid.';
    END IF;

    -- 2. Identify the Doctor
    _doctor_id := auth.uid();

    -- 3. Return Data (Same structure as the original grid for UI compatibility)
    RETURN (
        SELECT COALESCE(jsonb_agg(t), '[]'::jsonb) FROM (
            SELECT 
                a.id,
                a.start_time,
                a.end_time,
                a.status,
                a.type,
                p.full_name as patient_name,
                p.uhid,
                dr_p.full_name as doctor_name,
                a.doctor_id
            FROM appointments a
            JOIN patients p ON a.patient_id = p.id
            JOIN profiles dr_p ON a.doctor_id = dr_p.id
            WHERE a.doctor_id = _doctor_id -- 🔒 STRICT FILTER: Only My Appointments
              AND a.start_time::DATE = _date
              AND a.status != 'cancelled'
            ORDER BY a.start_time ASC
        ) t
    );
END;
$$;