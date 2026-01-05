# Doctor Dashboard Workflow

**Path:** `/doctor`
**Component:** `app/doctor/(main)/page.tsx`

## Purpose
The central hub for doctors to monitor daily metrics, view their appointment queue, and manage patient flow (calling patients).

## Workflow Steps

### 1. Initialization & Data Loading
- **Source:** `getDoctorDashboardData()` in `lib/actions/doctor.ts` (Server Action).
- **Client Logic:** `DashboardClient` also implements a polling mechanism (every 10 seconds) using `router.refresh()` to keep the queue live.
- **Logic:**
  1.  **Authentication:** Verifies user session.
  2.  **Profile Fetch:** Gets doctor's full name.
  3.  **Metrics RPC:** `get_doctor_dashboard_metrics({ p_doctor_id })`. Returns `waiting_count`, `completed_today`, `avg_consult_time_mins`, `avg_wait_time_mins`.
  4.  **Queue RPC:** `get_doctor_active_queue({ p_doctor_id })`. Returns list of patients with statuses (`waiting`, `called`, `in_consult`).
  5.  **Data Processing:** Separates `currentSession` (called/in_consult) from `activeQueue` (waiting).

### 2. UI Structure
- **Quick Metrics:** Grid of 4 cards displaying Waiting, Completed, Avg Consult Time, and Total Scheduled.
- **Active Session:** Large card showing the currently "Called" or "In Consultation" patient with "Start Consultation" button. Handles "Critical Patient" flags.
- **Waiting Room:** List of patients waiting, ordered by token, showing wait time indicators (color-coded).

### 3. Queue Actions (Call Patient)
- **UI:** "Call" button on a waiting patient item.
- **Action:** `callPatient(appointmentId)` in `lib/actions/doctor.ts`.
- **RPC:** `doctor_call_patient({ _appointment_id, _doctor_id })`.
- **Outcome:** Updates appointment status, moves patient to "Current Session", revalidates `/doctor` path, and optionally redirects to the consultation page.