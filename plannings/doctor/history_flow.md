# Appointment History Workflow

**Path:** `/doctor/history`
**Component:** `app/doctor/(main)/history/page.tsx` (Wrapper) -> `AppointmentHistoryClient.tsx`

## Purpose
A searchable archive of all past appointments and consultations for the doctor.

## Workflow Steps

### 1. Data Loading (Client-Side)
- **Mechanism:** `useEffect` triggers `fetchData` on mount and when search params change.
- **Source:** `getDoctorAppointmentsHistory(params)` in `lib/actions/doctor.ts`.
- **Params:** `page`, `pageSize`, `startDate`, `endDate`, `searchText`, `statusFilter`.
- **RPC:** `get_doctor_appointments_history`.
  - Handles pagination and filtering on the server side.

### 2. UI Structure
- **Control Bar:** Date Range Picker (Pop-over), Total Records count.
- **Filters:** Text Search (debounced), Status Pills (All, Completed, Scheduled, Cancelled).
- **Record Ledger:** Table displaying Date/Time, Patient (Name, UHID), Status, Diagnosis Preview, and Actions.

### 3. Actions
- **Pagination:** Next/Previous buttons update URL params, triggering re-fetch.
- **View Profile:** Redirects to `/doctor/consultation/[id]`.
- **Print Prescription:**
  - **UI:** "Rx" Print button.
  - **Action:** `getPrescriptionPrintData(appointmentId)` from `lib/actions/staff.ts`.
  - **Logic:** Fetches print-ready JSON, renders hidden `PrescriptionPrintTemplate`, and triggers `window.print()`.