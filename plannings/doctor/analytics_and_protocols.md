# Analytics Workflow

**Path:** `/doctor/analytics`
**Component:** `app/doctor/(main)/analytics/page.tsx`

## Purpose
Provides doctors with insights into their practice performance, such as patient volume and time management.

## Workflow Steps

### 1. Data Loading
- **Source:** `getDoctorAnalytics()` in `lib/actions/doctor.ts`.
- **Logic:**
  - **RPC:** `get_doctor_analytics({ _doctor_id })`.
  - **Data:** Returns `patients_seen_today`, `avg_consult_time_min`.

### 2. UI Display
- **Time Efficiency Card:** Displays average consult time vs Clinic Average (hardcoded target).
- **Volume Card:** Total patients seen today.
- **Common Diagnoses:** (Currently a placeholder) Intended to show historical clinical trends.

---

# Protocols Workflow

**Path:** `/doctor/my-protocols`
**Component:** `app/doctor/(main)/my-protocols/page.tsx`

## Purpose
Allows doctors to create, manage, and apply reusable prescription templates (protocols) to speed up consultations.

## Workflow Steps

### 1. Listing Protocols
- **Source:** `getDoctorProtocols()` in `lib/actions/doctor.ts`.
- **Logic:** Direct Supabase query to `doctor_protocols` table.
- **UI:** Sidebar list of protocols with selection logic.

### 2. Creating/Updating Protocols
- **UI:** Master-Detail view. Selecting a protocol opens it in the editor.
- **Editor:** Inputs for Name, Medicines List (Name, Frequency, Duration), and Labs List.
- **Action:** `saveDoctorProtocol(name, drugs, labs, id?)`.
- **Logic:** Upserts to `doctor_protocols`.

### 3. Deleting Protocols
- **Action:** `deleteDoctorProtocol(id)`.
- **UI:** Delete button in the protocol header.