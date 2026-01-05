--
-- PostgreSQL database dump
--

\restrict xK0qVo82htivrXxhtvEaKwdqceCeMfcJ8KQYXFelVTrwxEotgQUqtSq9pM1DNox

-- Dumped from database version 15.8
-- Dumped by pg_dump version 18.1 (Debian 18.1-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: appointment_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.appointment_status AS ENUM (
    'scheduled',
    'rescheduled',
    'checked_in',
    'triaged',
    'payment_pending',
    'paid',
    'in_consult',
    'completed',
    'cancelled',
    'no_show'
);


--
-- Name: file_category; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.file_category AS ENUM (
    'lab_report',
    'x_ray',
    'prescription_old',
    'other',
    'prescription',
    'discharge_summary',
    'insurance'
);


--
-- Name: gender_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.gender_type AS ENUM (
    'Male',
    'Female',
    'Transgender',
    'Other'
);


--
-- Name: payment_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.payment_status AS ENUM (
    'pending',
    'partial',
    'paid',
    'refunded'
);


--
-- Name: queue_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.queue_status AS ENUM (
    'scheduled',
    'waiting',
    'called',
    'in_consult',
    'completed',
    'cancelled',
    'skipped'
);


--
-- Name: sub_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.sub_status AS ENUM (
    'active',
    'past_due',
    'cancelled',
    'expired'
);


--
-- Name: subscription_tier; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.subscription_tier AS ENUM (
    'free_trial',
    'basic',
    'pro',
    'enterprise'
);


--
-- Name: user_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_role AS ENUM (
    'admin',
    'staff',
    'doctor',
    'user',
    'super_admin'
);


--
-- Name: _internal_generate_queue_token(uuid, uuid, uuid, uuid, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public._internal_generate_queue_token(_clinic_id uuid, _appointment_id uuid, _patient_id uuid, _doctor_id uuid, _service_date date) RETURNS void
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _token_number INTEGER;
    _lock_key BIGINT;
BEGIN
    -- Lock
    _lock_key := hashtext(_doctor_id::text || _service_date::text);
    PERFORM pg_advisory_xact_lock(_lock_key);

    -- Calculate Number
    SELECT COALESCE(MAX(token_number), 0) + 1 INTO _token_number
    FROM queue_tokens
    WHERE doctor_id = _doctor_id 
    AND date_of_service = _service_date
    AND clinic_id = _clinic_id;

    -- 3. INSERT WITHOUT STATUS
    -- We removed the 'status' column from this list.
    -- This FORCES the database to use the default value ('scheduled').
    INSERT INTO queue_tokens (
        clinic_id, appointment_id, patient_id, doctor_id,
        token_number, date_of_service, created_at
    ) VALUES (
        _clinic_id, _appointment_id, _patient_id, _doctor_id,
        _token_number, _service_date, NOW()
    );
END;
$$;


--
-- Name: auth_my_clinic_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.auth_my_clinic_id() RETURNS uuid
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT clinic_id FROM public.profiles WHERE id = auth.uid();
$$;


--
-- Name: auth_user_role(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.auth_user_role() RETURNS public.user_role
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT role FROM public.profiles WHERE id = auth.uid();
$$;


--
-- Name: book_appointment_atomic(uuid, uuid, uuid, timestamp with time zone, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.book_appointment_atomic(_patient_id uuid, _doctor_id uuid, _clinic_id uuid, _slot_time timestamp with time zone, _consult_fee numeric) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _appt_id UUID;
    _appt_num TEXT;
    _invoice_id UUID;
    _invoice_num TEXT;
    _doc_name TEXT;
BEGIN
    -- 1. Concurrency Guard
    IF EXISTS (SELECT 1 FROM appointments WHERE doctor_id = _doctor_id AND start_time = _slot_time AND status != 'cancelled') THEN
        RAISE EXCEPTION 'Slot already booked';
    END IF;

    -- 2. Create Appointment
    -- Use RETURNING to get the UUID *and* the auto-generated Number
    INSERT INTO appointments (
        clinic_id, patient_id, doctor_id, start_time, end_time, status, checked_in_at, created_by
    )
    VALUES (
        _clinic_id, _patient_id, _doctor_id, _slot_time, 
        _slot_time + (SELECT avg_consult_time_min FROM doctors WHERE profile_id=_doctor_id) * interval '1 minute',
        'scheduled', NULL, auth.uid()
    ) 
    RETURNING id, appointment_number INTO _appt_id, _appt_num;

    -- 3. Create Invoice
    INSERT INTO invoices (appointment_id, sub_total, grand_total, payment_status)
    VALUES (_appt_id, _consult_fee, _consult_fee, 'pending')
    RETURNING id, invoice_number INTO _invoice_id, _invoice_num;

    -- 4. Create Line Item
    INSERT INTO invoice_items (invoice_id, description, unit_price, total_price)
    VALUES (_invoice_id, 'Consultation Fee', _consult_fee, _consult_fee);

    -- 5. Fetch Metadata
    SELECT full_name INTO _doc_name FROM profiles WHERE id = _doctor_id;

    -- 6. Return Hybrid Object (UUIDs for Logic, Numbers for Display)
    RETURN jsonb_build_object(
        'appointment_id', _appt_id,     -- UUID (Keep for logic)
        'appointment_number', _appt_num, -- NEW (Display)
        'invoice_id', _invoice_id,      -- UUID (Keep for logic)
        'invoice_number', _invoice_num,  -- NEW (Display)
        'doctor_name', _doc_name,
        'amount_due', _consult_fee
    );
END;
$$;


--
-- Name: bulk_upload_medicines(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.bulk_upload_medicines(_meds jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    item JSONB;
BEGIN
     IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

     FOR item IN SELECT * FROM jsonb_array_elements(_meds)
     LOOP
         INSERT INTO medicine_master (brand_name, generic_name, dosage_form, strength, uom, manufacturer)
         VALUES (
            item->>'brand_name',
            item->>'generic_name',
            (item->>'dosage_form')::public.dosage_form_type,
            item->>'strength',
            item->>'uom',
            item->>'manufacturer'
         ) ON CONFLICT (brand_name, generic_name, dosage_form, strength) DO NOTHING;
     END LOOP;
END;
$$;


--
-- Name: check_clinic_access(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.check_clinic_access(_clinic_id uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _status public.sub_status;
    _ends_at timestamp with time zone;
BEGIN
    -- Super Admins are always allowed (bypass check)
    IF public.is_super_admin() THEN 
        RETURN TRUE; 
    END IF;

    SELECT subscription_status, subscription_ends_at 
    INTO _status, _ends_at
    FROM clinics 
    WHERE id = _clinic_id;

    -- 1. If clinic doesn't exist
    IF NOT FOUND THEN RETURN FALSE; END IF;

    -- 2. Check Expiry Logic
    -- Allow if status is active OR (past_due but within grace period if you implement that later)
    -- STRICT CHECK: Date must be in future
    IF _ends_at < NOW() THEN
        RETURN FALSE;
    END IF;

    -- 3. Check Status Flag
    IF _status IN ('cancelled', 'expired') THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;
END;
$$;


--
-- Name: configure_doctor_roster(uuid, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.configure_doctor_roster(_doctor_id uuid, _schedules jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    item JSONB;
BEGIN
    -- Security: Ensure admin
    IF auth.user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    DELETE FROM doctor_schedules WHERE doctor_id = _doctor_id;

    FOR item IN SELECT * FROM jsonb_array_elements(_schedules)
    LOOP
        INSERT INTO doctor_schedules (doctor_id, day_of_week, start_time, end_time)
        VALUES (_doctor_id, (item->>'day')::INT, (item->>'start')::TIME, (item->>'end')::TIME);
    END LOOP;
END;
$$;


--
-- Name: create_new_medicine(text, text, text, text, text, text, numeric, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.create_new_medicine(_name text, _manufacturer_name text DEFAULT NULL::text, _salt_composition text DEFAULT NULL::text, _short_composition1 text DEFAULT NULL::text, _short_composition2 text DEFAULT NULL::text, _pack_size_label text DEFAULT NULL::text, _price numeric DEFAULT NULL::numeric, _type text DEFAULT NULL::text, _medicine_desc text DEFAULT NULL::text, _side_effects text DEFAULT NULL::text) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _new_id uuid;
BEGIN
    -- 1. Security Check: Allow only Admin or Doctor
    IF public.auth_user_role() NOT IN ('admin', 'doctor') THEN
        RAISE EXCEPTION 'Access Denied: Only Admins or Doctors can add new medicines.';
    END IF;

    -- 2. Basic Validation
    IF _name IS NULL OR TRIM(_name) = '' THEN
        RAISE EXCEPTION 'Medicine Name is required.';
    END IF;

    -- 3. Insert Record
    -- Note: 'search_vector' is automatically generated by the table definition, so we skip it.
    INSERT INTO public.medicine_master (
        name,
        manufacturer_name,
        salt_composition,
        short_composition1,
        short_composition2,
        pack_size_label,
        price,
        type,
        medicine_desc,
        side_effects,
        is_discontinued
    ) VALUES (
        TRIM(_name),
        TRIM(_manufacturer_name),
        TRIM(_salt_composition),
        TRIM(_short_composition1),
        TRIM(_short_composition2),
        TRIM(_pack_size_label),
        COALESCE(_price, 0),
        TRIM(_type),
        TRIM(_medicine_desc),
        TRIM(_side_effects),
        false -- Default to active (false means it is NOT discontinued)
    )
    RETURNING id INTO _new_id;

    RETURN _new_id;
END;
$$;


--
-- Name: delete_patient_document(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_patient_document(_document_id uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _doc_owner_id uuid;
    _doc_clinic_id uuid;
BEGIN
    -- 1. Get document owner and clinic context
    SELECT p.id, p.clinic_id INTO _doc_owner_id, _doc_clinic_id
    FROM patient_documents d
    JOIN patients p ON d.patient_id = p.id
    WHERE d.id = _document_id;

    IF NOT FOUND THEN RETURN FALSE; END IF;

    -- 2. Authorization Check
    -- Allow if: User is the owner OR User is Staff/Admin of the same clinic
    IF (auth.uid() = _doc_owner_id) OR 
       (public.auth_user_role() IN ('admin', 'staff', 'doctor') AND public.auth_my_clinic_id() = _doc_clinic_id) OR
       public.is_super_admin() 
    THEN
        DELETE FROM public.patient_documents WHERE id = _document_id;
        RETURN TRUE;
    ELSE
        RAISE EXCEPTION 'Unauthorized Access: You do not have permission to delete this document.';
    END IF;
END;
$$;


--
-- Name: doctor_call_patient(uuid, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.doctor_call_patient(_appointment_id uuid, _doctor_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    _clinic_id UUID;
BEGIN
    -- Security: Ensure this appointment belongs to this doctor
    -- Also fetches clinic_id for valid locking if needed later
    SELECT clinic_id INTO _clinic_id
    FROM appointments 
    WHERE id = _appointment_id AND doctor_id = _doctor_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Appointment not found or access denied';
    END IF;

    -- Update Queue Token Only
    -- The Trigger 'trigger_sync_appt_status' will automatically:
    -- 1. Set appointment.status = 'in_consult'
    -- 2. Set appointment.consult_started_at = NOW()
    UPDATE queue_tokens
    SET 
        status = 'called',
        called_at = NOW()
    WHERE appointment_id = _appointment_id;
END;
$$;


--
-- Name: enforce_plan_limits_doctors(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.enforce_plan_limits_doctors() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _current_count int;
    _limit int;
    _sub_status public.sub_status;
    _clinic_id uuid;
BEGIN
    -- Determine Clinic ID (Handle Insert vs Update)
    _clinic_id := NEW.clinic_id;

    -- ONLY RUN CHECK IF: 
    -- 1. It's an INSERT of a doctor
    -- 2. OR It's an UPDATE changing role TO 'doctor'
    IF (TG_OP = 'INSERT' AND NEW.role = 'doctor') OR 
       (TG_OP = 'UPDATE' AND NEW.role = 'doctor' AND OLD.role != 'doctor') THEN

        -- 1. Check Status Cache
        SELECT subscription_status INTO _sub_status 
        FROM clinics WHERE id = _clinic_id;

        IF _sub_status IS DISTINCT FROM 'active' THEN
            RAISE EXCEPTION 'Subscription is not active. Status: %', _sub_status;
        END IF;

        -- 2. Get Limit from Active Subscription
        SELECT limit_doctors INTO _limit
        FROM clinic_subscriptions
        WHERE clinic_id = _clinic_id 
          AND status = 'active' 
          AND starts_at <= NOW() 
          AND ends_at > NOW()
        ORDER BY ends_at DESC LIMIT 1;

        -- Handle case where no sub row exists (orphan clinic)
        IF _limit IS NULL THEN
            RAISE EXCEPTION 'No active subscription found for this clinic.';
        END IF;

        -- 3. Count Existing Doctors (Exclude the one being updated/inserted if it counts)
        SELECT COUNT(*) INTO _current_count 
        FROM profiles 
        WHERE clinic_id = _clinic_id 
          AND role = 'doctor' 
          AND is_active = true
          AND id != NEW.id; -- Crucial: Don't count self if updating

        IF _current_count >= _limit THEN
            RAISE EXCEPTION 'Plan limit reached. Max doctors allowed: %', _limit;
        END IF;

    END IF;

    RETURN NEW;
END;
$$;


--
-- Name: get_admin_dashboard_stats(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_admin_dashboard_stats(_clinic_id uuid) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN jsonb_build_object(
        'revenue_today', (SELECT COALESCE(SUM(grand_total), 0) FROM invoices i JOIN appointments a ON i.appointment_id = a.id WHERE a.clinic_id = _clinic_id AND i.created_at::DATE = CURRENT_DATE),
        'patients_waiting', (SELECT COUNT(*) FROM queue_tokens WHERE clinic_id = _clinic_id AND date_of_service = CURRENT_DATE AND status = 'waiting'),
        'doctors_active', (SELECT COUNT(DISTINCT doctor_id) FROM doctor_schedules WHERE day_of_week = EXTRACT(DOW FROM CURRENT_DATE)::INT)
    );
END;
$$;


--
-- Name: get_admin_finance_advanced(date, date, uuid, uuid, text, text, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_admin_finance_advanced(_start_date date, _end_date date, _clinic_id uuid DEFAULT NULL::uuid, _doctor_id uuid DEFAULT NULL::uuid, _status_filter text DEFAULT 'all'::text, _search_text text DEFAULT ''::text, _page integer DEFAULT 1, _page_size integer DEFAULT 20) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'temp'
    AS $$
DECLARE
    _auth_clinic_id uuid;
    _final_clinic_id uuid;
    _offset integer;
    _total_count bigint;
    _stats jsonb;
    _charts jsonb;
    _transactions jsonb;
BEGIN
    -- 1. SECURITY & CONTEXT
    SELECT clinic_id INTO _auth_clinic_id FROM profiles WHERE id = auth.uid();
    
    IF _auth_clinic_id IS NOT NULL THEN
        _final_clinic_id := _auth_clinic_id;
    ELSE
        _final_clinic_id := _clinic_id;
    END IF;

    _offset := (_page - 1) * _page_size;

    -- 2. MAIN DATA PIPELINE (CTE)
    WITH filtered_invoices AS (
        SELECT 
            i.id, i.invoice_number, i.created_at, 
            i.sub_total, i.tax_total, i.grand_total, 
            
            -- SAFETY FIX: If status is 'refunded', treats Collected as 0 for Net calculations
            CASE 
                WHEN i.payment_status = 'refunded' THEN 0 
                ELSE i.amount_paid 
            END as effective_collected,

            i.amount_paid as raw_paid, -- Keep raw for display
            i.payment_status, i.payment_mode,
            (i.grand_total - i.amount_paid) as balance_due,
            
            p.full_name as patient_name, 
            p.uhid, 
            p.phone,
            dr_p.full_name as doctor_name,
            dr.specialty,
            c.name as clinic_name
        FROM invoices i
        JOIN appointments a ON i.appointment_id = a.id
        JOIN clinics c ON a.clinic_id = c.id
        JOIN patients p ON a.patient_id = p.id
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        JOIN doctors dr ON dr.profile_id = dr_p.id
        WHERE 
            (_final_clinic_id IS NULL OR a.clinic_id = _final_clinic_id)
            AND i.created_at::DATE BETWEEN _start_date AND _end_date
            AND (_doctor_id IS NULL OR a.doctor_id = _doctor_id)
            AND (_status_filter = 'all' OR _status_filter = '' OR i.payment_status::text = _status_filter)
            AND (
                _search_text = '' OR 
                i.invoice_number ILIKE '%' || _search_text || '%' OR
                p.full_name ILIKE '%' || _search_text || '%' OR
                p.phone ILIKE '%' || _search_text || '%' OR
                p.uhid ILIKE '%' || _search_text || '%'
            )
    ),
    
    -- 3. CALCULATE AGGREGATE STATS (KPIs)
    stats_agg AS (
        SELECT 
            COUNT(*) as txn_count,
            COALESCE(SUM(grand_total), 0) as total_billed,
            COALESCE(SUM(effective_collected), 0) as total_net_collected, -- Net Revenue
            COALESCE(SUM(balance_due), 0) as total_pending,
            COALESCE(SUM(tax_total), 0) as total_tax_liability,
            -- Average Order Value (AOV)
            COALESCE(ROUND(AVG(grand_total), 0), 0) as avg_ticket_size
        FROM filtered_invoices
    ),

    -- 4. CHART: REVENUE BY DOCTOR (Bar Chart)
    chart_doctor AS (
        SELECT jsonb_agg(t) as data FROM (
            SELECT doctor_name, SUM(grand_total) as total
            FROM filtered_invoices
            GROUP BY doctor_name
            ORDER BY total DESC
        ) t
    ),

    -- 5. CHART: REVENUE BY MODE (Pie Chart)
    chart_mode AS (
        SELECT jsonb_agg(t) as data FROM (
            SELECT COALESCE(payment_mode, 'Unpaid') as mode, SUM(effective_collected) as total
            FROM filtered_invoices
            WHERE effective_collected > 0
            GROUP BY payment_mode
            ORDER BY total DESC
        ) t
    ),

    -- 6. [NEW] CHART: DAILY TREND (Line Chart)
    -- Grouping by Date to show spikes/dips in revenue
    chart_trend AS (
        SELECT jsonb_agg(t) as data FROM (
            SELECT 
                created_at::DATE as date, 
                SUM(grand_total) as billed, 
                SUM(effective_collected) as collected
            FROM filtered_invoices
            GROUP BY created_at::DATE
            ORDER BY created_at::DATE ASC
        ) t
    )

    -- 7. EXECUTE & BUILD RESPONSE
    SELECT 
        jsonb_build_object(
            'count', (SELECT txn_count FROM stats_agg),
            'billed', (SELECT total_billed FROM stats_agg),
            'collected', (SELECT total_net_collected FROM stats_agg),
            'pending', (SELECT total_pending FROM stats_agg),
            'tax', (SELECT total_tax_liability FROM stats_agg),
            'aov', (SELECT avg_ticket_size FROM stats_agg)
        ),
        jsonb_build_object(
            'by_doctor', COALESCE((SELECT data FROM chart_doctor), '[]'::jsonb),
            'by_mode', COALESCE((SELECT data FROM chart_mode), '[]'::jsonb),
            'daily_trend', COALESCE((SELECT data FROM chart_trend), '[]'::jsonb) -- New Line Chart Data
        ),
        COALESCE(jsonb_agg(
            jsonb_build_object(
                'id', f.id,
                'invoice_no', f.invoice_number,
                'date', f.created_at,
                'patient', jsonb_build_object('name', f.patient_name, 'phone', f.phone, 'uhid', f.uhid),
                'doctor', jsonb_build_object('name', f.doctor_name, 'dept', f.specialty),
                'financials', jsonb_build_object(
                    'total', f.grand_total,
                    'paid', f.raw_paid,
                    'due', f.balance_due,
                    'tax', f.tax_total
                ),
                'status', f.payment_status,
                'mode', f.payment_mode,
                'clinic', f.clinic_name
            ) ORDER BY f.created_at DESC
        ), '[]'::jsonb),
        (SELECT txn_count FROM stats_agg)
    INTO _stats, _charts, _transactions, _total_count
    FROM (
        SELECT * FROM filtered_invoices 
        ORDER BY created_at DESC 
        LIMIT _page_size OFFSET _offset
    ) f;

    RETURN jsonb_build_object(
        'meta', jsonb_build_object(
            'page', _page, 
            'size', _page_size, 
            'total_records', COALESCE(_total_count, 0)
        ),
        'summary', _stats,
        'analytics', _charts,
        'data', _transactions
    );
END;
$$;


--
-- Name: get_admin_medicines_paginated(integer, integer, text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_admin_medicines_paginated(_page integer DEFAULT 1, _page_size integer DEFAULT 50, _search text DEFAULT ''::text, _type_filter text DEFAULT 'all'::text, _show_discontinued boolean DEFAULT false) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _offset integer;
    _total_count bigint;
    _data jsonb;
BEGIN
    -- 1. Security Check
    IF public.auth_user_role() NOT IN ('admin', 'super_admin') THEN
        RAISE EXCEPTION 'Unauthorized: Only Admins can manage medicines.';
    END IF;

    _offset := (_page - 1) * _page_size;

    -- 2. Query Construction (CTE)
    WITH filtered_meds AS (
        SELECT
            id,
            name,
            manufacturer_name,
            salt_composition,
            short_composition1,
            short_composition2,
            type,
            price,
            pack_size_label,
            is_discontinued
            -- Removed updated_at
        FROM medicine_master
        WHERE
            -- A. Filter by Status
            (_show_discontinued IS TRUE OR is_discontinued IS FALSE)
            
            -- B. Filter by Type
            AND (_type_filter = 'all' OR _type_filter IS NULL OR type = _type_filter)
            
            -- C. Filter by Text
            AND (
                _search = '' OR _search IS NULL OR
                name ILIKE '%' || _search || '%' OR
                salt_composition ILIKE '%' || _search || '%' OR
                manufacturer_name ILIKE '%' || _search || '%'
            )
    ),
    count_cte AS (
        SELECT COUNT(*) as total FROM filtered_meds
    )
    SELECT
        COALESCE(jsonb_agg(
            jsonb_build_object(
                'id', f.id,
                'name', f.name,
                'manufacturer', f.manufacturer_name,
                'generic', f.salt_composition,
                'composition_short', TRIM(BOTH ' ' FROM CONCAT_WS(' + ', NULLIF(f.short_composition1, ''), NULLIF(f.short_composition2, ''))),
                'type', f.type,
                'price', f.price,
                'pack_size', f.pack_size_label,
                'is_discontinued', f.is_discontinued
            ) ORDER BY f.name ASC
        ), '[]'::jsonb),
        (SELECT total FROM count_cte)
    INTO _data, _total_count
    FROM (
        SELECT * FROM filtered_meds
        ORDER BY name ASC
        LIMIT _page_size OFFSET _offset
    ) f;

    RETURN jsonb_build_object(
        'data', _data,
        'meta', jsonb_build_object(
            'current_page', _page,
            'page_size', _page_size,
            'total_records', COALESCE(_total_count, 0),
            'total_pages', CEIL(COALESCE(_total_count, 0)::numeric / GREATEST(_page_size, 1))
        )
    );
END;
$$;


--
-- Name: get_admin_user_list(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_admin_user_list() RETURNS TABLE(id uuid, full_name text, email text, role public.user_role, clinic_id uuid, is_active boolean, last_sign_in_at timestamp with time zone)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  IF auth_user_role() != 'admin' THEN
    RAISE EXCEPTION 'Access Denied';
  END IF;

  RETURN QUERY 
  SELECT 
    p.id, p.full_name, p.email, p.role, p.clinic_id, p.is_active, au.last_sign_in_at
  FROM public.profiles p
  JOIN auth.users au ON p.id = au.id
  ORDER BY au.created_at DESC;
END;
$$;


--
-- Name: get_appointment_clinical_details(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_appointment_clinical_details(_appointment_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _result jsonb;
BEGIN
    SELECT jsonb_build_object(
        -- 1. Patient Context (Restored: flags, age, gender)
        'patient', jsonb_build_object(
            'id', p.id,
            'full_name', p.full_name,
            'age', p.age,
            'gender', p.gender,
            'uhid', p.uhid,
            'phone', p.phone,
            'flags', p.access_flags -- Critical for staff alerts
        ),
        
        -- 2. Meta (UPDATED: Added Balance/Paid info, kept Token/Doc)
        'meta', jsonb_build_object(
            'appointment_id', a.id,
            'date', a.start_time,
            'status', a.status,
            'doctor_name', dr_p.full_name,
            'specialty', dr.specialty,
            'token_number', q.token_number,
            
            -- NEW FINANCIAL FIELDS
            'invoice_id', i.id,
            'invoice_number', i.invoice_number,
            'payment_status', i.payment_status,
            'total_amount', i.grand_total,
            'amount_paid', COALESCE(i.amount_paid, 0),
            'balance_due', (i.grand_total - COALESCE(i.amount_paid, 0))
        ),
        
        -- 3. Consultation (Restored: Vitals, Next Visit)
        'consultation', CASE WHEN c.id IS NULL THEN NULL ELSE jsonb_build_object(
            'consultation_id', c.id,
            'vitals', c.vitals_snapshot,
            'next_visit_date', c.next_visit_date,
            'next_visit_text', c.next_visit_text,
            'diagnosis', c.diagnosis_codes 
        ) END,

        -- 4. Medicines (RESTORED: 'type' was missing in previous draft)
        'medicines', (
            SELECT COALESCE(jsonb_agg(
                jsonb_build_object(
                    'name', COALESCE(m.name, pi.medicine_name_manual),
                    'type', m.type, -- ✅ RESTORED
                    'frequency', pi.frequency,
                    'duration', pi.duration,
                    'instruction', pi.instructions_timing
                ) ORDER BY pi.sort_order ASC
            ), '[]'::jsonb)
            FROM prescription_items pi
            LEFT JOIN medicine_master m ON pi.medicine_master_id = m.id
            WHERE c.id IS NOT NULL AND pi.consultation_id = c.id
        ),

        -- 5. Labs (RESTORED: 'instruction' was missing in previous draft)
        'labs', (
            SELECT COALESCE(jsonb_agg(
                jsonb_build_object(
                    'test', lo.test_name,
                    'instruction', lo.instruction, -- ✅ RESTORED
                    'completed', lo.is_completed
                )
            ), '[]'::jsonb)
            FROM lab_orders lo
            WHERE c.id IS NOT NULL AND lo.consultation_id = c.id
        )
    )
    INTO _result
    FROM appointments a
    JOIN patients p ON a.patient_id = p.id
    JOIN profiles dr_p ON a.doctor_id = dr_p.id
    JOIN doctors dr ON dr.profile_id = dr_p.id
    -- Left joins to handle cases where these records don't exist yet
    LEFT JOIN queue_tokens q ON q.appointment_id = a.id
    LEFT JOIN invoices i ON i.appointment_id = a.id
    LEFT JOIN consultations c ON c.appointment_id = a.id
    WHERE a.id = _appointment_id;

    RETURN _result;
END;
$$;


--
-- Name: get_appointment_details_by_id(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_appointment_details_by_id(_appointment_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_build_object(
            'appointment', (
                SELECT to_jsonb(a) || jsonb_build_object(
                    'doctor_name', dr.full_name,
                    'patient_name', p.full_name,
                    'patient_phone', p.phone,
                    'patient_uhid', p.uhid
                )
                FROM appointments a
                JOIN patients p ON a.patient_id = p.id
                JOIN profiles dr ON a.doctor_id = dr.id
                WHERE a.id = _appointment_id
            ),
            'invoice', (
                SELECT to_jsonb(i) FROM invoices i WHERE i.appointment_id = _appointment_id
            ),
            'queue_token', (
                SELECT jsonb_build_object('token_number', q.token_number, 'status', q.status)
                FROM queue_tokens q WHERE q.appointment_id = _appointment_id
            )
        )
    );
END;
$$;


--
-- Name: get_appointment_timeline(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_appointment_timeline(_appointment_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _clinic_id uuid;
    _timeline_data jsonb;
BEGIN
    -- A. Security Check
    SELECT clinic_id INTO _clinic_id 
    FROM appointments 
    WHERE id = _appointment_id;

    IF _clinic_id IS NULL THEN 
        RETURN '[]'::jsonb; 
    END IF;

    IF NOT public.is_super_admin() AND public.auth_my_clinic_id() != _clinic_id THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    -- B. Build Timeline
    WITH timeline_events AS (
        -- 1. CREATION
        SELECT 
            a.created_at AS event_time,
            'booking_created' AS event_type,
            'Appointment Booked' AS title,
            ('Booked for ' || to_char(a.start_time, 'DD Mon YYYY, HH12:MI AM')) AS description,
            p.full_name AS actor_name,
            'primary' AS color
        FROM appointments a
        LEFT JOIN profiles p ON a.created_by = p.id
        WHERE a.id = _appointment_id

        UNION ALL

        -- 2. CHECK-IN (Static)
        SELECT 
            a.checked_in_at, 'status_change', 'Patient Checked In', 
            'Patient arrived at clinic', NULL, 'info'
        FROM appointments a
        WHERE a.id = _appointment_id AND a.checked_in_at IS NOT NULL

        UNION ALL

        -- 3. CONSULT START (Static)
        SELECT 
            a.consult_started_at, 'clinical_event', 'Consultation Started', 
            'Doctor entered the room', dr_p.full_name, 'warning'
        FROM appointments a
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        WHERE a.id = _appointment_id AND a.consult_started_at IS NOT NULL

        UNION ALL

        -- 4. CONSULT END (Static)
        SELECT 
            a.consult_ended_at, 'clinical_event', 'Consultation Completed', 
            'Prescription generated', dr_p.full_name, 'success'
        FROM appointments a
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        WHERE a.id = _appointment_id AND a.consult_ended_at IS NOT NULL

        UNION ALL

        -- 5. PAYMENTS (Ledger)
        SELECT 
            ip.payment_date, 'payment', 'Payment Received', 
            ('Amount: ' || ip.amount || ' | Mode: ' || ip.payment_mode), 
            p.full_name, 'success'
        FROM invoice_payments ip
        JOIN invoices i ON ip.invoice_id = i.id
        LEFT JOIN profiles p ON ip.created_by = p.id
        WHERE i.appointment_id = _appointment_id

        UNION ALL

        -- 6. AUDIT LOGS: RESCHEDULE & CANCEL
        -- We query the logs broadly and categorize using CASE statements
        SELECT 
            al.created_at,
            CASE 
                WHEN (al.details->'new'->>'status') = 'cancelled' THEN 'cancellation'
                ELSE 'reschedule'
            END AS event_type,
            CASE 
                WHEN (al.details->'new'->>'status') = 'cancelled' THEN 'Appointment Cancelled'
                ELSE 'Appointment Rescheduled'
            END AS title,
            CASE 
                WHEN (al.details->'new'->>'status') = 'cancelled' THEN 
                     'Status updated to Cancelled'
                ELSE 
                     -- Describe the time change if it happened
                     CASE 
                        WHEN (al.details->'old'->>'start_time') != (al.details->'new'->>'start_time') THEN
                             'Moved from ' || 
                             COALESCE(to_char((al.details->'old'->>'start_time')::timestamp, 'DD Mon HH12:MI AM'), '?') || 
                             ' to ' || 
                             COALESCE(to_char((al.details->'new'->>'start_time')::timestamp, 'DD Mon HH12:MI AM'), '?')
                        ELSE 'Rescheduled (Details updated)'
                     END
            END AS description,
            p.full_name,
            CASE 
                WHEN (al.details->'new'->>'status') = 'cancelled' THEN 'destructive'
                ELSE 'orange'
            END AS color
        FROM audit_logs al
        LEFT JOIN profiles p ON al.user_id = p.id
        WHERE al.resource_id = _appointment_id 
        AND al.action = 'appointments_UPDATE'
        AND (
            -- Capture CANCELLATIONS
            (al.details->'new'->>'status') = 'cancelled'
            OR 
            -- Capture RESCHEDULES (Status change OR Time change)
            (al.details->'new'->>'status') = 'rescheduled'
            OR
            (al.details->'old'->>'start_time') != (al.details->'new'->>'start_time')
        )
    )
    SELECT jsonb_agg(t ORDER BY t.event_time DESC)
    INTO _timeline_data
    FROM timeline_events t;

    RETURN COALESCE(_timeline_data, '[]'::jsonb);
END;
$$;


--
-- Name: get_appointments_grid(uuid, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_appointments_grid(_clinic_id uuid, _date date) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_agg(t) FROM (
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
            WHERE a.clinic_id = _clinic_id 
              AND a.start_time::DATE = _date
              AND a.status != 'cancelled'
        ) t
    );
END;
$$;


--
-- Name: get_available_slots(uuid, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_available_slots(_doctor_id uuid, _date date) RETURNS TABLE(slot_time time without time zone, is_available boolean)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _start TIME; _end TIME; _avg INT;
    _is_today BOOLEAN := (_date = CURRENT_DATE);
BEGIN
    SELECT start_time, end_time, avg_consult_time_min INTO _start, _end, _avg
    FROM doctor_schedules ds
    JOIN doctors d ON ds.doctor_id = d.profile_id
    WHERE ds.doctor_id = _doctor_id 
    AND ds.day_of_week = EXTRACT(DOW FROM _date)::INT;

    IF NOT FOUND THEN RETURN; END IF;

    RETURN QUERY
    SELECT 
        series_slot::TIME, 
        (
            -- Slot is not already booked
            NOT EXISTS (
                SELECT 1 FROM appointments a 
                WHERE a.doctor_id = _doctor_id 
                AND a.start_time::DATE = _date
                AND a.start_time::TIME = series_slot::TIME
                AND a.status NOT IN ('cancelled')
            )
            -- AND Slot is not in the past (if today)
            AND (NOT _is_today OR series_slot::TIME > CURRENT_TIME + INTERVAL '5 minutes')
        ) as is_available
    FROM generate_series(
        (_date || ' ' || _start)::timestamp, 
        (_date || ' ' || _end)::timestamp - (_avg || ' minutes')::interval, 
        (_avg || ' minutes')::interval
    ) AS series_slot;
END;
$$;


--
-- Name: get_booking_init_data(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_booking_init_data(_clinic_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _doctors jsonb;
BEGIN
    SELECT jsonb_agg(
        jsonb_build_object(
            'doctor_id', p.id,
            'full_name', p.full_name,
            'specialty', d.specialty,
            
            -- ✅ RESTORED OLD LOGIC: Priority Check for Fees
            -- 1. Try 'consultation_first' (New Patient Fee)
            -- 2. Try 'consultation' (Standard Fee)
            -- 3. Default to 0
            'consult_fee', COALESCE(
                (d.fees_structure->>'consultation_first')::numeric,
                (d.fees_structure->>'consultation')::numeric,
                0
            ),
            
            'avg_consult_time_min', d.avg_consult_time_min,
            'is_available', d.is_available,
            
            -- ✅ KEPT NEW LOGIC: Dynamic Schedule Array
            'schedule', COALESCE((
                SELECT jsonb_agg(jsonb_build_object(
                    'day', ds.day_of_week,
                    'start', to_char(ds.start_time, 'HH24:MI'),
                    'end', to_char(ds.end_time, 'HH24:MI')
                ))
                FROM doctor_schedules ds
                WHERE ds.doctor_id = p.id
            ), '[]'::jsonb)
        )
    ) INTO _doctors
    FROM profiles p
    JOIN doctors d ON d.profile_id = p.id
    WHERE p.clinic_id = _clinic_id
    AND p.role = 'doctor'
    AND p.is_active = true; -- Kept this useful filter from the new version

    RETURN jsonb_build_object('doctors', COALESCE(_doctors, '[]'::jsonb));
END;
$$;


--
-- Name: get_clinic_appointments_list(uuid, integer, integer, date, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_clinic_appointments_list(_clinic_id uuid, _page integer DEFAULT 1, _page_size integer DEFAULT 10, _date_filter date DEFAULT NULL::date, _search_text text DEFAULT ''::text) RETURNS TABLE(id uuid, start_time timestamp with time zone, status public.appointment_status, patient_name text, patient_phone text, patient_uhid text, doctor_name text, invoice_status public.payment_status, amount numeric, amount_paid numeric, balance_due numeric, total_count bigint)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        a.id,
        a.start_time,
        a.status,
        p.full_name,
        p.phone,
        p.uhid,
        dr_p.full_name AS doctor_name,
        i.payment_status,
        i.grand_total as amount, -- Mapped to 'amount' to keep old UI working
        COALESCE(i.amount_paid, 0) as amount_paid,
        (i.grand_total - COALESCE(i.amount_paid, 0)) as balance_due,
        COUNT(*) OVER() AS total_count
    FROM appointments a
    JOIN patients p ON a.patient_id = p.id
    JOIN profiles dr_p ON a.doctor_id = dr_p.id
    LEFT JOIN invoices i ON i.appointment_id = a.id
    WHERE a.clinic_id = _clinic_id
      AND (_date_filter IS NULL OR a.start_time::DATE = _date_filter)
      AND (
          _search_text = '' 
          OR p.full_name ILIKE '%' || _search_text || '%'
          OR p.phone ILIKE _search_text || '%'
          OR p.uhid ILIKE _search_text || '%'
      )
    ORDER BY a.start_time DESC
    LIMIT _page_size
    OFFSET (_page - 1) * _page_size;
END;
$$;


--
-- Name: get_doctor_active_queue(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_doctor_active_queue(p_doctor_id uuid) RETURNS TABLE(token_number integer, patient_name text, age integer, gender text, uhid text, appointment_id uuid, queue_status text, payment_status public.payment_status, amount_due numeric, access_flags jsonb, checked_in_at timestamp with time zone, wait_time_mins integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        qt.token_number,
        p.full_name,
        p.age,
        p.gender::TEXT,
        p.uhid,
        a.id as appointment_id,
        qt.status::text as queue_status,
        i.payment_status,
        i.grand_total as amount_due,
        p.access_flags,
        a.checked_in_at,
        -- Calculate wait time safely
        COALESCE(ROUND(EXTRACT(EPOCH FROM (NOW() - a.checked_in_at)) / 60)::integer, 0)
    FROM 
        queue_tokens qt
    JOIN 
        appointments a ON qt.appointment_id = a.id
    JOIN 
        patients p ON a.patient_id = p.id
    LEFT JOIN 
        invoices i ON i.appointment_id = a.id
    WHERE 
        qt.doctor_id = p_doctor_id
        AND qt.date_of_service = CURRENT_DATE
        -- Filter: Show Waiting + Active, Hide Scheduled/Completed
        AND qt.status IN ('waiting', 'called', 'in_consult')
    ORDER BY 
        -- Priority: Active first, then by token number
        CASE WHEN qt.status IN ('called', 'in_consult') THEN 0 ELSE 1 END ASC,
        qt.token_number ASC;
END;
$$;


--
-- Name: get_doctor_analytics(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_doctor_analytics(_doctor_id uuid) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
    _patients_today INT;
    _avg_minutes NUMERIC;
BEGIN
    -- 1. Count Patients Completed Today
    SELECT COUNT(*)
    INTO _patients_today
    FROM appointments
    WHERE doctor_id = _doctor_id
    AND status = 'completed'
    AND start_time::DATE = CURRENT_DATE;

    -- 2. Calculate Average Consult Time (Based on last 30 days for better data density)
    -- Logic: Difference between consult_ended_at and consult_started_at
    SELECT COALESCE(ROUND(AVG(EXTRACT(EPOCH FROM (consult_ended_at - consult_started_at)) / 60)::numeric, 1), 0)
    INTO _avg_minutes
    FROM appointments
    WHERE doctor_id = _doctor_id
    AND status = 'completed'
    AND consult_started_at IS NOT NULL 
    AND consult_ended_at IS NOT NULL
    AND start_time > (CURRENT_DATE - INTERVAL '30 days');

    RETURN jsonb_build_object(
        'patients_seen_today', _patients_today,
        'avg_consult_time_min', _avg_minutes
    );
END;
$$;


--
-- Name: get_doctor_appointments_history(integer, integer, date, date, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_doctor_appointments_history(_page integer DEFAULT 1, _page_size integer DEFAULT 10, _start_date date DEFAULT NULL::date, _end_date date DEFAULT NULL::date, _search_text text DEFAULT ''::text, _status_filter text DEFAULT 'all'::text) RETURNS jsonb
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _doctor_id uuid;
    _result jsonb;
    _offset integer;
BEGIN
    -- 1. Get Logged in Doctor ID
    _doctor_id := auth.uid();
    
    -- Calculate Offset
    _offset := (_page - 1) * _page_size;

    -- 2. Complex Query wrapped in CTE for Pagination + Total Count
    WITH filtered_data AS (
        SELECT 
            a.id AS appointment_id,
            a.appointment_number,
            a.start_time,
            a.status,
            a.type,
            p.full_name AS patient_name,
            p.uhid,
            p.phone,
            p.age,
            p.gender,
            -- Get diagnosis preview if available
            c.diagnosis_codes,
            -- Check if consultation exists (for enabling 'Print' button)
            (c.id IS NOT NULL) as has_consultation
        FROM appointments a
        JOIN patients p ON a.patient_id = p.id
        LEFT JOIN consultations c ON c.appointment_id = a.id
        WHERE 
            a.doctor_id = _doctor_id
            -- Date Filters (If provided)
            AND (_start_date IS NULL OR a.start_time::DATE >= _start_date)
            AND (_end_date IS NULL OR a.start_time::DATE <= _end_date)
            -- Status Filter
            AND (_status_filter = 'all' OR _status_filter = '' OR a.status::text = _status_filter)
            -- Search Text (Matches Name, Phone, UHID, Appt Number)
            AND (
                _search_text = '' OR 
                p.full_name ILIKE '%' || _search_text || '%' OR
                p.phone ILIKE '%' || _search_text || '%' OR
                p.uhid ILIKE '%' || _search_text || '%' OR
                a.appointment_number ILIKE '%' || _search_text || '%'
            )
    ),
    total_count_cte AS (
        SELECT COUNT(*) as total FROM filtered_data
    )
    SELECT 
        jsonb_build_object(
            'data', COALESCE(jsonb_agg(
                jsonb_build_object(
                    'appointment_id', f.appointment_id,
                    'appointment_number', f.appointment_number,
                    'date', f.start_time,
                    'status', f.status,
                    'type', f.type,
                    'patient', jsonb_build_object(
                        'name', f.patient_name,
                        'uhid', f.uhid,
                        'details', CONCAT(f.age, 'Y / ', f.gender),
                        'phone', f.phone
                    ),
                    'diagnosis', f.diagnosis_codes,
                    'can_print', f.has_consultation -- Frontend flag: Show "Print" button if true
                ) ORDER BY f.start_time DESC
            ), '[]'::jsonb),
            'meta', jsonb_build_object(
                'total_records', (SELECT total FROM total_count_cte),
                'page', _page,
                'page_size', _page_size
            )
        )
    INTO _result
    FROM (
        SELECT * FROM filtered_data
        ORDER BY start_time DESC
        LIMIT _page_size OFFSET _offset
    ) f;

    RETURN _result;
END;
$$;


--
-- Name: get_doctor_dashboard_metrics(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_doctor_dashboard_metrics(p_doctor_id uuid) RETURNS TABLE(waiting_count bigint, completed_today bigint, avg_consult_time_mins numeric, avg_wait_time_mins numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        -- 1. Real Waiting Count (Sitting in lobby)
        (SELECT COUNT(*) 
         FROM queue_tokens 
         WHERE doctor_id = p_doctor_id 
           AND date_of_service = CURRENT_DATE 
           AND status = 'waiting'), -- Explicitly only waiting
           
        -- 2. Completed Today
        (SELECT COUNT(*) 
         FROM appointments 
         WHERE doctor_id = p_doctor_id 
           AND start_time::DATE = CURRENT_DATE 
           AND status = 'completed'),

        -- 3. Avg Consult Duration (Clinical Efficiency)
        -- (Ended - Started)
        (SELECT COALESCE(ROUND(AVG(EXTRACT(EPOCH FROM (consult_ended_at - consult_started_at)) / 60)::numeric, 1), 0)
         FROM appointments
         WHERE doctor_id = p_doctor_id
           AND status = 'completed'
           AND consult_ended_at IS NOT NULL 
           AND consult_started_at IS NOT NULL
           AND start_time > (NOW() - INTERVAL '30 days')), -- Last 30 days trend

        -- 4. Avg Wait Time (Patient Experience)
        -- (Started - Arrived) for patients seen today
        (SELECT COALESCE(ROUND(AVG(EXTRACT(EPOCH FROM (consult_started_at - checked_in_at)) / 60)::numeric, 0), 0)
         FROM appointments
         WHERE doctor_id = p_doctor_id
           AND start_time::DATE = CURRENT_DATE
           AND status IN ('in_consult', 'completed') -- Only for those who actually entered the room
           AND checked_in_at IS NOT NULL
           AND consult_started_at IS NOT NULL);
END;
$$;


--
-- Name: get_doctor_fee_config(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_doctor_fee_config(_doctor_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_build_object(
            'doctor_name', p.full_name,
            'specialty', d.specialty,
            'fees', d.fees_structure,
            'avg_time', d.avg_consult_time_min
        )
        FROM doctors d
        JOIN profiles p ON d.profile_id = p.id
        WHERE d.profile_id = _doctor_id
    );
END;
$$;


--
-- Name: get_doctors_v2(uuid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_doctors_v2(_clinic_id uuid, _search text DEFAULT NULL::text) RETURNS TABLE(doctor_id uuid, full_name text, specialty text, consult_fee numeric, avg_consult_time_min integer, is_available boolean)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id as doctor_id,
        p.full_name,
        d.specialty,
        (d.fees_structure->>'consultation_fee')::numeric as consult_fee,
        d.avg_consult_time_min,
        d.is_available
    FROM profiles p
    JOIN doctors d ON p.id = d.profile_id
    WHERE p.clinic_id = _clinic_id
      AND p.role = 'doctor'
      AND (
          _search IS NULL OR _search = '' OR
          p.full_name ILIKE '%' || _search || '%' OR
          d.specialty ILIKE '%' || _search || '%'
      )
    ORDER BY p.full_name ASC;
END;
$$;


--
-- Name: get_finance_transactions(date, date, text, text, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_finance_transactions(_start_date date, _end_date date, _status_filter text DEFAULT NULL::text, _search_text text DEFAULT ''::text, _page integer DEFAULT 1, _page_size integer DEFAULT 10) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'temp'
    AS $$
DECLARE
    _clinic_id uuid;
    _stats jsonb;
    _transactions jsonb;
    _total_count bigint;
    _offset integer;
BEGIN
    -- 1. Security Check
    SELECT clinic_id INTO _clinic_id FROM profiles WHERE id = auth.uid();
    IF _clinic_id IS NULL THEN RAISE EXCEPTION 'Access Denied'; END IF;

    _offset := (_page - 1) * _page_size;

    -- 2. Aggregate Stats (Ignoring status filter for context)
    SELECT jsonb_build_object(
        'total_billed',    COALESCE(SUM(grand_total), 0),
        'total_collected', COALESCE(SUM(amount_paid), 0),
        'total_pending',   COALESCE(SUM(grand_total - amount_paid), 0),
        'txn_count',       COUNT(*)
    )
    INTO _stats
    FROM invoices i
    JOIN appointments a ON i.appointment_id = a.id
    JOIN patients p ON a.patient_id = p.id
    WHERE a.clinic_id = _clinic_id
      AND i.created_at::DATE BETWEEN _start_date AND _end_date
      AND (
          _search_text = '' OR 
          i.invoice_number ILIKE '%' || _search_text || '%' OR
          p.full_name ILIKE '%' || _search_text || '%' OR
          p.phone ILIKE '%' || _search_text || '%'
      );

    -- 3. Filtered List
    WITH filtered_data AS (
        SELECT 
            i.id, i.invoice_number, i.created_at, i.grand_total, i.amount_paid, i.payment_status, i.payment_mode,
            p.full_name AS patient_name, p.phone AS patient_phone, p.uhid AS patient_uhid,
            dr_p.full_name AS doctor_name
        FROM invoices i
        JOIN appointments a ON i.appointment_id = a.id
        JOIN patients p ON a.patient_id = p.id
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        WHERE a.clinic_id = _clinic_id
          AND i.created_at::DATE BETWEEN _start_date AND _end_date
          AND (_status_filter IS NULL OR _status_filter = 'all' OR _status_filter = '' OR i.payment_status::text = _status_filter)
          AND (
              _search_text = '' OR 
              i.invoice_number ILIKE '%' || _search_text || '%' OR
              p.full_name ILIKE '%' || _search_text || '%' OR
              p.phone ILIKE '%' || _search_text || '%'
          )
    ),
    total_count_query AS ( SELECT COUNT(*) as count FROM filtered_data ),
    paginated_rows AS (
        SELECT * FROM filtered_data ORDER BY created_at DESC LIMIT _page_size OFFSET _offset
    )
    SELECT 
        (SELECT count FROM total_count_query),
        COALESCE(jsonb_agg(
            jsonb_build_object(
                'invoice_id', id,
                'invoice_number', invoice_number,
                'created_at', created_at,
                'amount', grand_total,
                'paid', amount_paid,
                'balance', (grand_total - amount_paid),
                'status', payment_status,
                'mode', payment_mode,
                'patient', jsonb_build_object('name', patient_name, 'phone', patient_phone, 'uhid', patient_uhid),
                'doctor_name', doctor_name
            ) ORDER BY created_at DESC
        ), '[]'::jsonb)
    INTO _total_count, _transactions
    FROM paginated_rows;

    RETURN jsonb_build_object(
        'stats', _stats,
        'transactions', _transactions,
        'meta', jsonb_build_object('total_records', COALESCE(_total_count, 0), 'current_page', _page)
    );
END;
$$;


--
-- Name: get_financial_report(date, date, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_financial_report(_start_date date, _end_date date, _clinic_id uuid) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
    _total DECIMAL;
    _tax DECIMAL;
    _breakdown JSONB;
BEGIN
    IF auth.user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    -- Calc Totals
    SELECT COALESCE(SUM(grand_total), 0), COALESCE(SUM(grand_total - sub_total), 0)
    INTO _total, _tax
    FROM invoices i
    JOIN appointments a ON i.appointment_id = a.id
    WHERE a.clinic_id = _clinic_id
    AND i.created_at::DATE BETWEEN _start_date AND _end_date
    AND i.payment_status = 'paid';

    -- Calc Breakdown
    SELECT jsonb_object_agg(payment_mode, mode_total) INTO _breakdown
    FROM (
        SELECT payment_mode, SUM(grand_total) as mode_total
        FROM invoices i
        JOIN appointments a ON i.appointment_id = a.id
        WHERE a.clinic_id = _clinic_id
        AND i.created_at::DATE BETWEEN _start_date AND _end_date
        AND i.payment_status = 'paid'
        GROUP BY payment_mode
    ) t;

    RETURN jsonb_build_object(
        'total_revenue', _total,
        'tax_collected', _tax,
        'breakdown', COALESCE(_breakdown, '{}'::jsonb)
    );
END;
$$;


--
-- Name: get_global_dashboard_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_global_dashboard_stats() RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _stats jsonb;
BEGIN
    -- Security: Only Admins
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    SELECT jsonb_agg(t) INTO _stats
    FROM (
        SELECT 
            c.id,
            c.name,
            c.city,
            -- Live Activity Metric: Count appointments updated in last 2 hours
            (SELECT COUNT(*) FROM appointments a 
             WHERE a.clinic_id = c.id 
             AND a.updated_at > (NOW() - INTERVAL '2 hours')) as activity_score,
            -- Queue Depth
            (SELECT COUNT(*) FROM queue_tokens q 
             WHERE q.clinic_id = c.id 
             AND q.date_of_service = CURRENT_DATE 
             AND q.status = 'waiting') as patients_waiting
        FROM clinics c
        WHERE c.settings->>'is_active' != 'false' -- Optional filter
    ) t;

    RETURN COALESCE(_stats, '[]'::jsonb);
END;
$$;


--
-- Name: get_inventory_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_inventory_stats() RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN jsonb_build_object(
        'total_medicines', (SELECT count(*) FROM medicine_master),
        'discontinued', (SELECT count(*) FROM medicine_master WHERE is_discontinued = true),
        'services_count', (SELECT count(*) FROM service_master)
    );
END;
$$;


--
-- Name: get_invoice_print_data(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_invoice_print_data(_invoice_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_build_object(
            -- 1. META (Restored Original)
            'meta', jsonb_build_object(
                'generated_at', to_char(NOW(), 'YYYY-MM-DD HH24:MI:SS'),
                'invoice_no', COALESCE(i.invoice_number, substring(i.id::text, 1, 8)), 
                'full_invoice_id', i.id
            ),
            
            -- 2. CLINIC (Restored Address Formatting & Branding)
            'clinic', jsonb_build_object(
                'name', c.name,
                'address_full', CONCAT_WS(', ', c.address_line_1, c.address_line_2, c.city, c.state || CASE WHEN c.pincode IS NOT NULL THEN ' - ' || c.pincode ELSE '' END),
                'contacts', jsonb_build_object('primary', c.phone_primary, 'email', c.email_contact),
                'branding', jsonb_build_object('logo', c.logo_url, 'footer_msg', c.footer_text),
                'tax_info', c.settings->>'gstin'
            ),
            
            -- 3. DOCTOR (Restored Reg No, Quals, Signature)
            'doctor', jsonb_build_object(
                'name', dr_p.full_name,
                'reg_no', dr.registration_number,
                'specialty', dr.specialty,
                'qualifications', dr.qualifications,
                'signature', dr.digital_signature_url
            ),
            
            -- 4. PATIENT (Restored Age/Gender Combo & Address)
            'patient', jsonb_build_object(
                'name', p.full_name,
                'uhid', p.uhid,
                'phone', p.phone,
                'age_gender', CONCAT_WS(' / ', p.age::text, p.gender),
                'address_full', CONCAT_WS(', ', p.address_street, p.district, p.state, p.pincode)
            ),
            
            -- 5. APPOINTMENT (Restored Token, Room, Staff Name)
            'appointment', jsonb_build_object(
                'date', to_char(a.start_time, 'YYYY-MM-DD'),
                'start_time', to_char(a.start_time, 'HH24:MI'),
                'end_time', to_char(a.end_time, 'HH24:MI'),
                'type', a.type,
                'appt_number', a.appointment_number, 
                'token_number', COALESCE(q.token_number, 0), 
                'room', COALESCE(q.room_number, 'Front Desk'),
                'created_by_name', COALESCE(staff.full_name, 'System')
            ),
            
            -- 6. FINANCIALS (UPDATED: Merged Old Structure with New Ledger Logic)
            'financials', jsonb_build_object(
                'status', i.payment_status,
                'sub_total', i.sub_total,
                'tax_total', i.tax_total,
                'grand_total', i.grand_total,
                
                -- NEW: Ledger Specific Fields
                'amount_paid', COALESCE(i.amount_paid, 0),
                'balance_due', (i.grand_total - COALESCE(i.amount_paid, 0)),
                
                -- NEW: Payment History Array (Fetched from new table)
                'payment_history', (
                    SELECT COALESCE(jsonb_agg(
                        jsonb_build_object(
                            'date', to_char(ip.payment_date, 'YYYY-MM-DD HH24:MI'),
                            'mode', ip.payment_mode,
                            'ref', ip.transaction_ref,
                            'amount', ip.amount,
                            'notes', ip.notes
                        ) ORDER BY ip.payment_date ASC
                    ), '[]'::jsonb)
                    FROM invoice_payments ip
                    WHERE ip.invoice_id = i.id
                ),

                -- RESTORED: Detailed Item List
                'items', (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'desc', ii.description, 
                            'qty', ii.quantity, 
                            'unit_price', ii.unit_price, 
                            'total', ii.total_price
                        )
                    )
                    FROM invoice_items ii WHERE ii.invoice_id = i.id
                )
            )
        )
        FROM invoices i
        JOIN appointments a ON i.appointment_id = a.id
        JOIN clinics c ON a.clinic_id = c.id
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        JOIN doctors dr ON dr.profile_id = dr_p.id
        JOIN patients p ON a.patient_id = p.id
        LEFT JOIN queue_tokens q ON q.appointment_id = a.id
        LEFT JOIN profiles staff ON a.created_by = staff.id
        WHERE i.id = _invoice_id
    );
END;
$$;


--
-- Name: get_live_queue_monitor(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_live_queue_monitor(_clinic_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
  RETURN jsonb_build_object(
      -- 1. EXPECTED ARRIVALS (New Section)
      -- These are patients with appointments today who haven't arrived yet.
      'scheduled', (
          SELECT COALESCE(jsonb_agg(t), '[]'::jsonb) FROM (
              SELECT 
                q.appointment_id,
                p.full_name, 
                p.phone,
                p.uhid,
                to_char(a.start_time, 'HH12:MI AM') as slot_time,
                d.full_name as doctor_name
              FROM queue_tokens q
              JOIN patients p ON q.patient_id = p.id
              JOIN appointments a ON q.appointment_id = a.id
              JOIN profiles d ON q.doctor_id = d.id
              WHERE q.clinic_id = _clinic_id 
                AND q.date_of_service = CURRENT_DATE 
                AND q.status = 'scheduled' -- The "Hidden" ones
              ORDER BY a.start_time ASC
          ) t
      ),
      -- 2. WAITING ROOM (The Lobby)
      'waiting', (
          SELECT COALESCE(jsonb_agg(t), '[]'::jsonb) FROM (
              SELECT 
                q.id as token_id,
                q.appointment_id,
                q.token_number, 
                p.full_name, 
                p.uhid,
                p.access_flags,
                d.full_name as doctor_name,
                -- Time since they were marked "Checked In"
                EXTRACT(EPOCH FROM (NOW() - a.checked_in_at))/60 as wait_time_mins,
                -- Boolean to show if vitals are done (Triage Status)
                (c.vitals_snapshot IS NOT NULL AND c.vitals_snapshot != '{}'::jsonb) as is_triaged
              FROM queue_tokens q
              JOIN patients p ON q.patient_id = p.id
              JOIN appointments a ON q.appointment_id = a.id
              JOIN profiles d ON q.doctor_id = d.id
              LEFT JOIN consultations c ON c.appointment_id = a.id
              WHERE q.clinic_id = _clinic_id 
                AND q.date_of_service = CURRENT_DATE 
                AND q.status = 'waiting'
              ORDER BY q.token_number ASC
          ) t
      ),
      -- 3. ACTIVE (With Doctor)
      'active', (
          SELECT COALESCE(jsonb_agg(t), '[]'::jsonb) FROM (
               SELECT 
                q.appointment_id,
                q.token_number, 
                p.full_name, 
                d.full_name as doctor_name, 
                q.room_number,
                EXTRACT(EPOCH FROM (NOW() - q.called_at))/60 as consult_duration
               FROM queue_tokens q
               JOIN patients p ON q.patient_id = p.id
               JOIN profiles d ON q.doctor_id = d.id
               WHERE q.clinic_id = _clinic_id 
                AND q.date_of_service = CURRENT_DATE 
                AND q.status IN ('called', 'in_consult')
          ) t
      )
  );
END;
$$;


--
-- Name: get_medicine_types(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_medicine_types() RETURNS jsonb
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_agg(DISTINCT type)
        FROM medicine_master
        WHERE type IS NOT NULL AND type != ''
    );
END;
$$;


--
-- Name: get_my_active_queue(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_my_active_queue(_doctor_id uuid) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_agg(t) FROM (
            SELECT 
                q.token_number, q.status, q.appointment_id,
                p.full_name, p.age, p.gender, p.uhid,
                p.access_flags -- Critical Flags
            FROM queue_tokens q
            JOIN patients p ON q.patient_id = p.id
            WHERE q.doctor_id = _doctor_id 
            AND q.date_of_service = CURRENT_DATE 
            AND q.status NOT IN ('completed', 'cancelled', 'no_show')
            ORDER BY q.token_number ASC
        ) t
    );
END;
$$;


--
-- Name: get_my_subscription_details(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_my_subscription_details() RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _clinic_id uuid;
    _result jsonb;
BEGIN
    _clinic_id := auth_my_clinic_id();
    
    IF _clinic_id IS NULL THEN 
        RETURN NULL; 
    END IF;

    SELECT jsonb_build_object(
        'clinic_name', c.name,
        'status', c.subscription_status,
        'ends_at', c.subscription_ends_at,
        'plan_name', pm.name,
        'plan_code', sub.plan_code,
        'limits', jsonb_build_object(
            'max_doctors', sub.limit_doctors,
            'sms_enabled', sub.limit_sms_enabled
        ),
        'usage', jsonb_build_object(
            'doctors_count', (SELECT count(*) FROM profiles WHERE clinic_id = _clinic_id AND role = 'doctor' AND is_active = true)
        )
    ) INTO _result
    FROM clinics c
    LEFT JOIN clinic_subscriptions sub ON c.id = sub.clinic_id AND sub.status = 'active'
    LEFT JOIN plan_master pm ON sub.plan_code = pm.code
    WHERE c.id = _clinic_id
    -- Order by ends_at to get the relevant active sub if multiple exist (unlikely due to logic, but safe)
    ORDER BY sub.ends_at DESC 
    LIMIT 1;

    RETURN _result;
END;
$$;


--
-- Name: get_patient_360_summary(uuid, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_patient_360_summary(_patient_id uuid, _doctor_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _result jsonb;
BEGIN
    SELECT jsonb_build_object(
        -- 1. HEADER: Patient Identity
        'patient', jsonb_build_object(
            'id', p.id,
            'full_name', p.full_name,
            'age', p.age,
            'gender', p.gender,
            'uhid', p.uhid,
            'phone', p.phone,
            'flags', p.access_flags,
            'address', CONCAT_WS(', ', p.address_street, p.district, p.state)
        ),

        -- 2. ALERTS: Medical Profile
        'medical_profile', (
            SELECT jsonb_build_object(
                'allergies', COALESCE(mp.allergies, '[]'::jsonb),
                'chronic_conditions', COALESCE(mp.chronic_conditions, '[]'::jsonb),
                'family_history', COALESCE(mp.family_history, '[]'::jsonb),
                'lifestyle', COALESCE(mp.lifestyle_tags, '{}'::jsonb)
            )
            FROM patient_medical_profiles mp 
            WHERE mp.patient_id = p.id
        ),

        -- 3. TIMELINE: Complete Clinical History
        'visit_history', (
            SELECT COALESCE(jsonb_agg(
                jsonb_build_object(
                    'appointment_id', a.id,
                    'visit_date', a.start_time,
                    'doctor_name', dr_p.full_name,
                    'specialty', dr.specialty,
                    'is_my_visit', (a.doctor_id = _doctor_id),
                    
                    -- Clinical Context
                    'diagnosis', c.diagnosis_codes,
                    'symptoms', c.symptoms_structured,
                    'notes', c.clinical_notes_internal,
                    'vitals', c.vitals_snapshot,
                    
                    -- Advice / Plan (Missing in previous version)
                    'advice', jsonb_build_object(
                        'next_visit_date', c.next_visit_date,
                        'next_visit_text', c.next_visit_text
                    ),

                    -- RX ITEMS (Matched exactly to Print Data)
                    'prescriptions', (
                        SELECT COALESCE(jsonb_agg(
                            jsonb_build_object(
                                'brand_name', COALESCE(m.name, pi.medicine_name_manual),
                                -- Complex Generic Logic to match Printer
                                'generic_name', TRIM(BOTH ' ' FROM CONCAT_WS(' + ', 
                                    NULLIF(TRIM(m.short_composition1), ''), 
                                    NULLIF(TRIM(m.short_composition2), '')
                                )),
                                'type', m.type,
                                'dosage', pi.frequency,
                                'duration', pi.duration,
                                'instruction', pi.instructions_timing,
                                'note', pi.special_instructions -- Added Notes
                            ) ORDER BY pi.sort_order
                        ), '[]'::jsonb)
                        FROM prescription_items pi
                        LEFT JOIN medicine_master m ON pi.medicine_master_id = m.id
                        WHERE pi.consultation_id = c.id
                    ),

                    -- LAB ORDERS (Matched fields to Print Data)
                    'lab_orders', (
                        SELECT COALESCE(jsonb_agg(
                            jsonb_build_object(
                                'test_name', lo.test_name,
                                'instruction', lo.instruction,
                                'is_completed', lo.is_completed
                            )
                        ), '[]'::jsonb)
                        FROM lab_orders lo
                        WHERE lo.consultation_id = c.id
                    )
                ) ORDER BY a.start_time DESC
            ), '[]'::jsonb)
            FROM appointments a
            JOIN profiles dr_p ON a.doctor_id = dr_p.id
            JOIN doctors dr ON dr.profile_id = dr_p.id
            LEFT JOIN consultations c ON c.appointment_id = a.id
            WHERE a.patient_id = p.id 
            AND a.status IN ('completed', 'in_consult')
        ),

        -- 4. DOCUMENTS
        'documents', (
            SELECT COALESCE(jsonb_agg(
                jsonb_build_object(
                    'id', d.id,
                    'name', d.file_name,
                    'url', d.file_url,
                    'category', d.category,
                    'date', d.uploaded_at,
                    'uploaded_by', u_p.full_name
                ) ORDER BY d.uploaded_at DESC
            ), '[]'::jsonb)
            FROM patient_documents d
            LEFT JOIN profiles u_p ON d.uploaded_by = u_p.id
            WHERE d.patient_id = p.id
        ),

        -- 5. TRENDS
        'vitals_trend', (
            SELECT COALESCE(jsonb_agg(
                jsonb_build_object(
                    'date', a.start_time,
                    'bp', c.vitals_snapshot->>'bp',
                    'weight', c.vitals_snapshot->>'weight',
                    'temp', c.vitals_snapshot->>'temp'
                ) ORDER BY a.start_time ASC
            ) FILTER (WHERE c.vitals_snapshot IS NOT NULL), '[]'::jsonb)
            FROM appointments a
            JOIN consultations c ON c.appointment_id = a.id
            WHERE a.patient_id = p.id
            LIMIT 20
        )
    )
    INTO _result
    FROM patients p
    WHERE p.id = _patient_id;

    RETURN _result;
END;
$$;


--
-- Name: get_patient_admin_history(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_patient_admin_history(_patient_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _profile_data jsonb;
    _appointments_data jsonb;
    _documents_data jsonb;
    _requester_clinic_id uuid;
    _patient_clinic_id uuid;
BEGIN
    -- A. Security Check (Manual)
    -- We fetch clinic IDs directly to ensure we aren't relying on stale context
    SELECT clinic_id INTO _patient_clinic_id FROM patients WHERE id = _patient_id;
    SELECT clinic_id INTO _requester_clinic_id FROM profiles WHERE id = auth.uid();
    
    -- If not Super Admin, and not the patient themselves, enforce Clinic Match
    IF NOT public.is_super_admin() AND auth.uid() != _patient_id THEN
        IF _requester_clinic_id IS DISTINCT FROM _patient_clinic_id THEN
             RAISE EXCEPTION 'Unauthorized: Patient belongs to a different clinic.';
        END IF;
    END IF;

    -- B. Fetch Profile (Scope 1)
    SELECT to_jsonb(p) INTO _profile_data 
    FROM patients p 
    WHERE p.id = _patient_id;

    -- C. Fetch Appointments (Scope 2 - Isolated)
    -- We select from a subquery 'appt_rows' to strictly contain aliases
    SELECT COALESCE(jsonb_agg(appt_rows), '[]'::jsonb) INTO _appointments_data
    FROM (
        SELECT 
            a.id AS appointment_id,
            a.appointment_number,
            a.start_time,
            a.status,
            a.type,
            dr_p.full_name AS doctor_name,
            dr.specialty,
            
            -- Financials
            i.id AS invoice_id,
            i.invoice_number,
            i.grand_total AS amount,
            COALESCE(i.amount_paid, 0) AS amount_paid,
            (i.grand_total - COALESCE(i.amount_paid, 0)) AS balance_due,
            i.payment_status,
            i.payment_mode,
            
            -- Queue
            q.token_number
        FROM appointments a
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        LEFT JOIN doctors dr ON dr.profile_id = dr_p.id
        LEFT JOIN invoices i ON i.appointment_id = a.id
        LEFT JOIN queue_tokens q ON q.appointment_id = a.id
        WHERE a.patient_id = _patient_id
        ORDER BY a.start_time DESC
    ) appt_rows;

    -- D. Fetch Documents (Scope 3 - Isolated)
    SELECT COALESCE(jsonb_agg(doc_rows), '[]'::jsonb) INTO _documents_data
    FROM (
        SELECT 
            d.id,
            d.file_name,
            d.file_url,
            d.category,
            d.uploaded_at
        FROM patient_documents d
        WHERE d.patient_id = _patient_id
        ORDER BY d.uploaded_at DESC
    ) doc_rows;

    -- E. Combine and Return
    RETURN jsonb_build_object(
        'profile', _profile_data,
        'appointments', _appointments_data,
        'documents', _documents_data
    );
END;
$$;


--
-- Name: get_patient_documents(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_patient_documents(_patient_id uuid) RETURNS TABLE(id uuid, file_name text, file_url text, category public.file_category, uploaded_at timestamp with time zone, uploaded_by uuid)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        d.id, 
        d.file_name, 
        d.file_url, 
        d.category, 
        d.uploaded_at, 
        d.uploaded_by
    FROM public.patient_documents d
    JOIN public.patients p ON d.patient_id = p.id
    WHERE d.patient_id = _patient_id
    AND (
        -- 1. Super Admin: Access All
        public.is_super_admin()
        
        OR
        
        -- 2. Owner: Access Self
        (auth.uid() = _patient_id)
        
        OR 
        
        -- 3. Staff/Admin/Doctor: Access Own Clinic Only
        (
            EXISTS (
                SELECT 1 
                FROM public.profiles staff
                WHERE staff.id = auth.uid()
                AND staff.role IN ('admin', 'staff', 'doctor')
                AND staff.clinic_id = p.clinic_id -- The Core Check
            )
        )
    )
    ORDER BY d.uploaded_at DESC;
END;
$$;


--
-- Name: get_patient_followups(uuid, date, date, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_patient_followups(_clinic_id uuid, _start_date date, _end_date date, _page integer DEFAULT 1, _page_size integer DEFAULT 20) RETURNS TABLE(patient_id uuid, patient_name text, phone text, uhid text, address text, last_visit_date timestamp with time zone, next_visit_due_date date, next_visit_notes text, doctor_name text, is_already_booked boolean, total_count bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _offset integer := (_page - 1) * _page_size;
BEGIN
    RETURN QUERY
    WITH filtered_data AS (
        SELECT 
            p.id AS p_id,
            p.full_name,
            p.phone,
            p.uhid,
            
            -- Format Address: Handles empty fields gracefully (e.g. no double commas)
            TRIM(BOTH ', ' FROM CONCAT_WS(', ', 
                NULLIF(TRIM(p.address_street), ''), 
                NULLIF(TRIM(p.district), ''), 
                NULLIF(TRIM(p.state), ''),
                NULLIF(TRIM(p.pincode), '')
            )) AS formatted_address,
            
            -- Visit Details
            a.start_time AS last_visit_ts,
            c.next_visit_date,
            c.next_visit_text,
            dr_p.full_name AS doc_name,
            
            -- SMART CHECK: Has patient booked an appointment starting AFTER this visit?
            EXISTS (
                SELECT 1 
                FROM appointments future_a
                WHERE future_a.patient_id = p.id
                AND future_a.clinic_id = _clinic_id -- Only check bookings in THIS clinic
                AND future_a.start_time > a.start_time
                AND future_a.status NOT IN ('cancelled', 'no_show')
            ) as booked_status

        FROM consultations c
        JOIN appointments a ON c.appointment_id = a.id
        JOIN patients p ON a.patient_id = p.id
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        WHERE a.clinic_id = _clinic_id
          AND a.status IN ('completed', 'in_consult') -- Only show valid past visits
          AND c.next_visit_date IS NOT NULL
          AND c.next_visit_date BETWEEN _start_date AND _end_date
    ),
    total_calc AS (
        SELECT COUNT(*) as count FROM filtered_data
    )
    SELECT 
        f.p_id,
        f.full_name,
        f.phone,
        f.uhid,
        f.formatted_address,
        f.last_visit_ts,
        f.next_visit_date,
        f.next_visit_text,
        f.doc_name,
        f.booked_status,
        t.count
    FROM filtered_data f
    CROSS JOIN total_calc t
    ORDER BY 
        f.next_visit_date ASC, -- Urgent (earlier dates) first
        f.last_visit_ts DESC
    LIMIT _page_size 
    OFFSET _offset;
END;
$$;


--
-- Name: get_patient_medical_profile(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_patient_medical_profile(_patient_id uuid) RETURNS TABLE(patient_id uuid, allergies jsonb, chronic_conditions jsonb, lifestyle_tags jsonb, family_history jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        pm.patient_id,
        COALESCE(pm.allergies, '[]'::jsonb),
        COALESCE(pm.chronic_conditions, '[]'::jsonb),
        COALESCE(pm.lifestyle_tags, '{}'::jsonb),
        COALESCE(pm.family_history, '[]'::jsonb),
        pm.updated_at
    FROM patient_medical_profiles pm
    WHERE pm.patient_id = _patient_id;
END;
$$;


--
-- Name: get_patients_v2(uuid, text, public.gender_type, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_patients_v2(_clinic_id uuid, _search text DEFAULT NULL::text, _gender public.gender_type DEFAULT NULL::public.gender_type, _page integer DEFAULT 1, _page_size integer DEFAULT 10) RETURNS TABLE(id uuid, full_name text, phone text, uhid text, gender public.gender_type, age integer, created_at timestamp with time zone, total_count bigint)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _offset integer;
BEGIN
    _offset := (_page - 1) * _page_size;

    RETURN QUERY
    WITH filtered_patients AS (
        SELECT 
            p.id,
            p.full_name,
            p.phone,
            p.uhid,
            p.gender,
            p.age,
            p.created_at
        FROM patients p
        WHERE p.clinic_id = _clinic_id
          AND (_gender IS NULL OR p.gender = _gender)
          AND (
            _search IS NULL OR _search = '' OR
            p.full_name ILIKE '%' || _search || '%' OR
            p.phone ILIKE '%' || _search || '%' OR
            p.uhid ILIKE '%' || _search || '%'
          )
    ),
    total AS (
        SELECT count(*) as count FROM filtered_patients
    )
    SELECT 
        f.id,
        f.full_name,
        f.phone,
        f.uhid,
        f.gender,
        f.age,
        f.created_at,
        t.count
    FROM filtered_patients f, total t
    ORDER BY f.created_at DESC
    LIMIT _page_size
    OFFSET _offset;
END;
$$;


--
-- Name: get_prescription_print_data(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_prescription_print_data(_appointment_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_build_object(
            -- 1. DOCUMENT METADATA
            'meta', jsonb_build_object(
                'generated_at', to_char(NOW(), 'YYYY-MM-DD HH24:MI'),
                'appointment_number', a.appointment_number,
                'visit_type', a.type,
                'visit_date', to_char(a.start_time, 'DD Mon YYYY')
            ),

            -- 2. CLINIC BRANDING
            'clinic', jsonb_build_object(
                'name', cl.name,
                'logo_url', cl.logo_url,
                'header_image_url', cl.header_image_url,
                'phone', cl.phone_primary,
                'email', cl.email_contact,
                'address', CONCAT_WS(', ', cl.address_line_1, cl.city, cl.state, cl.pincode),
                'footer_text', cl.footer_text
            ),

            -- 3. DOCTOR DETAILS
            'doctor', jsonb_build_object(
                'name', dr_p.full_name,
                'specialty', dr.specialty,
                'qualifications', dr.qualifications,
                'reg_number', dr.registration_number,
                'signature_url', dr.digital_signature_url
            ),

            -- 4. PATIENT DEMOGRAPHICS
            'patient', jsonb_build_object(
                'name', p.full_name,
                'uhid', p.uhid,
                'age_gender', CONCAT(p.age, ' Y / ', p.gender),
                'phone', p.phone,
                'address', CONCAT_WS(', ', p.address_street, p.district),
                'known_allergies', CASE 
                    WHEN jsonb_typeof(mp.allergies) = 'array' THEN mp.allergies 
                    ELSE '[]'::jsonb 
                END
            ),

            -- 5. CLINICAL SNAPSHOT
            'clinical', CASE WHEN c.id IS NULL THEN NULL ELSE jsonb_build_object(
                'vitals', c.vitals_snapshot,
                'diagnosis', c.diagnosis_codes,
                'symptoms', c.symptoms_structured,
                'notes', c.clinical_notes_internal, -- Restored
                'chief_complaint', c.chief_complaint -- ✅ Added Chief Complaint
            ) END,

            -- 6. PRESCRIPTION ITEMS (Updated Logic)
            'rx_items', (
                SELECT COALESCE(jsonb_agg(
                    jsonb_build_object(
                        -- Medicine Name (Brand)
                        'brand_name', COALESCE(m.name, pi.medicine_name_manual),
                        
                        -- ✅ FIXED: ALWAYS use short_composition 1 + 2
                        'generic_name', TRIM(BOTH ' ' FROM CONCAT_WS(' + ', 
                            NULLIF(TRIM(m.short_composition1), ''), 
                            NULLIF(TRIM(m.short_composition2), '')
                        )),
                        
                        'type', m.type,
                        'dosage', pi.frequency,
                        'duration', pi.duration,
                        'instruction', pi.instructions_timing,
                        'note', pi.special_instructions
                    ) ORDER BY pi.sort_order ASC
                ), '[]'::jsonb)
                FROM prescription_items pi
                LEFT JOIN medicine_master m ON pi.medicine_master_id = m.id
                WHERE c.id IS NOT NULL AND pi.consultation_id = c.id
            ),

            -- 7. LAB ORDERS
            'lab_orders', (
                SELECT COALESCE(jsonb_agg(
                    jsonb_build_object(
                        'test_name', lo.test_name,
                        'instruction', lo.instruction
                    )
                ), '[]'::jsonb)
                FROM lab_orders lo
                WHERE c.id IS NOT NULL AND lo.consultation_id = c.id
            ),

            -- 8. ADVICE
            'advice', jsonb_build_object(
                'next_visit_date', to_char(c.next_visit_date, 'DD Mon YYYY'),
                'next_visit_text', c.next_visit_text
            )
        )
        FROM appointments a
        JOIN clinics cl ON a.clinic_id = cl.id
        JOIN patients p ON a.patient_id = p.id
        LEFT JOIN patient_medical_profiles mp ON mp.patient_id = p.id
        JOIN profiles dr_p ON a.doctor_id = dr_p.id
        JOIN doctors dr ON dr.profile_id = dr_p.id
        LEFT JOIN consultations c ON c.appointment_id = a.id
        WHERE a.id = _appointment_id
    );
END;
$$;


--
-- Name: get_staff_dashboard_stats(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_staff_dashboard_stats(_clinic_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _expected_today integer;
    _avg_wait_mins integer;
    _checked_in integer;
    _pending_payments_count integer;
    _pending_payments_sum numeric;
BEGIN
    -- 1. Expected Today (Total bookings)
    SELECT COUNT(*) INTO _expected_today
    FROM appointments
    WHERE clinic_id = _clinic_id 
    AND start_time::DATE = CURRENT_DATE
    AND status != 'cancelled';

    -- 2. Avg Wait Time (Fixed)
    -- Only calculate for people who have ACTUALLY Checked In
    SELECT COALESCE(ROUND(AVG(EXTRACT(EPOCH FROM (NOW() - a.checked_in_at))/60)), 0)
    INTO _avg_wait_mins
    FROM queue_tokens q
    JOIN appointments a ON q.appointment_id = a.id
    WHERE q.clinic_id = _clinic_id 
    AND q.date_of_service = CURRENT_DATE
    AND q.status = 'waiting'
    AND a.checked_in_at IS NOT NULL; -- Critical check

    -- 3. Checked In (Waiting + Active + Completed)
    -- Basically anyone who arrived at the clinic
    SELECT COUNT(*) INTO _checked_in
    FROM queue_tokens
    WHERE clinic_id = _clinic_id 
    AND date_of_service = CURRENT_DATE
    AND status != 'scheduled'; -- Don't count the people still at home

    -- 4. Financial Pulse
    SELECT COUNT(*), COALESCE(SUM(i.grand_total - i.amount_paid), 0) 
    INTO _pending_payments_count, _pending_payments_sum
    FROM invoices i
    JOIN appointments a ON i.appointment_id = a.id
    WHERE a.clinic_id = _clinic_id
    AND i.created_at::DATE = CURRENT_DATE
    AND i.payment_status != 'paid';

    RETURN jsonb_build_object(
        'expected_today', _expected_today,
        'avg_wait_mins', _avg_wait_mins,
        'checked_in', _checked_in,
        'pending_payments_count', _pending_payments_count,
        'pending_payments_sum', _pending_payments_sum
    );
END;
$$;


--
-- Name: get_token_print_data(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_token_print_data(_token_id uuid) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_build_object(
            'token_number', q.token_number,
            'patient_name', p.full_name,
            'uhid', p.uhid,
            'doctor_name', dr_p.full_name,
            'clinic_name', c.name,
            'clinic_phone', c.phone_primary,
            'timestamp', NOW()
        )
        FROM queue_tokens q
        JOIN patients p ON q.patient_id = p.id
        JOIN profiles dr_p ON q.doctor_id = dr_p.id
        JOIN clinics c ON q.clinic_id = c.id
        WHERE q.id = _token_id
    );
END;
$$;


--
-- Name: handle_doctor_role_change(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_doctor_role_change() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Only act if the role is being changed TO 'doctor'
    -- AND it wasn't 'doctor' before (prevent redundant firing)
    IF NEW.role = 'doctor' AND (OLD.role IS DISTINCT FROM 'doctor') THEN
        
        -- Insert into doctors table with PLACEHOLDER values.
        -- We use ON CONFLICT DO NOTHING in case the row already exists 
        -- (e.g. they were a doctor, demoted, and promoted back).
        INSERT INTO public.doctors (
            profile_id, 
            specialty, 
            qualifications, 
            registration_number,
            avg_consult_time_min,
            is_available
        )
        VALUES (
            NEW.id, 
            'General Physician', -- Default Placeholder
            'MBBS',              -- Default Placeholder
            'PENDING-' || substring(md5(random()::text) from 1 for 6), -- Temporary Unique Reg #
            15,                  -- Default 15 min slots
            false                -- Default to Unavailable until roster is set
        )
        ON CONFLICT (profile_id) DO NOTHING;
        
    END IF;

    RETURN NEW;
END;
$$;


--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, role, clinic_id)
  VALUES (
    NEW.id,
    NEW.email,
    -- Try to get name from metadata, otherwise default to the email address
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
    -- ALWAYS start as 'user'. Admin can upgrade them later.
    'user',
    -- ALWAYS start with NULL clinic. Admin assigns this later.
    NULL
  );
  RETURN NEW;
END;
$$;


--
-- Name: is_super_admin(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_super_admin() RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
    SELECT (auth.jwt() -> 'app_metadata' ->> 'role') = 'super_admin';
$$;


--
-- Name: merge_patient_records(uuid, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.merge_patient_records(_keep_id uuid, _discard_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _discard_med_profile JSONB;
BEGIN
    -- 1. Security Check
    IF auth.user_role() != 'admin' THEN 
        RAISE EXCEPTION 'Unauthorized: Only admins can merge records.';
    END IF;

    IF _keep_id = _discard_id THEN
        RAISE EXCEPTION 'Cannot merge a patient into themselves.';
    END IF;

    -- 2. Re-assign Appointments
    UPDATE appointments 
    SET patient_id = _keep_id 
    WHERE patient_id = _discard_id;

    -- 3. Re-assign Queue Tokens
    UPDATE queue_tokens 
    SET patient_id = _keep_id 
    WHERE patient_id = _discard_id;

    -- 4. Re-assign Documents
    UPDATE patient_documents 
    SET patient_id = _keep_id 
    WHERE patient_id = _discard_id;

    -- 5. Merge Medical Profiles
    -- We want to preserve any allergies/conditions recorded on the discarded profile
    -- if the kept profile doesn't have them.
    
    -- Get discard profile data
    SELECT to_jsonb(pmp) INTO _discard_med_profile 
    FROM patient_medical_profiles pmp 
    WHERE patient_id = _discard_id;

    IF FOUND THEN
        -- Upsert/Update the Keep Profile
        -- Logic: Append allergies from discard to keep using JSONB concatenation, removing duplicates is complex in SQL
        -- so we just concatenate for safety. The UI can clean it up later.
        INSERT INTO patient_medical_profiles (patient_id, allergies, chronic_conditions)
        VALUES (
            _keep_id, 
            COALESCE(_discard_med_profile->'allergies', '[]'::jsonb), 
            COALESCE(_discard_med_profile->'chronic_conditions', '[]'::jsonb)
        )
        ON CONFLICT (patient_id) DO UPDATE SET
            allergies = patient_medical_profiles.allergies || COALESCE(_discard_med_profile->'allergies', '[]'::jsonb),
            chronic_conditions = patient_medical_profiles.chronic_conditions || COALESCE(_discard_med_profile->'chronic_conditions', '[]'::jsonb);
            
        -- Delete the discarded medical profile manually before deleting the patient
        DELETE FROM patient_medical_profiles WHERE patient_id = _discard_id;
    END IF;

    -- 6. Delete the Discarded Patient
    -- Cascading keys might handle children, but we manually moved the important ones above.
    DELETE FROM patients WHERE id = _discard_id;

    -- 7. Log this action
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (
        auth.uid(), 
        'merge_patients', 
        jsonb_build_object('kept', _keep_id, 'discarded', _discard_id), 
        _keep_id
    );

END;
$$;


--
-- Name: onboard_new_clinic(text, text, text, text, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.onboard_new_clinic(_name text, _city text, _admin_email text, _admin_name text, _admin_uid uuid) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_clinic_id uuid;
BEGIN
    -- Security Check
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    -- 1. Create Clinic
    INSERT INTO clinics (name, city, settings)
    VALUES (_name, _city, '{"currency": "INR", "tax_rate": 0}'::jsonb)
    RETURNING id INTO _new_clinic_id;

    -- 2. Create/Link Admin Profile
    -- Note: The Auth User must exist first. The Client creates auth user, then calls this RPC.
    INSERT INTO profiles (id, email, full_name, role, clinic_id)
    VALUES (_admin_uid, _admin_email, _admin_name, 'staff', _new_clinic_id) -- Defaults to staff, Super Admin can promote later
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'staff';

    -- 3. Create Default Service (Consultation)
    INSERT INTO service_master (clinic_id, name, default_price)
    VALUES (_new_clinic_id, 'General Consultation', 500);

    RETURN _new_clinic_id;
END;
$$;


--
-- Name: onboard_new_clinic(text, text, text, text, text, text, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.onboard_new_clinic(_name text, _city text, _address text, _phone text, _admin_email text, _admin_name text, _admin_uid uuid) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_clinic_id uuid;
BEGIN
    -- Security Check
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    -- 1. Create Clinic
    INSERT INTO clinics (name, city, address_line_1, phone_primary, settings)
    VALUES (_name, _city, _address, _phone, '{"currency": "INR", "tax_rate": 0}'::jsonb)
    RETURNING id INTO _new_clinic_id;

    -- 2. Create/Link Admin Profile
    -- We assume the auth user exists (since we selected from list). 
    -- We update their role and link them to this clinic.
    INSERT INTO profiles (id, email, full_name, role, clinic_id)
    VALUES (_admin_uid, _admin_email, _admin_name, 'staff', _new_clinic_id)
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'staff';

    -- 3. Create Default Service (Consultation)
    INSERT INTO service_master (clinic_id, name, default_price)
    VALUES (_new_clinic_id, 'General Consultation', 500);

    RETURN _new_clinic_id;
END;
$$;


--
-- Name: onboard_new_clinic(text, text, text, text, text, text, text, text, text, text, text, text, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.onboard_new_clinic(_name text, _city text, _address_1 text, _address_2 text, _state text, _pincode text, _phone_primary text, _phone_secondary text, _email_contact text, _website_url text, _admin_email text, _admin_name text, _admin_uid uuid) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_clinic_id uuid;
BEGIN
    -- Security Check
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    -- 1. Create Clinic
    INSERT INTO clinics (
        name, city, address_line_1, address_line_2, state, pincode, 
        phone_primary, phone_secondary, email_contact, website_url, settings
    )
    VALUES (
        _name, _city, _address_1, _address_2, _state, _pincode,
        _phone_primary, _phone_secondary, _email_contact, _website_url, 
        '{"currency": "INR", "tax_rate": 0}'::jsonb
    )
    RETURNING id INTO _new_clinic_id;

    -- 2. Create/Link Admin Profile
    -- Promotes the selected user to 'admin' for this clinic
    INSERT INTO profiles (id, email, full_name, role, clinic_id)
    VALUES (_admin_uid, _admin_email, _admin_name, 'admin', _new_clinic_id)
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'admin';

    -- 3. Create Default Service (Consultation)
    INSERT INTO service_master (clinic_id, name, default_price)
    VALUES (_new_clinic_id, 'General Consultation', 500);

    RETURN _new_clinic_id;
END;
$$;


--
-- Name: onboard_new_clinic(text, text, text, text, text, text, text, text, text, text, text, text, uuid, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.onboard_new_clinic(_name text, _city text, _address_1 text, _address_2 text, _state text, _pincode text, _phone_primary text, _phone_secondary text, _email_contact text, _website_url text, _admin_email text, _admin_name text, _admin_uid uuid, _consultation_fee numeric DEFAULT 500) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_clinic_id uuid;
BEGIN
    -- Security Check
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    -- 1. Create Clinic
    INSERT INTO clinics (
        name, city, address_line_1, address_line_2, state, pincode, 
        phone_primary, phone_secondary, email_contact, website_url, settings
    )
    VALUES (
        _name, _city, _address_1, _address_2, _state, _pincode,
        _phone_primary, _phone_secondary, _email_contact, _website_url, 
        '{"currency": "INR", "tax_rate": 0}'::jsonb
    )
    RETURNING id INTO _new_clinic_id;

    -- 2. Create/Link Admin Profile
    -- Promotes the selected user to 'admin' for this clinic
    INSERT INTO profiles (id, email, full_name, role, clinic_id)
    VALUES (_admin_uid, _admin_email, _admin_name, 'admin', _new_clinic_id)
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'admin';

    -- 3. Create Default Service (Consultation)
    INSERT INTO service_master (clinic_id, name, default_price)
    VALUES (_new_clinic_id, 'General Consultation', _consultation_fee);

    RETURN _new_clinic_id;
END;
$$;


--
-- Name: onboard_new_clinic(text, text, text, text, text, text, text, text, text, text, text, text, uuid, text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.onboard_new_clinic(_name text, _city text, _address_1 text, _address_2 text, _state text, _pincode text, _phone_primary text, _phone_secondary text, _email_contact text, _website_url text, _admin_email text, _admin_name text, _admin_uid uuid, _logo_url text DEFAULT NULL::text, _header_image_url text DEFAULT NULL::text, _footer_text text DEFAULT NULL::text, _sms_enabled boolean DEFAULT true) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_clinic_id uuid;
    _settings_json jsonb;
BEGIN
    -- Security Check
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;

    -- Prepare Settings JSON
    _settings_json := jsonb_build_object(
        'currency', 'INR',
        'tax_rate', 0,
        'sms_enabled', _sms_enabled
    );

    -- 1. Create Clinic
    INSERT INTO clinics (
        name, city, address_line_1, address_line_2, state, pincode, 
        phone_primary, phone_secondary, email_contact, website_url, 
        logo_url, header_image_url, footer_text, settings
    )
    VALUES (
        _name, _city, _address_1, _address_2, _state, _pincode,
        _phone_primary, _phone_secondary, _email_contact, _website_url, 
        _logo_url, _header_image_url, _footer_text, _settings_json
    )
    RETURNING id INTO _new_clinic_id;

    -- 2. Create/Link Admin Profile
    -- Promotes the selected user to 'admin' for this clinic
    INSERT INTO profiles (id, email, full_name, role, clinic_id)
    VALUES (_admin_uid, _admin_email, _admin_name, 'admin', _new_clinic_id)
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'admin';

    RETURN _new_clinic_id;
END;
$$;


--
-- Name: onboard_new_clinic(text, text, text, text, text, text, text, text, text, text, text, text, uuid, numeric, text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.onboard_new_clinic(_name text, _city text, _address_1 text, _address_2 text, _state text, _pincode text, _phone_primary text, _phone_secondary text, _email_contact text, _website_url text, _admin_email text, _admin_name text, _admin_uid uuid, _consultation_fee numeric DEFAULT 500, _logo_url text DEFAULT NULL::text, _header_image_url text DEFAULT NULL::text, _footer_text text DEFAULT NULL::text, _sms_enabled boolean DEFAULT true) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _new_clinic_id uuid;
    _settings_json jsonb;
BEGIN
    -- Strict Security Check
    IF NOT public.is_super_admin() THEN 
        RAISE EXCEPTION 'Unauthorized: Only Super Admin can onboard clinics.'; 
    END IF;

    _settings_json := jsonb_build_object(
        'currency', 'INR',
        'tax_rate', 0,
        'sms_enabled', _sms_enabled
    );

    INSERT INTO clinics (
        name, city, address_line_1, address_line_2, state, pincode, 
        phone_primary, phone_secondary, email_contact, website_url, 
        logo_url, header_image_url, footer_text, settings
    )
    VALUES (
        _name, _city, _address_1, _address_2, _state, _pincode,
        _phone_primary, _phone_secondary, _email_contact, _website_url, 
        _logo_url, _header_image_url, _footer_text, _settings_json
    )
    RETURNING id INTO _new_clinic_id;

    -- Link Admin
    INSERT INTO profiles (id, email, full_name, role, clinic_id)
    VALUES (_admin_uid, _admin_email, _admin_name, 'admin', _new_clinic_id)
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'admin';

    -- Create Default Service
    INSERT INTO service_master (clinic_id, name, default_price)
    VALUES (_new_clinic_id, 'General Consultation', _consultation_fee);

    RETURN _new_clinic_id;
END;
$$;


--
-- Name: process_payment_settlement(uuid, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.process_payment_settlement(_invoice_id uuid, _mode text, _ref text) RETURNS TABLE(token_number integer, patient_name text, doctor_name text, clinic_name text, uhid text, amount numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE
    _invoice_total numeric;
BEGIN
    -- 1. Get full amount
    SELECT grand_total INTO _invoice_total FROM invoices WHERE id = _invoice_id;

    -- 2. Call NEW logic
    PERFORM public.record_invoice_payment(_invoice_id, _invoice_total, _mode, _ref);

    -- 3. Return print data
    RETURN QUERY
    SELECT q.token_number, p.full_name, dr_p.full_name, c.name, p.uhid, _invoice_total
    FROM queue_tokens q
    JOIN patients p ON q.patient_id = p.id
    JOIN appointments a ON q.appointment_id = a.id
    JOIN profiles dr_p ON a.doctor_id = dr_p.id
    JOIN clinics c ON a.clinic_id = c.id
    WHERE q.appointment_id = (SELECT appointment_id FROM invoices WHERE id = _invoice_id);
END;
$$;


--
-- Name: public_download_prescription(uuid, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.public_download_prescription(_appointment_id uuid, _uhid text, _phone text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _is_valid boolean;
    _result jsonb;
BEGIN
    -- 1. Clean Inputs
    _uhid := TRIM(UPPER(_uhid));
    _phone := TRIM(_phone);

    -- 2. STRICT SECURITY CHECK
    -- Does this appointment actually belong to a patient with this UHID & Phone?
    SELECT EXISTS (
        SELECT 1 
        FROM appointments a
        JOIN patients p ON a.patient_id = p.id
        WHERE a.id = _appointment_id
        AND p.uhid = _uhid
        AND p.phone = _phone
    ) INTO _is_valid;

    IF NOT _is_valid THEN
        RAISE EXCEPTION 'Access Denied: Credentials do not match records.';
    END IF;

    -- 3. Reuse Existing Logic (DRY Principle)
    -- We call the existing function directly. Since we are in a SECURITY DEFINER 
    -- wrapper, we have permission to execute it.
    _result := public.get_prescription_print_data(_appointment_id);

    RETURN _result;
END;
$$;


--
-- Name: public_fetch_patient_visits(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.public_fetch_patient_visits(_uhid text, _phone text) RETURNS TABLE(appointment_id uuid, visit_date text, doctor_name text, clinic_name text, status text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _patient_id uuid;
BEGIN
    -- 1. Clean Inputs
    _uhid := TRIM(UPPER(_uhid));
    _phone := TRIM(_phone);

    -- 2. Verify Identity (Match UHID + Phone)
    -- We use ILIKE for case-insensitive UHID matching
    SELECT id INTO _patient_id
    FROM patients
    WHERE uhid = _uhid 
    AND phone = _phone;

    -- 3. Security Gate
    IF _patient_id IS NULL THEN
        -- Return empty, or you could RAISE EXCEPTION 'Invalid UHID or Phone Number'
        -- Returning empty is safer against brute-force enumeration
        RETURN;
    END IF;

    -- 4. Return Data
    RETURN QUERY
    SELECT 
        a.id AS appointment_id,
        to_char(a.start_time, 'DD Mon YYYY, HH12:MI AM') AS visit_date,
        dr_p.full_name AS doctor_name,
        c.name AS clinic_name,
        a.status::text
    FROM appointments a
    JOIN profiles dr_p ON a.doctor_id = dr_p.id
    JOIN clinics c ON a.clinic_id = c.id
    WHERE a.patient_id = _patient_id
    AND a.status IN ('completed', 'in_consult') -- Only show relevant visits
    ORDER BY a.start_time DESC;
END;
$$;


--
-- Name: quick_register_patient(text, text, integer, public.gender_type, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.quick_register_patient(_full_name text, _phone text, _age integer, _gender public.gender_type, _clinic_id uuid) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_id UUID;
    _uhid TEXT;
BEGIN
    -- Fix: Redirect call to valid function
    IF public.auth_user_role() NOT IN ('staff', 'admin') THEN 
        RAISE EXCEPTION 'Unauthorized: Only staff or admins can register patients.';
    END IF;

    -- Generate a simple UHID (Unique Health ID)
    _uhid := 'P-' || to_char(now(), 'YYMMDD') || '-' || substring(md5(random()::text) from 1 for 4);

    -- Insert into Patients Table
    INSERT INTO patients (
        clinic_id, 
        full_name, 
        phone, 
        age, 
        gender, 
        uhid,
        access_flags
    )
    VALUES (
        _clinic_id, 
        _full_name, 
        _phone, 
        _age, 
        _gender, 
        upper(_uhid), 
        '{"critical": false, "wheelchair": false}'::jsonb
    )
    RETURNING id INTO _new_id;

    -- Create Empty Medical Profile
    INSERT INTO patient_medical_profiles (patient_id)
    VALUES (_new_id);

    RETURN _new_id;
END;
$$;


--
-- Name: quick_register_patient(text, text, integer, public.gender_type, uuid, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.quick_register_patient(_full_name text, _phone text, _age integer, _gender public.gender_type, _clinic_id uuid, _address_street text DEFAULT NULL::text, _district text DEFAULT NULL::text, _state text DEFAULT NULL::text, _pincode text DEFAULT NULL::text, _religion text DEFAULT NULL::text) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_id UUID;
    _uhid TEXT;
BEGIN
    IF public.auth_user_role() NOT IN ('staff', 'admin') THEN 
        RAISE EXCEPTION 'Unauthorized: Only staff or admins can register patients.';
    END IF;

    -- Generate a simple UHID
    _uhid := 'P-' || to_char(now(), 'YYMMDD') || '-' || substring(md5(random()::text) from 1 for 4);

    INSERT INTO patients (
        clinic_id, 
        full_name, 
        phone, 
        age, 
        gender, 
        uhid,
        address_street,
        district,
        state,
        pincode,
        religion,
        access_flags
    )
    VALUES (
        _clinic_id, 
        _full_name, 
        _phone, 
        _age, 
        _gender, 
        upper(_uhid), 
        _address_street,
        _district,
        _state,
        _pincode,
        _religion,
        '{"critical": false, "wheelchair": false}'::jsonb
    )
    RETURNING id INTO _new_id;

    -- Create Empty Medical Profile
    INSERT INTO patient_medical_profiles (patient_id)
    VALUES (_new_id);

    RETURN _new_id;
END;
$$;


--
-- Name: quick_register_patient(text, text, integer, public.gender_type, uuid, text, text, text, text, text, date, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.quick_register_patient(_full_name text, _phone text, _age integer, _gender public.gender_type, _clinic_id uuid, _address_street text DEFAULT NULL::text, _district text DEFAULT NULL::text, _state text DEFAULT NULL::text, _pincode text DEFAULT NULL::text, _religion text DEFAULT NULL::text, _dob date DEFAULT NULL::date, _access_flags jsonb DEFAULT '{"critical": false, "wheelchair": false}'::jsonb) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _new_id UUID;
    _uhid TEXT;
BEGIN
    IF public.auth_user_role() NOT IN ('staff', 'admin') THEN 
        RAISE EXCEPTION 'Unauthorized: Only staff or admins can register patients.';
    END IF;

    -- Check if patient exists with same phone in this clinic
    IF _phone IS NOT NULL AND _phone != '' THEN
        SELECT id INTO _new_id FROM patients WHERE phone = _phone AND clinic_id = _clinic_id LIMIT 1;
        IF _new_id IS NOT NULL THEN
            RAISE EXCEPTION 'Patient with this phone number already exists in this clinic';
        END IF;
    END IF;

    -- Generate UHID (Simple timestamp based for now, can be improved)
    _uhid := 'UHID' || to_char(now(), 'YYMMDDHH24MISS') || (floor(random() * 1000)::text);

    INSERT INTO patients (
        clinic_id, 
        full_name, 
        phone, 
        age, 
        gender, 
        uhid,
        address_street,
        district,
        state,
        pincode,
        religion,
        dob,
        access_flags
    )
    VALUES (
        _clinic_id, 
        _full_name, 
        _phone, 
        _age, 
        _gender, 
        upper(_uhid), 
        _address_street,
        _district,
        _state,
        _pincode,
        _religion,
        _dob,
        _access_flags
    )
    RETURNING id INTO _new_id;

    RETURN _new_id;
END;
$$;


--
-- Name: record_invoice_payment(uuid, numeric, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.record_invoice_payment(_invoice_id uuid, _amount numeric, _mode text, _reference text DEFAULT NULL::text, _notes text DEFAULT NULL::text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _new_balance numeric;
    _grand_total numeric;
    _total_paid numeric;
    _clinic_id uuid;
BEGIN
    -- 1. Security: Only Staff/Admin
    IF public.auth_user_role() NOT IN ('admin', 'staff', 'doctor') AND NOT public.is_super_admin() THEN
        RAISE EXCEPTION 'Unauthorized: Only staff can record payments.';
    END IF;

    -- 2. Validation & Fetch (Ensure invoice belongs to user's clinic)
    SELECT i.grand_total, i.amount_paid, a.clinic_id 
    INTO _grand_total, _total_paid, _clinic_id
    FROM invoices i
    JOIN appointments a ON i.appointment_id = a.id
    WHERE i.id = _invoice_id;

    IF NOT public.is_super_admin() AND _clinic_id != public.auth_my_clinic_id() THEN
        RAISE EXCEPTION 'Unauthorized: Invoice does not belong to your clinic.';
    END IF;

    IF (_total_paid + _amount) > _grand_total THEN
        RAISE EXCEPTION 'Payment amount (%) exceeds balance due (%).', _amount, (_grand_total - _total_paid);
    END IF;

    -- 3. Process Payment
    INSERT INTO invoice_payments (
        invoice_id, amount, payment_mode, transaction_ref, notes, created_by
    )
    VALUES (
        _invoice_id, _amount, _mode, _reference, _notes, auth.uid()
    );

    RETURN jsonb_build_object(
        'success', true,
        'new_paid_total', (_total_paid + _amount),
        'new_balance', _grand_total - (_total_paid + _amount),
        'status', CASE WHEN (_total_paid + _amount) >= _grand_total THEN 'paid' ELSE 'partial' END
    );
END;
$$;


--
-- Name: reschedule_appointment(uuid, timestamp with time zone, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reschedule_appointment(_appointment_id uuid, _new_start_time timestamp with time zone, _new_doctor_id uuid DEFAULT NULL::uuid) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _current_doc_id uuid;
    _final_doctor_id uuid;
    _clinic_id uuid;
    _patient_id uuid;
    _old_price numeric;
    _new_price numeric;
    _avg_time int;
BEGIN
    -- 1. Fetch Current Metadata & Financials
    SELECT 
        a.doctor_id, a.clinic_id, a.patient_id, i.grand_total
    INTO 
        _current_doc_id, _clinic_id, _patient_id, _old_price
    FROM appointments a
    LEFT JOIN invoices i ON a.id = i.appointment_id
    WHERE a.id = _appointment_id;

    -- 2. Determine Target Doctor
    _final_doctor_id := COALESCE(_new_doctor_id, _current_doc_id);

    -- 3. FINANCIAL GUARD: Check if Doctor changed and prices differ
    SELECT (fees_structure->>'consultation')::numeric, avg_consult_time_min 
    INTO _new_price, _avg_time
    FROM doctors WHERE profile_id = _final_doctor_id;

    -- If the new doctor is more expensive and invoice is already generated
    IF _new_price > _old_price THEN
        -- OPTION A: Block it (Strict)
        -- RAISE EXCEPTION 'Cannot reschedule: New doctor fees (%) are higher than paid amount (%).', _new_price, _old_price;
        
        -- OPTION B: Allow it but return a warning (Preferred for flexibility)
        -- We continue, but the frontend should alert the staff.
        -- This part can be left as is, or made more explicit.
        -- For now, the 'financial_warning' flag in the return will handle it.
    END IF;
    
    -- Handle case where doctor or their fees/time are not found
    IF NOT FOUND THEN
       RAISE EXCEPTION 'Doctor or their fee/schedule not found for profile ID: %', _final_doctor_id;
    END IF;

    -- 4. Concurrency Guard (Slot Availability)
    IF EXISTS (
        SELECT 1 FROM appointments 
        WHERE doctor_id = _final_doctor_id 
          AND start_time = _new_start_time 
          AND id != _appointment_id
          AND status != 'cancelled'
    ) THEN
        RAISE EXCEPTION 'Slot already booked';
    END IF;

    -- 5. Update Appointment
    UPDATE appointments
    SET 
        doctor_id = _final_doctor_id,
        start_time = _new_start_time,
        end_time = _new_start_time + (_avg_time || ' minutes')::interval,
        status = 'rescheduled', 
        checked_in_at = NULL -- Reset lobby status
    WHERE id = _appointment_id;

    -- 6. REGENERATE QUEUE TOKEN
    -- A. Delete old token (orphaned date/doctor)
    DELETE FROM queue_tokens WHERE appointment_id = _appointment_id;

    -- B. Generate new token using the Shared Function (DRY Principle)
    PERFORM public._internal_generate_queue_token(
        _clinic_id,
        _appointment_id,
        _patient_id,
        _final_doctor_id,
        _new_start_time::DATE
    );

    RETURN jsonb_build_object(
        'success', true, 
        'message', 'Rescheduled successfully',
        'financial_warning', (_new_price > _old_price) -- simplified boolean check
    );
END;
$$;


--
-- Name: sa_assign_user_to_clinic(uuid, uuid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_assign_user_to_clinic(_user_id uuid, _clinic_id uuid, _role text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    -- 1. Security Gate
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    -- 2. Safety Check: Prevent accidentally demoting/moving another Super Admin
    IF EXISTS (SELECT 1 FROM profiles WHERE id = _user_id AND role = 'super_admin') THEN
        RAISE EXCEPTION 'Cannot modify another Super Admin via this function.';
    END IF;

    -- 3. Perform Update
    UPDATE profiles
    SET 
        clinic_id = _clinic_id,
        role = _role::public.user_role
        -- Removed 'updated_at' since the column does not exist
    WHERE id = _user_id;

    -- 4. Audit Log
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (
        auth.uid(), 
        'super_admin_move_user', 
        jsonb_build_object('target_user', _user_id, 'new_role', _role), 
        _clinic_id
    );
END;
$$;


--
-- Name: sa_get_dashboard_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_get_dashboard_stats() RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _stats jsonb;
BEGIN
    -- Security Gate
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    SELECT jsonb_build_object(
        'total_clinics', (SELECT COUNT(*) FROM clinics),
        'total_users', (SELECT COUNT(*) FROM profiles),
        'active_today', (
            SELECT COUNT(DISTINCT user_id) 
            FROM audit_logs 
            WHERE created_at > CURRENT_DATE
        ),
        'clinics_breakdown', (
            SELECT jsonb_agg(t) FROM (
                SELECT 
                    c.name,
                    c.city,
                    (SELECT COUNT(*) FROM profiles WHERE clinic_id = c.id) as staff_count,
                    (SELECT COUNT(*) FROM appointments WHERE clinic_id = c.id AND start_time > (NOW() - INTERVAL '30 days')) as monthly_visits
                FROM clinics c
                ORDER BY created_at DESC
                LIMIT 5
            ) t
        )
    ) INTO _stats;

    RETURN _stats;
END;
$$;


--
-- Name: sa_list_clinics(integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_list_clinics(_page integer DEFAULT 1, _limit integer DEFAULT 10, _search text DEFAULT ''::text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _offset int := (_page - 1) * _limit;
    _total bigint;
    _data jsonb;
BEGIN
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    -- 1. Get Data
    SELECT jsonb_agg(t) INTO _data
    FROM (
        SELECT 
            c.id,
            c.name,
            c.city,
            c.phone_primary,
            c.created_at,
            c.settings->>'is_active' as is_active,
            -- Subquery to get the Admin's name efficiently
            (SELECT full_name FROM profiles WHERE clinic_id = c.id AND role = 'admin' LIMIT 1) as admin_name,
            (SELECT email FROM profiles WHERE clinic_id = c.id AND role = 'admin' LIMIT 1) as admin_email
        FROM clinics c
        WHERE 
            (_search = '' OR c.name ILIKE '%' || _search || '%' OR c.city ILIKE '%' || _search || '%')
        ORDER BY c.created_at DESC
        LIMIT _limit OFFSET _offset
    ) t;

    -- 2. Get Total Count
    SELECT COUNT(*) INTO _total
    FROM clinics c
    WHERE (_search = '' OR c.name ILIKE '%' || _search || '%' OR c.city ILIKE '%' || _search || '%');

    RETURN jsonb_build_object(
        'data', COALESCE(_data, '[]'::jsonb),
        'meta', jsonb_build_object(
            'total', _total,
            'page', _page,
            'limit', _limit
        )
    );
END;
$$;


--
-- Name: sa_list_clinics_advanced(integer, integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_list_clinics_advanced(_page integer DEFAULT 1, _limit integer DEFAULT 10, _search text DEFAULT ''::text, _status_filter text DEFAULT 'all'::text, _plan_filter text DEFAULT 'all'::text, _sort_by text DEFAULT 'newest'::text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _offset int := (_page - 1) * _limit;
    _total bigint;
    _data jsonb;
BEGIN
    -- 1. Security Gate
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    -- 2. Main Query using CTE for cleanliness
    WITH clinic_data AS (
        SELECT 
            c.id,
            c.name,
            c.city,
            c.logo_url,
            c.created_at,
            c.subscription_status,
            c.subscription_ends_at,
            
            -- Admin Details (Lateral Join for efficiency - picks the first admin found)
            admin_p.full_name AS admin_name,
            admin_p.email AS admin_email,
            
            -- Plan Details (Lateral Join - picks the relevant active or latest subscription)
            pm.name AS plan_name,
            pm.code AS plan_code,
            
            -- Count for Pagination
            COUNT(*) OVER() as total_count
            
        FROM clinics c
        -- Join Admin
        LEFT JOIN LATERAL (
            SELECT full_name, email 
            FROM profiles 
            WHERE clinic_id = c.id AND role = 'admin' 
            LIMIT 1
        ) admin_p ON true
        -- Join Latest Subscription to get Plan Code
        LEFT JOIN LATERAL (
            SELECT plan_code 
            FROM clinic_subscriptions cs
            WHERE cs.clinic_id = c.id
            ORDER BY cs.ends_at DESC 
            LIMIT 1
        ) sub ON true
        -- Join Plan Master
        LEFT JOIN plan_master pm ON sub.plan_code = pm.code
        WHERE 
            -- A. Search Filter (Name, City, or Admin Email)
            (
                _search = '' OR 
                c.name ILIKE '%' || _search || '%' OR 
                c.city ILIKE '%' || _search || '%' OR
                admin_p.email ILIKE '%' || _search || '%'
            )
            -- B. Status Filter
            AND (
                _status_filter = 'all' OR 
                c.subscription_status::text = _status_filter
            )
            -- C. Plan Filter
            AND (
                _plan_filter = 'all' OR 
                pm.code::text = _plan_filter
            )
    )
    SELECT 
        COALESCE(jsonb_agg(
            jsonb_build_object(
                'id', cd.id,
                'name', cd.name,
                'city', cd.city,
                'logo_url', cd.logo_url,
                'created_at', cd.created_at,
                'admin', jsonb_build_object(
                    'name', COALESCE(cd.admin_name, 'No Admin'),
                    'email', COALESCE(cd.admin_email, 'N/A')
                ),
                'subscription', jsonb_build_object(
                    'status', cd.subscription_status,
                    'expires_at', cd.subscription_ends_at,
                    'plan_name', COALESCE(cd.plan_name, 'No Plan'),
                    'plan_code', cd.plan_code
                )
            ) ORDER BY 
                CASE WHEN _sort_by = 'newest' THEN cd.created_at END DESC,
                CASE WHEN _sort_by = 'name_asc' THEN cd.name END ASC,
                CASE WHEN _sort_by = 'expiry_soonest' THEN cd.subscription_ends_at END ASC NULLS LAST,
                CASE WHEN _sort_by = 'expiry_latest' THEN cd.subscription_ends_at END DESC NULLS LAST,
                -- Default fallback
                cd.created_at DESC
        ), '[]'::jsonb),
        COALESCE((SELECT total_count FROM clinic_data LIMIT 1), 0)
    INTO _data, _total
    FROM (
        SELECT * FROM clinic_data
        LIMIT _limit OFFSET _offset
    ) cd;

    RETURN jsonb_build_object(
        'data', _data,
        'meta', jsonb_build_object(
            'total', _total,
            'page', _page,
            'limit', _limit,
            'total_pages', CEIL(_total::numeric / GREATEST(_limit, 1))
        )
    );
END;
$$;


--
-- Name: sa_list_users(integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_list_users(_page integer DEFAULT 1, _limit integer DEFAULT 20, _role_filter text DEFAULT NULL::text, _search text DEFAULT ''::text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _offset int := (_page - 1) * _limit;
    _total bigint;
    _data jsonb;
BEGIN
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    -- 1. Fetch Users
    SELECT jsonb_agg(t) INTO _data
    FROM (
        SELECT 
            p.id,
            p.full_name,
            p.email, -- Fallback to profile email
            au.email as auth_email, -- Real login email
            p.role,
            p.clinic_id,
            c.name as clinic_name,
            p.is_active,
            au.last_sign_in_at
        FROM profiles p
        JOIN auth.users au ON p.id = au.id
        LEFT JOIN clinics c ON p.clinic_id = c.id
        WHERE 
            (_role_filter IS NULL OR p.role::text = _role_filter)
            AND (
                _search = '' 
                OR p.full_name ILIKE '%' || _search || '%' 
                OR au.email ILIKE '%' || _search || '%'
            )
        ORDER BY au.created_at DESC
        LIMIT _limit OFFSET _offset
    ) t;

    -- 2. Count Total
    SELECT COUNT(*) INTO _total
    FROM profiles p
    JOIN auth.users au ON p.id = au.id
    WHERE 
        (_role_filter IS NULL OR p.role::text = _role_filter)
        AND (
            _search = '' 
            OR p.full_name ILIKE '%' || _search || '%' 
            OR au.email ILIKE '%' || _search || '%'
        );

    RETURN jsonb_build_object(
        'data', COALESCE(_data, '[]'::jsonb),
        'meta', jsonb_build_object('total', _total, 'page', _page)
    );
END;
$$;


--
-- Name: sa_onboard_clinic_complete(text, text, text, text, uuid, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_onboard_clinic_complete(_name text, _city text, _address text, _phone text, _admin_uid uuid, _admin_name text, _admin_email text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _new_clinic_id uuid;
BEGIN
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    -- 1. Create Clinic
    INSERT INTO clinics (name, city, address_line_1, phone_primary, settings)
    VALUES (_name, _city, _address, _phone, '{"currency": "INR", "tax_rate": 0}'::jsonb)
    RETURNING id INTO _new_clinic_id;

    -- 2. Provision FREE TRIAL Subscription (14 Days)
    -- This ensures the constraints pass when we add the admin/doctor
    INSERT INTO clinic_subscriptions (
        clinic_id, plan_code, status, starts_at, ends_at, 
        limit_doctors, limit_sms_enabled
    )
    SELECT 
        _new_clinic_id, 'free_trial', 'active', NOW(), NOW() + interval '14 days',
        max_doctors, sms_enabled
    FROM plan_master WHERE code = 'free_trial';

    -- 3. Link Admin Profile
    INSERT INTO profiles (id, clinic_id, role, full_name, email)
    VALUES (_admin_uid, _new_clinic_id, 'admin', _admin_name, _admin_email)
    ON CONFLICT (id) DO UPDATE 
    SET clinic_id = _new_clinic_id, role = 'admin';

    -- 4. Defaults
    INSERT INTO service_master (clinic_id, name, default_price)
    VALUES (_new_clinic_id, 'Consultation', 500);

    RETURN jsonb_build_object('success', true, 'clinic_id', _new_clinic_id);
END;
$$;


--
-- Name: sa_provision_subscription(uuid, public.subscription_tier, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_provision_subscription(_clinic_id uuid, _plan_code public.subscription_tier, _days_duration integer, _payment_ref text DEFAULT NULL::text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _plan_details record;
    _current_end timestamp with time zone;
    _new_end timestamp with time zone;
    _sub_id uuid;
BEGIN
    IF NOT public.is_super_admin() THEN RAISE EXCEPTION 'Access Denied'; END IF;

    -- 1. Get Plan Config
    SELECT * INTO _plan_details FROM public.plan_master WHERE code = _plan_code;
    IF NOT FOUND THEN RAISE EXCEPTION 'Invalid Plan Code'; END IF;

    -- 2. Check for existing ACTIVE subscription
    SELECT id, ends_at INTO _sub_id, _current_end
    FROM clinic_subscriptions
    WHERE clinic_id = _clinic_id 
      AND status = 'active'
      AND ends_at > NOW();

    IF _sub_id IS NOT NULL THEN
        -- EXTEND EXISTING
        _new_end := _current_end + (_days_duration || ' days')::interval;
        
        UPDATE clinic_subscriptions
        SET ends_at = _new_end,
            limit_doctors = _plan_details.max_doctors, -- Upgrade limits if plan changed
            limit_sms_enabled = _plan_details.sms_enabled,
            plan_code = _plan_code,
            updated_at = NOW()
        WHERE id = _sub_id;
        
        RETURN jsonb_build_object('action', 'extended', 'expires_at', _new_end);
    ELSE
        -- CREATE NEW
        _new_end := NOW() + (_days_duration || ' days')::interval;
        
        INSERT INTO clinic_subscriptions (
            clinic_id, plan_code, status, starts_at, ends_at, 
            limit_doctors, limit_sms_enabled, payment_provider_id
        )
        VALUES (
            _clinic_id, _plan_code, 'active', NOW(), _new_end,
            _plan_details.max_doctors, _plan_details.sms_enabled, _payment_ref
        )
        RETURNING id INTO _sub_id;
        
        RETURN jsonb_build_object('action', 'created', 'expires_at', _new_end);
    END IF;
END;
$$;


--
-- Name: sa_reactivate_clinic(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_reactivate_clinic(_clinic_id uuid) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _sub_id uuid;
    _ends_at timestamp with time zone;
BEGIN
    -- 1. Security Gate
    IF NOT public.is_super_admin() THEN 
        RAISE EXCEPTION 'Access Denied'; 
    END IF;

    -- 2. Find the Cancelled Subscription
    SELECT id, ends_at INTO _sub_id, _ends_at
    FROM clinic_subscriptions
    WHERE clinic_id = _clinic_id 
      AND status = 'cancelled'
    ORDER BY ends_at DESC
    LIMIT 1;

    IF _sub_id IS NULL THEN
        RAISE EXCEPTION 'No cancelled subscription found to reactivate. Please provision a new one.';
    END IF;

    -- 3. Logic Check: Has the time actually expired while they were suspended?
    IF _ends_at < NOW() THEN
        RETURN jsonb_build_object(
            'success', false, 
            'error', 'cannot_reactivate_expired',
            'message', 'Subscription period has ended. Please use "Provision" to add new time.'
        );
    END IF;

    -- 4. Reactivate
    UPDATE clinic_subscriptions
    SET 
        status = 'active',
        updated_at = NOW()
    WHERE id = _sub_id;

    -- 5. Log
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (auth.uid(), 'super_admin_reactivate_clinic', NULL, _clinic_id);

    RETURN jsonb_build_object('success', true, 'message', 'Clinic reactivated.');
END;
$$;


--
-- Name: sa_suspend_clinic(uuid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_suspend_clinic(_clinic_id uuid, _reason text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _sub_id uuid;
BEGIN
    -- 1. Security Gate
    IF NOT public.is_super_admin() THEN 
        RAISE EXCEPTION 'Access Denied'; 
    END IF;

    -- 2. Find the Active Subscription
    SELECT id INTO _sub_id
    FROM clinic_subscriptions
    WHERE clinic_id = _clinic_id 
      AND status = 'active';

    IF _sub_id IS NULL THEN
        RAISE EXCEPTION 'Clinic does not have an active subscription to suspend.';
    END IF;

    -- 3. Cancel the Subscription
    -- The trigger 'trg_sync_sub_status' will automatically fire 
    -- and update the clinics table status to 'cancelled'.
    UPDATE clinic_subscriptions
    SET 
        status = 'cancelled',
        updated_at = NOW()
    WHERE id = _sub_id;

    -- 4. Audit Log (Crucial for disputes)
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (
        auth.uid(), 
        'super_admin_suspend_clinic', 
        jsonb_build_object('reason', _reason, 'subscription_id', _sub_id), 
        _clinic_id
    );

    RETURN jsonb_build_object('success', true, 'message', 'Clinic suspended successfully.');
END;
$$;


--
-- Name: sa_update_plan_config(public.subscription_tier, text, numeric, integer, integer, boolean, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sa_update_plan_config(_plan_code public.subscription_tier, _name text, _monthly_price numeric, _max_doctors integer, _max_storage_mb integer, _sms_enabled boolean, _is_public boolean) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    _updated_plan jsonb;
BEGIN
    -- 1. Security Gate
    IF NOT public.is_super_admin() THEN 
        RAISE EXCEPTION 'Access Denied: Only Super Admins can configure plans.'; 
    END IF;

    -- 2. Data Validation
    IF _monthly_price < 0 THEN 
        RAISE EXCEPTION 'Validation Error: Monthly price cannot be negative.'; 
    END IF;
    
    IF _max_doctors < 1 THEN 
        RAISE EXCEPTION 'Validation Error: A plan must allow at least 1 doctor.'; 
    END IF;

    -- 3. Perform Update
    UPDATE public.plan_master
    SET
        name = TRIM(_name),
        monthly_price = _monthly_price,
        max_doctors = _max_doctors,
        max_storage_mb = _max_storage_mb,
        sms_enabled = _sms_enabled,
        is_public = _is_public
    WHERE code = _plan_code
    RETURNING to_jsonb(plan_master.*) INTO _updated_plan;

    -- 4. Check Existence
    IF _updated_plan IS NULL THEN
        RAISE EXCEPTION 'Plan with code % not found.', _plan_code;
    END IF;

    -- 5. Audit Log (Crucial for pricing changes)
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (
        auth.uid(), 
        'super_admin_update_plan', 
        _updated_plan, -- Log the new state
        NULL -- No specific resource ID for global config, or could hash the code
    );

    RETURN _updated_plan;
END;
$$;


--
-- Name: save_patient_document(uuid, text, text, public.file_category, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.save_patient_document(_patient_id uuid, _file_name text, _file_url text, _category public.file_category, _uploaded_by uuid) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    new_id uuid;
BEGIN
    INSERT INTO public.patient_documents (
        patient_id,
        file_name,
        file_url,
        category,
        uploaded_by
    )
    VALUES (
        _patient_id,
        _file_name,
        _file_url,
        _category,
        _uploaded_by
    )
    RETURNING id INTO new_id;
    
    RETURN new_id;
END;
$$;


--
-- Name: search_medicines_vector(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.search_medicines_vector(_query text) RETURNS TABLE(id uuid, brand_name text, generic_name text, strength text, type text)
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.id, 
        m.name AS brand_name,
        m.salt_composition AS generic_name,
        TRIM(BOTH ' ' FROM (COALESCE(m.short_composition1, '') || ' ' || COALESCE(m.short_composition2, ''))) AS strength,
        m.type
    FROM medicine_master m
    WHERE 
        m.is_discontinued = false 
        AND (
            -- 1. Full Text Search (Fast & Fuzzy)
            m.search_vector @@ plainto_tsquery('english', _query)
            -- 2. OR Prefix Match on Brand Name
            OR m.name ILIKE _query || '%'
            -- 3. OR Match on Composition
            OR m.salt_composition ILIKE '%' || _query || '%'
        )
    ORDER BY 
        -- Rank 1: Exact Start Match
        CASE WHEN m.name ILIKE _query || '%' THEN 0 ELSE 1 END ASC,
        -- Rank 2: Text Search Relevance
        ts_rank(m.search_vector, plainto_tsquery('english', _query)) DESC,
        -- Fallback
        m.name ASC
    LIMIT 20;
END;
$$;


--
-- Name: search_patients_fuzzy(text, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.search_patients_fuzzy(_query text, _clinic_id uuid) RETURNS TABLE(id uuid, full_name text, phone text, uhid text, age integer, gender text, last_visit date)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id, 
        p.full_name, 
        p.phone, 
        p.uhid, 
        p.age, 
        p.gender::TEXT,
        (SELECT start_time::DATE FROM appointments WHERE patient_id = p.id ORDER BY start_time DESC LIMIT 1)
    FROM patients p
    WHERE p.clinic_id = _clinic_id
      AND (
        p.phone ILIKE _query || '%' OR
        p.uhid ILIKE '%' || _query OR
        p.full_name ILIKE '%' || _query || '%'
      )
    LIMIT 15;
END;
$$;


--
-- Name: submit_prescription_complete(uuid, jsonb, text, jsonb, jsonb, jsonb, date, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.submit_prescription_complete(_consult_id uuid, _diagnosis jsonb, _notes text, _vitals jsonb, _meds jsonb, _labs jsonb, _next_visit_date date DEFAULT NULL::date, _next_visit_text text DEFAULT NULL::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    _med JSONB;
    _lab JSONB;
    _appt_id UUID;
    _sort_idx INTEGER := 0; -- Variable to track the order of medicines
BEGIN
    -- 1. Update Consultation Header
    UPDATE consultations 
    SET diagnosis_codes = _diagnosis,
        clinical_notes_internal = _notes,
        vitals_snapshot = _vitals,
        next_visit_date = _next_visit_date,
        next_visit_text = _next_visit_text
    WHERE id = _consult_id
    RETURNING appointment_id INTO _appt_id;

    -- 2. Insert Medicines (Loop)
    FOR _med IN SELECT * FROM jsonb_array_elements(_meds)
    LOOP
        _sort_idx := _sort_idx + 1; -- Increment counter for every item

        INSERT INTO prescription_items (
            consultation_id, 
            medicine_master_id,
            medicine_name_manual, 
            frequency, 
            duration, 
            instructions_timing,
            special_instructions,  -- ✅ ADDED THIS
            sort_order,            -- ✅ ADDED THIS
            cached_composition     -- ✅ ADDED THIS (Optional, but good practice)
        )
        VALUES (
            _consult_id, 
            (_med->>'master_id')::uuid,
            _med->>'name', 
            _med->>'frequency', 
            _med->>'duration', 
            _med->>'instruction',
            _med->>'special_instructions', -- ✅ Extracting note from JSON
            _sort_idx,                     -- ✅ Saving the order index
            _med->>'composition'           -- ✅ Saving composition if sent by frontend
        );
    END LOOP;

    -- 3. Insert Labs (Loop)
    FOR _lab IN SELECT * FROM jsonb_array_elements(_labs)
    LOOP
        INSERT INTO lab_orders (consultation_id, test_name, instruction)
        VALUES (_consult_id, _lab->>'test_name', _lab->>'instruction');
    END LOOP;

    -- 4. Close the Loop
    UPDATE appointments 
    SET status = 'completed', 
        consult_ended_at = NOW() 
    WHERE id = _appt_id;

    UPDATE queue_tokens 
    SET status = 'completed' 
    WHERE appointment_id = _appt_id;
END;
$$;


--
-- Name: submit_prescription_complete(uuid, jsonb, text, text, jsonb, jsonb, jsonb, date, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.submit_prescription_complete(_consult_id uuid, _diagnosis jsonb, _chief_complaint text, _notes text, _vitals jsonb, _meds jsonb, _labs jsonb, _next_visit_date date DEFAULT NULL::date, _next_visit_text text DEFAULT NULL::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    _med JSONB;
    _lab JSONB;
    _appt_id UUID;
    _sort_idx INTEGER := 0;
BEGIN
    -- 1. Update Consultation Header
    UPDATE consultations 
    SET diagnosis_codes = _diagnosis,
        chief_complaint = _chief_complaint,  -- ✅ Saving Chief Complaint Separately
        clinical_notes_internal = _notes,    -- ✅ Saving Clinical Notes Separately
        vitals_snapshot = _vitals,
        next_visit_date = _next_visit_date,
        next_visit_text = _next_visit_text   -- ✅ This stores the Advice/Instructions
    WHERE id = _consult_id
    RETURNING appointment_id INTO _appt_id;

    -- 2. Insert Medicines (Loop)
    DELETE FROM prescription_items WHERE consultation_id = _consult_id; -- Safety clean prior items if re-saving behavior (optional but safe)

    FOR _med IN SELECT * FROM jsonb_array_elements(_meds)
    LOOP
        _sort_idx := _sort_idx + 1; -- Increment counter for every item

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

    -- 3. Insert Labs (Loop)
    DELETE FROM lab_orders WHERE consultation_id = _consult_id; -- Safety clean

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

    -- 4. Close the Loop
    UPDATE appointments 
    SET status = 'completed', 
        consult_ended_at = NOW() 
    WHERE id = _appt_id;

    UPDATE queue_tokens 
    SET status = 'completed' 
    WHERE appointment_id = _appt_id;
END;
$$;


--
-- Name: sync_clinic_sub_status(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sync_clinic_sub_status() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    _current_status public.sub_status;
    _current_end timestamp with time zone;
BEGIN
    -- Find the single most relevant active subscription for THIS moment
    SELECT status, ends_at 
    INTO _current_status, _current_end
    FROM clinic_subscriptions
    WHERE clinic_id = NEW.clinic_id
      AND starts_at <= NOW()
    ORDER BY ends_at DESC 
    LIMIT 1;

    -- If found, update cache
    IF FOUND THEN
        UPDATE public.clinics
        SET subscription_status = _current_status,
            subscription_ends_at = _current_end
        WHERE id = NEW.clinic_id;
    ELSE
        -- Fallback if no active sub exists
        UPDATE public.clinics
        SET subscription_status = 'expired',
            subscription_ends_at = NULL
        WHERE id = NEW.clinic_id;
    END IF;

    RETURN NEW;
END;
$$;


--
-- Name: sync_role_to_auth_metadata(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sync_role_to_auth_metadata() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Update the auth.users table directly
    -- We merge the new role into the existing metadata
    UPDATE auth.users
    SET raw_app_meta_data = 
        COALESCE(raw_app_meta_data, '{}'::jsonb) || 
        jsonb_build_object('role', NEW.role)
    WHERE id = NEW.id;
    
    RETURN NEW;
END;
$$;


--
-- Name: sync_user_metadata(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sync_user_metadata() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    UPDATE auth.users
    SET raw_app_meta_data = 
        COALESCE(raw_app_meta_data, '{}'::jsonb) || 
        jsonb_build_object(
            'role', NEW.role, 
            'clinic_id', NEW.clinic_id
        )
    WHERE id = NEW.id;
    RETURN NEW;
END;
$$;


--
-- Name: trigger_audit_log(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_audit_log() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (
        auth.uid(),
        TG_TABLE_NAME || '_' || TG_OP,
        jsonb_build_object('old', to_jsonb(OLD), 'new', to_jsonb(NEW)),
        COALESCE(NEW.id, OLD.id)
    );
    RETURN NEW;
END;
$$;


--
-- Name: trigger_generate_readable_ids(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_generate_readable_ids() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_TABLE_NAME = 'invoices' THEN
        -- Format: INV-25-1001 (Year-Sequence)
        NEW.invoice_number := 'INV-' || to_char(NOW(), 'YY') || '-' || nextval('public.invoice_seq');
    ELSIF TG_TABLE_NAME = 'appointments' THEN
        -- Format: APT-25-5001
        NEW.appointment_number := 'APT-' || to_char(NOW(), 'YY') || '-' || nextval('public.appointment_seq');
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: trigger_generate_token(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_generate_token() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Pass the data to the worker function
    PERFORM public._internal_generate_queue_token(
        NEW.clinic_id,
        NEW.id,
        NEW.patient_id,
        NEW.doctor_id,
        NEW.start_time::DATE -- This ensures we match the signature exactly
    );
    RETURN NEW;
END;
$$;


--
-- Name: trigger_recalculate_invoice_status(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_recalculate_invoice_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    _total_paid numeric;
    _grand_total numeric;
BEGIN
    -- 1. Calculate Sum of all payments for this invoice
    SELECT COALESCE(SUM(amount), 0) INTO _total_paid
    FROM invoice_payments
    WHERE invoice_id = COALESCE(NEW.invoice_id, OLD.invoice_id);

    -- 2. Get the Invoice Grand Total
    SELECT grand_total INTO _grand_total
    FROM invoices
    WHERE id = COALESCE(NEW.invoice_id, OLD.invoice_id);

    -- 3. Determine New Status & Update Invoice
    UPDATE invoices
    SET 
        amount_paid = _total_paid,
        payment_status = CASE 
            WHEN _total_paid >= _grand_total THEN 'paid'::payment_status
            WHEN _total_paid > 0 THEN 'partial'::payment_status
            ELSE 'pending'::payment_status
        END,
        -- Update 'payment_mode' to the latest used mode for simple reference
        payment_mode = COALESCE(NEW.payment_mode, payment_mode) 
    WHERE id = COALESCE(NEW.invoice_id, OLD.invoice_id);

    RETURN NEW;
END;
$$;


--
-- Name: trigger_sync_appt_status(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_sync_appt_status() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- OPTIMIZATION: Only update Appointment if the Token Status dictates a change.
    -- We ignore 'waiting', 'scheduled', 'cancelled' changes here because 
    -- those are handled by specific buttons (Check-in/Cancel).
    
    IF NEW.status = 'called' AND OLD.status != 'called' THEN
        UPDATE appointments 
        SET status = 'in_consult',
            consult_started_at = NOW() -- Good time to timestamp the start
        WHERE id = NEW.appointment_id;
        
    ELSIF NEW.status = 'completed' AND OLD.status != 'completed' THEN
        UPDATE appointments 
        SET status = 'completed',
            consult_ended_at = NOW() -- Good time to timestamp the end
        WHERE id = NEW.appointment_id;
    END IF;

    RETURN NEW;
END;
$$;


--
-- Name: update_appointment_status(uuid, public.appointment_status, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_appointment_status(_appointment_id uuid, _new_status public.appointment_status, _cancellation_reason text DEFAULT NULL::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- 1. Handle "Check In" (Patient Arrived)
    IF _new_status = 'checked_in' THEN
        UPDATE appointments 
        SET status = 'checked_in',
            checked_in_at = NOW() -- <--- THIS is where we set the arrival time
        WHERE id = _appointment_id;

        -- Ensure Queue Token is ready
        UPDATE queue_tokens 
        SET status = 'waiting' 
        WHERE appointment_id = _appointment_id;

    -- 2. Handle "Rescheduled" or "Undo Check-in"
    -- If staff made a mistake and moves them back to 'scheduled', clear the timestamp
    ELSIF _new_status = 'scheduled' THEN
        UPDATE appointments 
        SET status = 'scheduled',
            checked_in_at = NULL 
        WHERE id = _appointment_id;
        
        -- Set token to hold
        UPDATE queue_tokens SET status = 'scheduled' WHERE appointment_id = _appointment_id;

    -- 3. Handle Cancellation
    ELSIF _new_status = 'cancelled' THEN
        UPDATE appointments 
        SET status = 'cancelled'
        WHERE id = _appointment_id;

        UPDATE queue_tokens 
        SET status = 'cancelled' 
        WHERE appointment_id = _appointment_id;

        -- Void unpaid invoices
        UPDATE invoices 
        SET payment_status = CASE 
            WHEN payment_status = 'paid' THEN 'refunded'::payment_status
            ELSE 'pending' -- You might want a 'void' status here eventually
        END
        WHERE appointment_id = _appointment_id;

    -- 4. Standard Update for other statuses (triaged, completed, etc)
    ELSE
        UPDATE appointments SET status = _new_status WHERE id = _appointment_id;
    END IF;
END;
$$;


--
-- Name: update_clinic_master_settings(uuid, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_clinic_master_settings(_clinic_id uuid, _settings jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF public.auth_user_role() != 'admin' THEN RAISE EXCEPTION 'Unauthorized'; END IF;
    
    UPDATE clinics 
    SET settings = settings || _settings -- Merge
    WHERE id = _clinic_id;
    
    -- Log to audit
    INSERT INTO audit_logs (user_id, action, details, resource_id)
    VALUES (auth.uid(), 'update_clinic_settings', _settings, _clinic_id);
END;
$$;


--
-- Name: update_patient_demographics(uuid, text, text, integer, public.gender_type, text, text, text, boolean, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_patient_demographics(_patient_id uuid, _full_name text, _phone text, _age integer, _gender public.gender_type, _address text, _district text, _pincode text, _is_wheelchair boolean DEFAULT NULL::boolean, _is_critical boolean DEFAULT NULL::boolean) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'pg_temp'
    AS $$
DECLARE
    _current_flags jsonb;
    _new_flags jsonb;
    _clinic_id uuid;
BEGIN
    -- 1. Check Ownership/Permissions
    SELECT access_flags, clinic_id INTO _current_flags, _clinic_id FROM patients WHERE id = _patient_id;
    
    -- Users can update themselves, Staff can update clinic patients
    IF (auth.uid() != _patient_id) AND 
       (public.auth_my_clinic_id() != _clinic_id OR public.auth_user_role() = 'user') AND
       NOT public.is_super_admin() 
    THEN
        RAISE EXCEPTION 'Unauthorized update attempt.';
    END IF;

    -- 2. Construct Flags
    _new_flags := _current_flags;
    IF _is_wheelchair IS NOT NULL THEN
        _new_flags := jsonb_set(_new_flags, '{wheelchair}', to_jsonb(_is_wheelchair));
    END IF;
    IF _is_critical IS NOT NULL THEN
        _new_flags := jsonb_set(_new_flags, '{critical}', to_jsonb(_is_critical));
    END IF;

    -- 3. Perform Update
    UPDATE patients
    SET 
        full_name = _full_name,
        phone = _phone,
        age = _age,
        gender = _gender,
        address_street = _address,
        district = _district,
        pincode = _pincode,
        access_flags = _new_flags,
        updated_at = NOW()
    WHERE id = _patient_id;
END;
$$;


--
-- Name: update_queue_triage(uuid, jsonb, boolean, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_queue_triage(_appointment_id uuid, _vitals jsonb, _critical boolean, _wheelchair boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- 1. Update/Create Consultations Vitals
    -- Note: We use ON CONFLICT to handle cases where the consult row exists
    INSERT INTO consultations (appointment_id, vitals_snapshot)
    VALUES (_appointment_id, _vitals)
    ON CONFLICT (appointment_id) 
    DO UPDATE SET vitals_snapshot = consultations.vitals_snapshot || _vitals;

    -- 2. Update Patient Access Flags (Critical for UI badges)
    UPDATE patients 
    SET access_flags = access_flags || jsonb_build_object('critical', _critical, 'wheelchair', _wheelchair),
        updated_at = NOW()
    WHERE id = (SELECT patient_id FROM appointments WHERE id = _appointment_id);
END;
$$;


--
-- Name: upsert_patient_medical_profile(uuid, jsonb, jsonb, jsonb, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.upsert_patient_medical_profile(_patient_id uuid, _allergies jsonb DEFAULT NULL::jsonb, _chronic_conditions jsonb DEFAULT NULL::jsonb, _lifestyle_tags jsonb DEFAULT NULL::jsonb, _family_history jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
    result_record patient_medical_profiles%ROWTYPE;
BEGIN
    INSERT INTO patient_medical_profiles (
        patient_id,
        allergies,
        chronic_conditions,
        lifestyle_tags,
        family_history,
        updated_at
    ) VALUES (
        _patient_id,
        COALESCE(_allergies, '[]'::jsonb),
        COALESCE(_chronic_conditions, '[]'::jsonb),
        COALESCE(_lifestyle_tags, '{}'::jsonb),
        COALESCE(_family_history, '[]'::jsonb),
        NOW()
    )
    ON CONFLICT (patient_id) DO UPDATE SET
        allergies = COALESCE(_allergies, patient_medical_profiles.allergies),
        chronic_conditions = COALESCE(_chronic_conditions, patient_medical_profiles.chronic_conditions),
        lifestyle_tags = COALESCE(_lifestyle_tags, patient_medical_profiles.lifestyle_tags),
        family_history = COALESCE(_family_history, patient_medical_profiles.family_history),
        updated_at = NOW()
    RETURNING * INTO result_record;

    RETURN jsonb_build_object(
        'success', true,
        'patient_id', result_record.patient_id,
        'updated_at', result_record.updated_at
    );
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    clinic_id uuid,
    full_name text,
    email text,
    phone text,
    avatar_url text,
    role public.user_role DEFAULT 'user'::public.user_role,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: admin_users_view; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.admin_users_view AS
 SELECT p.id,
    p.full_name,
    p.email,
    p.role,
    p.clinic_id,
    p.is_active,
    au.last_sign_in_at,
    au.created_at AS signed_up_at,
    au.email_confirmed_at
   FROM (public.profiles p
     JOIN auth.users au ON ((p.id = au.id)));


--
-- Name: appointment_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.appointment_seq
    START WITH 5001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.appointments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    clinic_id uuid,
    patient_id uuid NOT NULL,
    doctor_id uuid NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    status public.appointment_status DEFAULT 'scheduled'::public.appointment_status,
    type text DEFAULT 'fresh'::text,
    checked_in_at timestamp with time zone,
    consult_started_at timestamp with time zone,
    consult_ended_at timestamp with time zone,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    appointment_number text
);


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    action text NOT NULL,
    details jsonb,
    ip_address text,
    created_at timestamp with time zone DEFAULT now(),
    resource_id uuid
);


--
-- Name: clinic_integrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clinic_integrations (
    clinic_id uuid NOT NULL,
    sms_provider text DEFAULT 'twilio'::text,
    sms_config jsonb DEFAULT '{}'::jsonb,
    whatsapp_config jsonb DEFAULT '{}'::jsonb,
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: clinic_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clinic_subscriptions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    clinic_id uuid,
    plan_code public.subscription_tier,
    status public.sub_status DEFAULT 'active'::public.sub_status,
    starts_at timestamp with time zone DEFAULT now(),
    ends_at timestamp with time zone NOT NULL,
    payment_provider_id text,
    limit_doctors integer,
    limit_sms_enabled boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: clinics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clinics (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    address_line_1 text,
    address_line_2 text,
    city text,
    state text,
    pincode text,
    phone_primary text,
    phone_secondary text,
    email_contact text,
    website_url text,
    logo_url text,
    header_image_url text,
    footer_text text,
    settings jsonb DEFAULT '{"currency": "INR", "tax_rate": 0, "sms_enabled": true}'::jsonb,
    created_at timestamp with time zone DEFAULT now(),
    subscription_status public.sub_status DEFAULT 'active'::public.sub_status,
    subscription_ends_at timestamp with time zone
);


--
-- Name: communication_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.communication_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    clinic_id uuid,
    type text NOT NULL,
    recipient text NOT NULL,
    status text,
    provider_response jsonb,
    cost numeric(10,4) DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: consultations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.consultations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    appointment_id uuid,
    doctor_id uuid,
    vitals_snapshot jsonb DEFAULT '{}'::jsonb,
    chief_complaint text,
    diagnosis_codes jsonb DEFAULT '[]'::jsonb,
    symptoms_structured jsonb DEFAULT '[]'::jsonb,
    clinical_notes_internal text,
    next_visit_date date,
    next_visit_text text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: doctor_protocols; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doctor_protocols (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    doctor_id uuid,
    protocol_name text NOT NULL,
    drugs_template jsonb DEFAULT '[]'::jsonb,
    labs_template jsonb DEFAULT '[]'::jsonb,
    advice_template text
);


--
-- Name: doctor_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doctor_schedules (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    doctor_id uuid,
    day_of_week integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL
);


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doctors (
    profile_id uuid NOT NULL,
    specialty text NOT NULL,
    qualifications text NOT NULL,
    registration_number text NOT NULL,
    current_hospital_attachment text,
    digital_signature_url text,
    fees_structure jsonb DEFAULT '{}'::jsonb,
    avg_consult_time_min integer DEFAULT 15,
    is_available boolean DEFAULT true,
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    invoice_id uuid,
    description text NOT NULL,
    quantity integer DEFAULT 1,
    unit_price numeric(10,2) NOT NULL,
    total_price numeric(10,2) NOT NULL
);


--
-- Name: invoice_payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_payments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    invoice_id uuid NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_mode text NOT NULL,
    transaction_ref text,
    payment_date timestamp with time zone DEFAULT now(),
    notes text,
    created_by uuid,
    CONSTRAINT invoice_payments_amount_check CHECK ((amount > (0)::numeric))
);


--
-- Name: invoice_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoice_seq
    START WITH 1001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    appointment_id uuid,
    sub_total numeric(10,2) NOT NULL,
    tax_total numeric(10,2) DEFAULT 0,
    grand_total numeric(10,2) NOT NULL,
    payment_mode text,
    payment_status public.payment_status DEFAULT 'pending'::public.payment_status,
    transaction_ref text,
    generated_pdf_url text,
    created_at timestamp with time zone DEFAULT now(),
    invoice_number text,
    amount_paid numeric(10,2) DEFAULT 0
);


--
-- Name: lab_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lab_orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    consultation_id uuid,
    test_name text NOT NULL,
    instruction text,
    is_completed boolean DEFAULT false
);


--
-- Name: medicine_master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medicine_master (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    manufacturer_name text,
    salt_composition text,
    short_composition1 text,
    short_composition2 text,
    pack_size_label text,
    price numeric(10,2),
    type text,
    medicine_desc text,
    side_effects text,
    is_discontinued boolean DEFAULT false,
    search_vector tsvector GENERATED ALWAYS AS (to_tsvector('english'::regconfig, ((name || ' '::text) || COALESCE(salt_composition, ''::text)))) STORED,
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: patient_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patient_documents (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    patient_id uuid,
    file_url text NOT NULL,
    file_name text NOT NULL,
    category public.file_category DEFAULT 'other'::public.file_category,
    uploaded_by uuid,
    uploaded_at timestamp with time zone DEFAULT now()
);


--
-- Name: patient_medical_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patient_medical_profiles (
    patient_id uuid NOT NULL,
    allergies jsonb DEFAULT '[]'::jsonb,
    chronic_conditions jsonb DEFAULT '[]'::jsonb,
    lifestyle_tags jsonb DEFAULT '{}'::jsonb,
    family_history jsonb DEFAULT '[]'::jsonb,
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patients (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    clinic_id uuid,
    uhid text,
    full_name text NOT NULL,
    phone text,
    dob date,
    age integer,
    gender public.gender_type DEFAULT 'Male'::public.gender_type,
    religion text,
    address_street text,
    district text,
    state text,
    pincode text,
    access_flags jsonb DEFAULT '{"critical": false, "wheelchair": false}'::jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    blood_group text
);


--
-- Name: plan_master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_master (
    code public.subscription_tier NOT NULL,
    name text NOT NULL,
    max_doctors integer DEFAULT 1,
    max_storage_mb integer DEFAULT 500,
    sms_enabled boolean DEFAULT false,
    monthly_price numeric(10,2) NOT NULL,
    is_public boolean DEFAULT true
);


--
-- Name: prescription_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prescription_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    consultation_id uuid,
    medicine_master_id uuid,
    medicine_name_manual text,
    cached_composition text,
    frequency text NOT NULL,
    duration text NOT NULL,
    instructions_timing text,
    special_instructions text,
    sort_order integer DEFAULT 0
);


--
-- Name: queue_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.queue_tokens (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    clinic_id uuid,
    appointment_id uuid,
    token_number integer NOT NULL,
    room_number text,
    status public.queue_status DEFAULT 'scheduled'::public.queue_status,
    called_at timestamp with time zone,
    date_of_service date DEFAULT CURRENT_DATE,
    doctor_id uuid,
    patient_id uuid,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: service_master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_master (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    clinic_id uuid,
    name text NOT NULL,
    default_price numeric(10,2) NOT NULL,
    tax_rate numeric(5,2) DEFAULT 0,
    is_active boolean DEFAULT true
);


--
-- Name: appointments appointments_appointment_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_appointment_number_key UNIQUE (appointment_number);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: clinic_integrations clinic_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clinic_integrations
    ADD CONSTRAINT clinic_integrations_pkey PRIMARY KEY (clinic_id);


--
-- Name: clinic_subscriptions clinic_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clinic_subscriptions
    ADD CONSTRAINT clinic_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: clinics clinics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_pkey PRIMARY KEY (id);


--
-- Name: communication_logs communication_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communication_logs
    ADD CONSTRAINT communication_logs_pkey PRIMARY KEY (id);


--
-- Name: consultations consultations_appointment_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT consultations_appointment_id_key UNIQUE (appointment_id);


--
-- Name: consultations consultations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT consultations_pkey PRIMARY KEY (id);


--
-- Name: doctor_protocols doctor_protocols_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor_protocols
    ADD CONSTRAINT doctor_protocols_pkey PRIMARY KEY (id);


--
-- Name: doctor_schedules doctor_schedules_doctor_id_day_of_week_start_time_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor_schedules
    ADD CONSTRAINT doctor_schedules_doctor_id_day_of_week_start_time_key UNIQUE (doctor_id, day_of_week, start_time);


--
-- Name: doctor_schedules doctor_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor_schedules
    ADD CONSTRAINT doctor_schedules_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (profile_id);


--
-- Name: invoice_items invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- Name: invoice_payments invoice_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_payments
    ADD CONSTRAINT invoice_payments_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_invoice_number_key UNIQUE (invoice_number);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: lab_orders lab_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lab_orders
    ADD CONSTRAINT lab_orders_pkey PRIMARY KEY (id);


--
-- Name: medicine_master medicine_master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medicine_master
    ADD CONSTRAINT medicine_master_pkey PRIMARY KEY (id);


--
-- Name: patient_documents patient_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient_documents
    ADD CONSTRAINT patient_documents_pkey PRIMARY KEY (id);


--
-- Name: patient_medical_profiles patient_medical_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient_medical_profiles
    ADD CONSTRAINT patient_medical_profiles_pkey PRIMARY KEY (patient_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: patients patients_uhid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_uhid_key UNIQUE (uhid);


--
-- Name: plan_master plan_master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_master
    ADD CONSTRAINT plan_master_pkey PRIMARY KEY (code);


--
-- Name: prescription_items prescription_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT prescription_items_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: queue_tokens queue_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_tokens
    ADD CONSTRAINT queue_tokens_pkey PRIMARY KEY (id);


--
-- Name: service_master service_master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_master
    ADD CONSTRAINT service_master_pkey PRIMARY KEY (id);


--
-- Name: idx_appointments_clinic_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointments_clinic_date ON public.appointments USING btree (clinic_id, start_time);


--
-- Name: idx_appointments_patient_history; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointments_patient_history ON public.appointments USING btree (patient_id, start_time DESC);


--
-- Name: idx_appointments_queue; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointments_queue ON public.appointments USING btree (doctor_id, status, start_time);


--
-- Name: idx_comms_clinic_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comms_clinic_date ON public.communication_logs USING btree (clinic_id, created_at DESC);


--
-- Name: idx_doctor_protocols_doctor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_doctor_protocols_doctor_id ON public.doctor_protocols USING btree (doctor_id);


--
-- Name: idx_invoices_appt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_invoices_appt_id ON public.invoices USING btree (appointment_id);


--
-- Name: idx_invoices_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_invoices_created_at ON public.invoices USING btree (created_at);


--
-- Name: idx_invoices_number_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_invoices_number_trgm ON public.invoices USING gin (invoice_number public.gin_trgm_ops);


--
-- Name: idx_invoices_search_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_invoices_search_trgm ON public.invoices USING gin (invoice_number public.gin_trgm_ops);


--
-- Name: idx_medicine_name_prefix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_medicine_name_prefix ON public.medicine_master USING btree (name text_pattern_ops);


--
-- Name: idx_medicine_salt_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_medicine_salt_trgm ON public.medicine_master USING gin (salt_composition public.gin_trgm_ops);


--
-- Name: idx_medicine_search; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_medicine_search ON public.medicine_master USING gin (search_vector);


--
-- Name: idx_meds_vector; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_meds_vector ON public.medicine_master USING gin (search_vector);


--
-- Name: idx_patients_clinic_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_patients_clinic_created ON public.patients USING btree (clinic_id, created_at DESC);


--
-- Name: idx_patients_lookup; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_patients_lookup ON public.patients USING btree (phone, uhid);


--
-- Name: idx_patients_name_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_patients_name_trgm ON public.patients USING gin (full_name public.gin_trgm_ops);


--
-- Name: idx_patients_phone_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_patients_phone_trgm ON public.patients USING gin (phone public.gin_trgm_ops);


--
-- Name: idx_patients_uhid_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_patients_uhid_trgm ON public.patients USING gin (uhid public.gin_trgm_ops);


--
-- Name: idx_queue_doctor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_queue_doctor ON public.queue_tokens USING btree (doctor_id);


--
-- Name: idx_queue_doctor_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_queue_doctor_active ON public.queue_tokens USING btree (doctor_id, date_of_service, status);


--
-- Name: idx_queue_monitor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_queue_monitor ON public.queue_tokens USING btree (clinic_id, date_of_service, status);


--
-- Name: idx_subs_lookup; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_subs_lookup ON public.clinic_subscriptions USING btree (clinic_id, status, ends_at);


--
-- Name: doctors handle_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.doctors FOR EACH ROW EXECUTE FUNCTION public.moddatetime('updated_at');


--
-- Name: medicine_master handle_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.medicine_master FOR EACH ROW EXECUTE FUNCTION public.moddatetime('updated_at');


--
-- Name: patient_medical_profiles handle_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.patient_medical_profiles FOR EACH ROW EXECUTE FUNCTION public.moddatetime('updated_at');


--
-- Name: patients handle_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.patients FOR EACH ROW EXECUTE FUNCTION public.moddatetime('updated_at');


--
-- Name: appointments trg_audit_appointments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_audit_appointments AFTER UPDATE ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.trigger_audit_log();


--
-- Name: invoices trg_audit_invoices; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_audit_invoices AFTER UPDATE ON public.invoices FOR EACH ROW EXECUTE FUNCTION public.trigger_audit_log();


--
-- Name: profiles trg_audit_profiles; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_audit_profiles AFTER UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.trigger_audit_log();


--
-- Name: profiles trg_check_doctor_limit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_check_doctor_limit BEFORE INSERT OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.enforce_plan_limits_doctors();


--
-- Name: profiles trg_ensure_doctor_row; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_ensure_doctor_row AFTER UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.handle_doctor_role_change();


--
-- Name: appointments trg_gen_appt_num; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_gen_appt_num BEFORE INSERT ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.trigger_generate_readable_ids();


--
-- Name: invoices trg_gen_inv_num; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_gen_inv_num BEFORE INSERT ON public.invoices FOR EACH ROW EXECUTE FUNCTION public.trigger_generate_readable_ids();


--
-- Name: appointments trg_on_appointment_created; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_on_appointment_created AFTER INSERT ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.trigger_generate_token();


--
-- Name: queue_tokens trg_on_queue_update; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_on_queue_update AFTER UPDATE ON public.queue_tokens FOR EACH ROW EXECUTE FUNCTION public.trigger_sync_appt_status();


--
-- Name: clinic_subscriptions trg_sync_sub_status; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_sync_sub_status AFTER INSERT OR UPDATE ON public.clinic_subscriptions FOR EACH ROW EXECUTE FUNCTION public.sync_clinic_sub_status();


--
-- Name: invoice_payments trg_update_invoice_after_payment; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_invoice_after_payment AFTER INSERT OR DELETE OR UPDATE ON public.invoice_payments FOR EACH ROW EXECUTE FUNCTION public.trigger_recalculate_invoice_status();


--
-- Name: profiles trigger_sync_role_to_metadata; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_sync_role_to_metadata AFTER INSERT OR UPDATE OF role ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.sync_role_to_auth_metadata();


--
-- Name: profiles trigger_sync_user_metadata; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_sync_user_metadata AFTER INSERT OR UPDATE OF role, clinic_id ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.sync_user_metadata();


--
-- Name: appointments appointments_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id);


--
-- Name: appointments appointments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.profiles(id);


--
-- Name: appointments appointments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(profile_id);


--
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: audit_logs audit_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id);


--
-- Name: clinic_integrations clinic_integrations_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clinic_integrations
    ADD CONSTRAINT clinic_integrations_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id) ON DELETE CASCADE;


--
-- Name: clinic_subscriptions clinic_subscriptions_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clinic_subscriptions
    ADD CONSTRAINT clinic_subscriptions_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id) ON DELETE CASCADE;


--
-- Name: clinic_subscriptions clinic_subscriptions_plan_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clinic_subscriptions
    ADD CONSTRAINT clinic_subscriptions_plan_code_fkey FOREIGN KEY (plan_code) REFERENCES public.plan_master(code);


--
-- Name: communication_logs communication_logs_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communication_logs
    ADD CONSTRAINT communication_logs_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id);


--
-- Name: consultations consultations_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT consultations_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id);


--
-- Name: consultations consultations_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT consultations_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(profile_id);


--
-- Name: doctor_protocols doctor_protocols_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor_protocols
    ADD CONSTRAINT doctor_protocols_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(profile_id);


--
-- Name: doctor_schedules doctor_schedules_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor_schedules
    ADD CONSTRAINT doctor_schedules_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(profile_id) ON DELETE CASCADE;


--
-- Name: doctors doctors_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: invoice_items invoice_items_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE CASCADE;


--
-- Name: invoice_payments invoice_payments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_payments
    ADD CONSTRAINT invoice_payments_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.profiles(id);


--
-- Name: invoice_payments invoice_payments_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_payments
    ADD CONSTRAINT invoice_payments_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE CASCADE;


--
-- Name: invoices invoices_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- Name: lab_orders lab_orders_consultation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lab_orders
    ADD CONSTRAINT lab_orders_consultation_id_fkey FOREIGN KEY (consultation_id) REFERENCES public.consultations(id) ON DELETE CASCADE;


--
-- Name: patient_documents patient_documents_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient_documents
    ADD CONSTRAINT patient_documents_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;


--
-- Name: patient_documents patient_documents_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient_documents
    ADD CONSTRAINT patient_documents_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.profiles(id);


--
-- Name: patient_medical_profiles patient_medical_profiles_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient_medical_profiles
    ADD CONSTRAINT patient_medical_profiles_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;


--
-- Name: patients patients_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id);


--
-- Name: prescription_items prescription_items_consultation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT prescription_items_consultation_id_fkey FOREIGN KEY (consultation_id) REFERENCES public.consultations(id) ON DELETE CASCADE;


--
-- Name: prescription_items prescription_items_medicine_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT prescription_items_medicine_master_id_fkey FOREIGN KEY (medicine_master_id) REFERENCES public.medicine_master(id);


--
-- Name: profiles profiles_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id);


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: queue_tokens queue_tokens_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_tokens
    ADD CONSTRAINT queue_tokens_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id);


--
-- Name: queue_tokens queue_tokens_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_tokens
    ADD CONSTRAINT queue_tokens_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id);


--
-- Name: queue_tokens queue_tokens_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_tokens
    ADD CONSTRAINT queue_tokens_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(profile_id);


--
-- Name: queue_tokens queue_tokens_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_tokens
    ADD CONSTRAINT queue_tokens_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: service_master service_master_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_master
    ADD CONSTRAINT service_master_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id);


--
-- Name: clinic_integrations Admin view integrations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin view integrations" ON public.clinic_integrations FOR SELECT USING (((clinic_id = public.auth_my_clinic_id()) AND (public.auth_user_role() = 'admin'::public.user_role)));


--
-- Name: clinics Admins update their own clinic; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins update their own clinic" ON public.clinics FOR UPDATE USING (((id = public.auth_my_clinic_id()) AND (public.auth_user_role() = 'admin'::public.user_role)));


--
-- Name: appointments Appointment Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Appointment Isolation" ON public.appointments USING ((public.is_super_admin() OR (clinic_id = public.auth_my_clinic_id())));


--
-- Name: audit_logs Audit Insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Audit Insert" ON public.audit_logs FOR INSERT WITH CHECK ((auth.uid() IS NOT NULL));


--
-- Name: audit_logs Audit View; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Audit View" ON public.audit_logs FOR SELECT USING ((public.is_super_admin() OR ((public.auth_user_role() = 'admin'::public.user_role) AND (EXISTS ( SELECT 1
   FROM public.profiles p
  WHERE ((p.id = audit_logs.user_id) AND (p.clinic_id = public.auth_my_clinic_id())))))));


--
-- Name: communication_logs Clinic view logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Clinic view logs" ON public.communication_logs FOR SELECT USING ((clinic_id = public.auth_my_clinic_id()));


--
-- Name: clinic_subscriptions Clinic view own sub; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Clinic view own sub" ON public.clinic_subscriptions FOR SELECT USING ((clinic_id = public.auth_my_clinic_id()));


--
-- Name: clinics Clinics insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Clinics insert" ON public.clinics FOR INSERT WITH CHECK (public.is_super_admin());


--
-- Name: clinics Clinics update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Clinics update" ON public.clinics FOR UPDATE USING ((public.is_super_admin() OR ((id = public.auth_my_clinic_id()) AND (public.auth_user_role() = 'admin'::public.user_role))));


--
-- Name: clinics Clinics visibility; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Clinics visibility" ON public.clinics FOR SELECT USING ((public.is_super_admin() OR (id = public.auth_my_clinic_id())));


--
-- Name: consultations Consultation Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Consultation Isolation" ON public.consultations USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM public.appointments a
  WHERE ((a.id = consultations.appointment_id) AND (a.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: doctors Doctors Insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Doctors Insert" ON public.doctors FOR INSERT WITH CHECK ((public.is_super_admin() OR ((public.auth_user_role() = 'admin'::public.user_role) AND (EXISTS ( SELECT 1
   FROM public.profiles p
  WHERE ((p.id = doctors.profile_id) AND (p.clinic_id = public.auth_my_clinic_id())))))));


--
-- Name: doctors Doctors Update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Doctors Update" ON public.doctors FOR UPDATE USING ((public.is_super_admin() OR (profile_id = auth.uid()) OR ((public.auth_user_role() = 'admin'::public.user_role) AND (EXISTS ( SELECT 1
   FROM public.profiles p
  WHERE ((p.id = doctors.profile_id) AND (p.clinic_id = public.auth_my_clinic_id())))))));


--
-- Name: doctors Doctors View; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Doctors View" ON public.doctors FOR SELECT USING ((public.is_super_admin() OR (profile_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles p
  WHERE ((p.id = doctors.profile_id) AND (p.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: patient_documents Documents Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Documents Isolation" ON public.patient_documents USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM public.patients p
  WHERE ((p.id = patient_documents.patient_id) AND (p.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: invoices Invoice Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Invoice Isolation" ON public.invoices USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM public.appointments a
  WHERE ((a.id = invoices.appointment_id) AND (a.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: invoice_items Invoice Items Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Invoice Items Isolation" ON public.invoice_items USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM (public.invoices i
     JOIN public.appointments a ON ((i.appointment_id = a.id)))
  WHERE ((i.id = invoice_items.invoice_id) AND (a.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: lab_orders Lab Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Lab Isolation" ON public.lab_orders USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM (public.consultations c
     JOIN public.appointments a ON ((c.appointment_id = a.id)))
  WHERE ((c.id = lab_orders.consultation_id) AND (a.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: patient_medical_profiles Medical Profile Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Medical Profile Isolation" ON public.patient_medical_profiles USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM public.patients p
  WHERE ((p.id = patient_medical_profiles.patient_id) AND (p.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: medicine_master Medicine Master Read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Medicine Master Read" ON public.medicine_master FOR SELECT USING ((auth.uid() IS NOT NULL));


--
-- Name: medicine_master Medicine Master Write; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Medicine Master Write" ON public.medicine_master USING (public.is_super_admin());


--
-- Name: patients Patient Manage Staff; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Patient Manage Staff" ON public.patients USING ((((public.auth_user_role() = ANY (ARRAY['admin'::public.user_role, 'staff'::public.user_role])) AND (clinic_id = public.auth_my_clinic_id())) OR public.is_super_admin()));


--
-- Name: patients Patient View Self; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Patient View Self" ON public.patients FOR SELECT USING ((((public.auth_user_role() = 'user'::public.user_role) AND (id = auth.uid())) OR ((public.auth_user_role() = ANY (ARRAY['admin'::public.user_role, 'staff'::public.user_role, 'doctor'::public.user_role])) AND (clinic_id = public.auth_my_clinic_id())) OR public.is_super_admin()));


--
-- Name: invoice_payments Payments Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Payments Isolation" ON public.invoice_payments USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM (public.invoices i
     JOIN public.appointments a ON ((i.appointment_id = a.id)))
  WHERE ((i.id = invoice_payments.invoice_id) AND (a.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: prescription_items Prescription Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Prescription Isolation" ON public.prescription_items USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM (public.consultations c
     JOIN public.appointments a ON ((c.appointment_id = a.id)))
  WHERE ((c.id = prescription_items.consultation_id) AND (a.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: profiles Profiles Insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Profiles Insert" ON public.profiles FOR INSERT WITH CHECK ((public.is_super_admin() OR ((public.auth_user_role() = 'admin'::public.user_role) AND (clinic_id = public.auth_my_clinic_id()))));


--
-- Name: profiles Profiles Update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Profiles Update" ON public.profiles FOR UPDATE USING ((public.is_super_admin() OR (id = auth.uid()) OR ((public.auth_user_role() = 'admin'::public.user_role) AND (clinic_id = public.auth_my_clinic_id()))));


--
-- Name: profiles Profiles View; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Profiles View" ON public.profiles FOR SELECT USING ((public.is_super_admin() OR (id = auth.uid()) OR (clinic_id = public.auth_my_clinic_id())));


--
-- Name: doctor_protocols Protocols Access; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Protocols Access" ON public.doctor_protocols USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM public.profiles p
  WHERE ((p.id = doctor_protocols.doctor_id) AND (p.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: plan_master Public read plans; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public read plans" ON public.plan_master FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: queue_tokens Queue Isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Queue Isolation" ON public.queue_tokens USING ((public.is_super_admin() OR (clinic_id = public.auth_my_clinic_id())));


--
-- Name: clinic_integrations SA manage integrations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "SA manage integrations" ON public.clinic_integrations USING (public.is_super_admin());


--
-- Name: plan_master SA manage plans; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "SA manage plans" ON public.plan_master USING (public.is_super_admin());


--
-- Name: clinic_subscriptions SA manage subs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "SA manage subs" ON public.clinic_subscriptions USING (public.is_super_admin());


--
-- Name: communication_logs SA view logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "SA view logs" ON public.communication_logs USING (public.is_super_admin());


--
-- Name: doctor_schedules Schedules Access; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Schedules Access" ON public.doctor_schedules USING ((public.is_super_admin() OR (EXISTS ( SELECT 1
   FROM public.profiles p
  WHERE ((p.id = doctor_schedules.doctor_id) AND (p.clinic_id = public.auth_my_clinic_id()))))));


--
-- Name: service_master Service Master Manage; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Service Master Manage" ON public.service_master USING ((public.is_super_admin() OR ((clinic_id = public.auth_my_clinic_id()) AND (public.auth_user_role() = 'admin'::public.user_role))));


--
-- Name: service_master Service Master View; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Service Master View" ON public.service_master FOR SELECT USING ((public.is_super_admin() OR (clinic_id = public.auth_my_clinic_id())));


--
-- Name: clinics Users view their own clinic; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users view their own clinic" ON public.clinics FOR SELECT USING ((id = public.auth_my_clinic_id()));


--
-- Name: appointments; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.appointments ENABLE ROW LEVEL SECURITY;

--
-- Name: audit_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: clinic_integrations; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.clinic_integrations ENABLE ROW LEVEL SECURITY;

--
-- Name: clinic_subscriptions; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.clinic_subscriptions ENABLE ROW LEVEL SECURITY;

--
-- Name: clinics; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.clinics ENABLE ROW LEVEL SECURITY;

--
-- Name: communication_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.communication_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: consultations; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.consultations ENABLE ROW LEVEL SECURITY;

--
-- Name: doctor_protocols; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.doctor_protocols ENABLE ROW LEVEL SECURITY;

--
-- Name: doctor_schedules; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.doctor_schedules ENABLE ROW LEVEL SECURITY;

--
-- Name: doctors; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.doctors ENABLE ROW LEVEL SECURITY;

--
-- Name: invoice_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.invoice_items ENABLE ROW LEVEL SECURITY;

--
-- Name: invoice_payments; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.invoice_payments ENABLE ROW LEVEL SECURITY;

--
-- Name: invoices; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.invoices ENABLE ROW LEVEL SECURITY;

--
-- Name: lab_orders; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.lab_orders ENABLE ROW LEVEL SECURITY;

--
-- Name: medicine_master; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.medicine_master ENABLE ROW LEVEL SECURITY;

--
-- Name: patient_documents; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.patient_documents ENABLE ROW LEVEL SECURITY;

--
-- Name: patient_medical_profiles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.patient_medical_profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: patients; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.patients ENABLE ROW LEVEL SECURITY;

--
-- Name: plan_master; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.plan_master ENABLE ROW LEVEL SECURITY;

--
-- Name: prescription_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.prescription_items ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: queue_tokens; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.queue_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: service_master; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.service_master ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict xK0qVo82htivrXxhtvEaKwdqceCeMfcJ8KQYXFelVTrwxEotgQUqtSq9pM1DNox

