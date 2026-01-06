# Appointment Schedule Workflow

**Path:** `/doctor/appointments`
**Component:** `app/doctor/(main)/appointments/page.tsx`

## Purpose
A daily schedule view for the doctor to visualize their appointment slots, availability, and booked patients.

## Workflow Steps

### 1. Data Loading (Client-Side)
- **Mechanism:**
  - `useEffect` (Initial): Loads the authenticated user and matches them to a doctor profile from `getBookingInitData()`.
  - `useEffect` (Date Change): Triggers `fetchAppointments` when `selectedDate` or `selectedDoctor` changes.
- **Source:**
  - `getBookingInitData()` in `lib/actions/staff.ts` (for doctor profile/schedule).
  - `getAppointmentsGrid(dateStr)` in `lib/actions/staff.ts` (for appointments).
- **Params:** `dateStr` (YYYY-MM-DD).
- **Logic:**
  - Fetches all appointments for the selected date.
  - Client-side logic `generateSlots` creates 15-minute time intervals based on the doctor's defined schedule (start/end times).
  - Matches fetched appointments to generated slots.

### 2. UI Structure
- **Control Bar:** Date Picker (Popover with Calendar) to switch days.
- **Doctor Header:** Displays Doctor Name, Specialty, and Consultation Fee.
- **Appointment Grid:**
  - **Slots:** Visual grid of 15-minute intervals.
  - **State - Available:** displayed as empty/light slots.
  - **State - Booked:** displayed as dark slots showing:
    - Time
    - Patient Name
    - Patient UHID
- **Legend:** Indicators for "Booked" vs "Available" status.

## Current Doctor Filtering Logic
To ensure a doctor only sees their own appointments on this page, the following logic is implemented:

1.  **Identity Matching:** On component mount, the app retrieves the authenticated `user.id` from Supabase. It then matches this ID against the list of doctors returned by `getBookingInitData()` to identify the specific `doctor_id`.
2.  **Clinic-Wide Fetch:** The `getAppointmentsGrid(date)` action is called, which returns all appointments for the clinic on that date.
3.  **Client-Side Filtering:** The component uses a `useMemo` hook (`doctorAppointments`) to filter the clinic-wide results. It iterates through the appointments and only includes those where `appointment.doctor_id` matches the identified `selectedDoctor.doctor_id`.
4.  **Slot Mapping:** The filtered appointments are then mapped into a lookup object where the keys are time strings (e.g., "10:15"), allowing the grid to efficiently render a patient's name only in the slots belonging to that specific doctor.

## RPC Details

### 1. `get_booking_init_data`
- **Purpose:** Fetches initial configuration data for booking, specifically the list of doctors and their metadata for the assigned clinic.
- **Input Params:**
  - `_clinic_id`: UUID
- **Returns:** JSON/Array of:
  - `id`: Doctor's Profile ID
  - `full_name`: String
  - `specialty`: String
  - `consultation_fee`: Number
  - `avg_consult_time_min`: Number
  - `is_available`: Boolean
  - `schedule`: JSONB (Array of objects with `day`, `start`, `end`)

### 2. `get_appointments_grid`
- **Purpose:** Retrieves all appointments for a specific clinic on a given date to populate the time-slot grid.
- **Input Params:**
  - `_clinic_id`: UUID
  - `_date`: DATE (YYYY-MM-DD)
- **Returns:** Array of objects:
  - `id`: Appointment UUID
  - `start_time`: TIMESTAMPTZ
  - `doctor_id`: UUID
  - `patient_name`: String
  - `patient_uhid`: String
  - `status`: String (e.g., 'scheduled', 'confirmed', 'completed', 'cancelled')
