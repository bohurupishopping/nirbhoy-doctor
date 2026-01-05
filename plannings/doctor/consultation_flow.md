# Consultation Workflow

**Path:** `/doctor/consultation/[id]`
**Component:** `app/doctor/(main)/consultation/[id]/page.tsx`

## Purpose
The comprehensive interface for conducting a patient consultation. It aggregates patient history, 360-degree view, and tools for writing prescriptions.

## Workflow Steps

### 1. Initialization
- **Input:** `appointmentId` (via URL path).
- **Data Load:** `getAppointmentForConsultation(appointmentId)` in `lib/actions/doctor.ts`.
- **Logic:**
  1.  **Appointment Details:** `rpc('get_appointment_details_by_id')`.
  2.  **Patient 360:** `rpc('get_patient_360_summary')`. Fetches rich profile, medical history, last visit, vitals trend, and documents.
  3.  **Doctor/Clinic:** Fetches details for prescription branding (Standard Supabase Selects).
  4.  **Consultation Check:** Checks/Creates `consultations` record (Standard Supabase Select/Insert).
  5.  **Medical Profile:** `rpc('get_patient_medical_profile')` (called via `getMedicalProfile` action in specific context or as part of 360 summary if integrated). *Note: `getAppointmentForConsultation` currently relies on `get_patient_360_summary` for initial data but dedicated actions exist for updates.*
- **State Management:** `useConsultationStore` (Zustand) is initialized with this data to manage the complex form state across tabs.

### 2. UI Structure
- **Header:** Patient demographics (Name, Age, Gender, UHID), flags (Critical, Wheelchair), and Safety Profile summary (Allergies/Conditions).
- **Tabs Navigation:**
  - **Summary:** Overview of patient 360.
  - **Vitals:** Input for BP, Temp, Weight, etc.
  - **History:** Timeline of previous visits and documents.
  - **Patient Profile:** Detailed demographics.
  - **Complaints:** Chief complaint input.
  - **Drug/Medicines:** Medicine search and list builder.
  - **Diagnostics:** Lab test ordering.
  - **Final Plan:** Follow-up dates and instructions.

### 3. Actions & Interactions
- **Medicine Search:** Real-time vector/text search via `searchMedicines(query)` calling `rpc('search_medicines_vector')`.
- **Add Custom Medicine:** `AddMedicineDialog` uses `createMedicine(payload)` calling `rpc('create_new_medicine')` to add new entries to the master database.
- **Preview:** `PrescriptionPreviewDialog` allows reviewing the PDF layout before submission.
- **Medical Profile:** Editable sections for allergies/conditions update via `updateMedicalProfile` calling `rpc('upsert_patient_medical_profile')`.

### 4. Submission (Finalize Consultation)
- **UI:** "Sign & Complete" button.
- **Payload:** Constructed from `useConsultationStore` state.
- **Action:** `submitPrescription(payload)` in `lib/actions/doctor.ts`.
- **RPC:** `submit_prescription_complete`.
  - Atomically saves all prescription components (Diagnosis, Meds, Labs, Vitals).
  - Updates consultation status to completed.
- **Outcome:** Redirects to Dashboard.

### 5. Data Persistence (Drafts)
- **Mechanism:** `useConsultationStore` implements explicit `localStorage` synchronization (Custom logic, not middleware).
- **Key Pattern:** `consult_draft_{consultationId}`.
- **Workflow:**
  - **Auto-Save:** Every state update (adding meds, typing notes, etc.) calls `saveToLocalStorage`, serializing the current state to JSON.
  - **Restoration:** On `initStore` (page load), the store checks for an existing draft key. If found, it hydrates the state, ensuring work is not lost on refresh or accidental navigation.
  - **Cleanup:** On successful `submitPrescription`, the `reset` action is called, which removes the specific draft key from `localStorage`.

## Key RPC Functions Used
| Action Function | RPC Name | Purpose |
| :--- | :--- | :--- |
| `getAppointmentForConsultation` | `get_appointment_details_by_id` | Fetch basic appointment info. |
| `getAppointmentForConsultation` | `get_patient_360_summary` | Fetch comprehensive patient history & profile. |
| `searchMedicines` | `search_medicines_vector` | Search medicines using vector/text search. |
| `createMedicine` | `create_new_medicine` | Insert a new medicine into the master list. |
| `submitPrescription` | `submit_prescription_complete` | Transactional commit of the entire prescription. |
| `getMedicalProfile` | `get_patient_medical_profile` | Fetch specific medical profile (allergies, etc). |
| `updateMedicalProfile` | `upsert_patient_medical_profile` | Update medical profile. |
