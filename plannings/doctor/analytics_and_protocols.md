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

