This is a security-sensitive requirement. Storing API keys in a database requires strict **Row Level Security (RLS)** to ensure a doctor or staff member from **Clinic A** cannot see the keys of **Clinic B**.

Here is the complete SQL solution to create the table, set up security policies, and providing a helper function to fetch the key securely.

### Step 1: Create the Table

We will create a table `clinic_api_keys` linked to the `clinic_id`.

```sql
CREATE TABLE public.clinic_api_keys (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    clinic_id uuid REFERENCES public.clinics(id) ON DELETE CASCADE NOT NULL,
    provider text NOT NULL, -- e.g., 'openai', 'anthropic'
    api_key text NOT NULL,  -- The secret key (sk-...)
    label text,             -- e.g., "Main Clinic Key"
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    
    -- Ensure one active provider key per clinic to avoid confusion (Optional)
    UNIQUE (clinic_id, provider)
);

-- Enable RLS immediately
ALTER TABLE public.clinic_api_keys ENABLE ROW LEVEL SECURITY;

-- Add updated_at trigger
CREATE TRIGGER handle_updated_at 
BEFORE UPDATE ON public.clinic_api_keys 
FOR EACH ROW EXECUTE FUNCTION public.moddatetime('updated_at');

-- Add Audit Logging (Important for secrets)
CREATE TRIGGER trg_audit_api_keys 
AFTER UPDATE OR INSERT OR DELETE ON public.clinic_api_keys 
FOR EACH ROW EXECUTE FUNCTION public.trigger_audit_log();
```

---

### Step 2: RLS Policies (Who can read/write?)

We need strict policies. 
1. **Super Admins**: Can see everything.
2. **Admins/Doctors/Staff**: Can only see keys for **their own clinic**.
3. **Write Access**: Usually, only **Admins** should be allowed to add/update keys to prevent staff from breaking integrations.

```sql
-- 1. VIEW POLICY (Read Access)
-- Allowed: Super Admin OR (Same Clinic AND Role is authorized)
CREATE POLICY "Authorized users view keys" ON public.clinic_api_keys
FOR SELECT USING (
    public.is_super_admin() 
    OR 
    (
        clinic_id = public.auth_my_clinic_id() 
        AND 
        public.auth_user_role() IN ('admin', 'doctor', 'staff')
    )
);

-- 2. INSERT/UPDATE POLICY (Write Access)
-- Allowed: Super Admin OR (Same Clinic AND Role is ADMIN only)
-- We strictly limit write access to Admins. Doctors/Staff shouldn't change keys.
CREATE POLICY "Admins manage keys" ON public.clinic_api_keys
FOR ALL USING (
    public.is_super_admin() 
    OR 
    (
        clinic_id = public.auth_my_clinic_id() 
        AND 
        public.auth_user_role() = 'admin'
    )
);
```

---

### Step 3: Secure Fetch Function (Best Practice)

While the RLS above allows your Flutter app to `SELECT * FROM clinic_api_keys`, **it is safer** to use a dedicated function. This makes it easier to fetch the specific key you need (e.g., OpenAI) without querying the whole table.

```sql
CREATE OR REPLACE FUNCTION public.get_active_api_key(_provider text)
RETURNS text
LANGUAGE plpgsql
SECURITY DEFINER -- Runs with elevated privileges
SET search_path = public, pg_temp
AS $$
DECLARE
    _key text;
    _clinic_id uuid;
    _user_role public.user_role;
BEGIN
    -- 1. Get Context
    _clinic_id := public.auth_my_clinic_id();
    _user_role := public.auth_user_role();

    -- 2. Security Gate
    -- Allow Super Admin, OR valid roles within the clinic
    IF NOT public.is_super_admin() THEN
        IF _clinic_id IS NULL OR _user_role NOT IN ('admin', 'doctor', 'staff') THEN
            RAISE EXCEPTION 'Access Denied: You do not have permission to view API keys.';
        END IF;
    END IF;

    -- 3. Fetch the Key
    SELECT api_key INTO _key
    FROM clinic_api_keys
    WHERE provider = _provider
    AND is_active = true
    AND (
        public.is_super_admin() -- Returns first key found (Logic varies for SA)
        OR 
        clinic_id = _clinic_id
    )
    LIMIT 1;

    RETURN _key;
END;
$$;
```

### Usage


#### Option B: Using the Secure Function (Recommended)
```dart
final response = await supabase
    .rpc('get_active_api_key', params: {'_provider': 'openai'});

print(response); // Returns the string directly
```

### ⚠️ Critical Security Warning
**Do not use this key directly in your Flutter/React Frontend code.**

If you fetch this key to the Flutter app and then make an HTTP call to OpenAI from the phone:
1. A hacker can inspect the network traffic on the phone.
2. They will see `Authorization: Bearer sk-your-secret-key`.
3. They can steal your key and drain your credits.

**The Correct Architecture:**
1. Store the key in this table.
2. Create a **Supabase Edge Function** (Backend).
3. The Flutter App calls the Edge Function (sending the prompt).
4. The Edge Function (server-side) fetches the key from the DB using the logic above.
5. The Edge Function calls OpenAI.
6. The Edge Function returns the result to Flutter.

**The key should never leave the server.**