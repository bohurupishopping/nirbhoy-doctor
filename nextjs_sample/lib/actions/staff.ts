'use server'

import { createClient } from "@/lib/supabase/server"
import { revalidatePath } from "next/cache"

// 0. AUTH & CLINIC HELPERS
async function getAuthenticatedClinic() {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return null

    // Get clinic_id from profile
    const { data: profile } = await supabase
        .from('profiles')
        .select('clinic_id')
        .eq('id', user.id)
        .single()

    return profile?.clinic_id || null
}

// 1. PATIENT REGISTRATION
export type PatientRegistrationData = {
    full_name: string
    phone: string
    age: number
    gender: 'Male' | 'Female' | 'Transgender' | 'Other'
    address_street?: string
    district?: string
    state?: string
    pincode?: string
    religion?: string
    dob?: string
    access_flags?: {
        critical: boolean
        wheelchair: boolean
    }
}

export async function registerPatient(data: PatientRegistrationData) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()

    if (!clinicId) {
        return { error: 'Unauthorized or no clinic assigned' }
    }

    const { data: patientId, error } = await supabase.rpc('quick_register_patient', {
        _full_name: data.full_name,
        _phone: data.phone,
        _age: data.age,
        _gender: data.gender,
        _clinic_id: clinicId,
        _address_street: data.address_street || null,
        _district: data.district || null,
        _state: data.state || null,
        _pincode: data.pincode || null,
        _religion: data.religion || null,
        _dob: data.dob || null,
        _access_flags: data.access_flags || { critical: false, wheelchair: false }
    })

    if (error) {
        return { error: error.message }
    }

    return { success: true, patientId }
}

// 2. PATIENT SEARCH (Fuzzy)
export async function searchPatients(query: string) {
    if (!query || query.length < 2) return []

    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return []

    const { data, error } = await supabase.rpc('search_patients_fuzzy', {
        _query: query,
        _clinic_id: clinicId
    })

    if (error) {
        return []
    }
    return data
}

// 2b. GET ALL PATIENTS (PAGINATED & SEARCHABLE)
export async function getPatientsListV2({
    search = '',
    gender = null,
    page = 1,
    pageSize = 10
}: {
    search?: string
    gender?: 'Male' | 'Female' | 'Transgender' | 'Other' | null
    page?: number
    pageSize?: number
} = {}) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return { data: [], total: 0 }

    const { data, error } = await supabase.rpc('get_patients_v2', {
        _clinic_id: clinicId,
        _search: search,
        _gender: gender,
        _page: page,
        _page_size: pageSize
    })

    if (error) {
        return { data: [], total: 0 }
    }

    const total = data.length > 0 ? Number(data[0].total_count) : 0
    return { data, total }
}

// LEGACY: GET ALL PATIENTS
export async function getAllPatients() {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return []

    const { data, error } = await supabase
        .from('patients')
        .select('*')
        .eq('clinic_id', clinicId)
        .order('created_at', { ascending: false })

    if (error) {
        return []
    }
    return data
}

// 3. BOOK APPOINTMENT (Atomic) - Returns full JSONB result for inline payment
export async function bookAppointment(patientId: string, doctorId: string, slotTime: string, consultFee: number) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return { error: 'Unauthorized' }

    const { data, error } = await supabase.rpc('book_appointment_atomic', {
        _patient_id: patientId,
        _doctor_id: doctorId,
        _clinic_id: clinicId,
        _slot_time: slotTime,
        _consult_fee: consultFee
    })

    if (error) {
        // Handle race condition: slot already booked
        if (error.message.includes('already booked') || error.message.includes('conflict')) {
            return { error: 'Slot already booked. Please select another slot.', slotConflict: true }
        }
        return { error: error.message }
    }

    revalidatePath('/')
    // Return full booking result: { appointment_id, invoice_id, amount_due, token_number, doctor_name, etc. }
    return { success: true, booking: data }
}

// 4. QUEUE MONITOR
export async function getQueueData() {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return { scheduled: [], waiting: [], active: [] }

    const { data, error } = await supabase.rpc('get_live_queue_monitor', { _clinic_id: clinicId })
    if (error) return { scheduled: [], waiting: [], active: [] }

    return data // { scheduled: [], waiting: [...], active: [...] }
}

// 4b. DASHBOARD STATS
export async function getDashboardStats() {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return null

    const { data, error } = await supabase.rpc('get_staff_dashboard_stats', { _clinic_id: clinicId })
    if (error) {
        return null
    }

    return data
}

// 4c. UPDATE TRIAGE
export async function updateTriage(appointmentId: string, vitals: any, flags: { critical: boolean, wheelchair: boolean }) {
    const supabase = await createClient()
    const { error } = await supabase.rpc('update_queue_triage', {
        _appointment_id: appointmentId,
        _vitals: vitals,
        _critical: flags.critical,
        _wheelchair: flags.wheelchair
    })

    if (error) return { error: error.message }
    revalidatePath('/')
    return { success: true }
}

// 5. FINANCE & SETTLEMENT
export async function processPayment(invoiceId: string, amount: number, mode: string, reference: string, notes?: string) {
    const supabase = await createClient()

    // Call the new RPC: record_invoice_payment
    const { data, error } = await supabase.rpc('record_invoice_payment', {
        _invoice_id: invoiceId,
        _amount: amount,
        _mode: mode,
        _reference: reference || null,
        _notes: notes || null
    })

    if (error) return { error: error.message }

    revalidatePath('/')

    // The RPC returns: { success: true, new_paid_total, new_balance, status }
    // We still need to return this data to the frontend
    return { success: true, paymentResult: data }
}

// 6. APPOINTMENTS GRID
export async function getAppointmentsGrid(date: string) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return []

    const { data, error } = await supabase.rpc('get_appointments_grid', {
        _clinic_id: clinicId,
        _date: date
    })

    if (error) {
        return []
    }
    return data
}

// 6b. RESCHEDULE APPOINTMENT
export async function rescheduleAppointment(appointmentId: string, newTime: string, newDoctorId?: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('reschedule_appointment', {
        _appointment_id: appointmentId,
        _new_start_time: newTime,
        _new_doctor_id: newDoctorId || null
    })

    if (error) {
        return { error: error.message }
    }

    revalidatePath('/')
    revalidatePath('/appointments')
    revalidatePath(`/patient`) // Revalidate patient folder if needed

    // Return the result from the RPC: { success, message, financial_warning }
    return data as { success: boolean, message: string, financial_warning: boolean }
}

// 7. PATIENT 360
export async function getPatientAdminHistory(patientId: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_patient_admin_history', {
        _patient_id: patientId
    })

    if (error) return null
    return data
}

// 8. DOCTOR LISTING (New RPC)
export async function getDoctorsListV2(search?: string) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return []

    const { data, error } = await supabase.rpc('get_doctors_v2', {
        _clinic_id: clinicId,
        _search: search || null
    })

    if (error) {
        return []
    }

    return data
}

// 8b. GET BOOKING INIT DATA (LEGACY)
export async function getBookingInitData() {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return { doctors: [] }

    const { data, error } = await supabase.rpc('get_booking_init_data', {
        _clinic_id: clinicId
    })

    if (error) {
        return { doctors: [] }
    }

    // RPC may return { doctors: [...] } or just [...] depending on structure
    // Handle both cases
    const doctors = Array.isArray(data) ? data : (data?.doctors || [])

    // Returns: [{ id, full_name, specialty, consultation_fee, avg_consult_time_min, is_available }]
    return { doctors }
}

// 8b. LEGACY: GET DOCTORS FOR BOOKING (deprecated - use getBookingInitData)
export async function getDoctorsForBooking() {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return []

    const { data, error } = await supabase
        .from('profiles')
        .select(`
            id,
            full_name,
            doctors (
                specialty,
                fees_structure,
                avg_consult_time_min,
                is_available
            )
        `)
        .eq('clinic_id', clinicId)
        .eq('role', 'doctor')

    if (error) return []
    return data
}

// 8c. GET INVOICE PRINT DATA (for thermal receipt)
export async function getInvoicePrintData(invoiceId: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_invoice_print_data', {
        _invoice_id: invoiceId
    })

    if (error) {
        return null
    }

    // Returns: { token_number, patient_name, uhid, doctor_name, clinic_name, clinic_phone, amount, timestamp }
    return data?.[0] || data || null
}

// 8d. GET PRESCRIPTION PRINT DATA
export async function getPrescriptionPrintData(appointmentId: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_prescription_print_data', {
        _appointment_id: appointmentId
    })

    if (error) {
        return null
    }

    return data
}

// 9. PENDING PAYMENTS
export async function getPendingPayments() {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return []

    const { data, error } = await supabase
        .from('invoices')
        .select(`
            id,
            grand_total,
            payment_status,
            created_at,
            appointments (
                id,
                start_time,
                patients (
                    id,
                    full_name,
                    uhid,
                    phone
                ),
                profiles (
                   full_name
                )
            )
        `)
        .eq('payment_status', 'pending')
        .order('created_at', { ascending: false })

    if (error) {
        return []
    }
    return data
}

// 10. GET PAGINATED APPOINTMENTS
export async function getClinicAppointmentsList(page = 1, pageSize = 10, dateFilter?: string, searchText?: string) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return { data: [], total: 0 }

    const { data, error } = await supabase.rpc('get_clinic_appointments_list', {
        _clinic_id: clinicId,
        _page: page,
        _page_size: pageSize,
        _date_filter: dateFilter || null,
        _search_text: searchText || ''
    })

    if (error) {
        return { data: [], total: 0 }
    }

    // The RPC returns { ..., total_count } in each row. We pick it from the first row.
    const total = data.length > 0 ? Number(data[0].total_count) : 0
    return { data, total }
}

// 11. GET DETAILS
export async function getAppointmentDetailsById(appointmentId: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_appointment_details_by_id', {
        _appointment_id: appointmentId
    })

    if (error) return null
    return data
}

// 12. UPDATE STATUS
export async function updateAppointmentStatus(appointmentId: string, status: string, reason?: string) {
    const supabase = await createClient()
    const { error } = await supabase.rpc('update_appointment_status', {
        _appointment_id: appointmentId,
        _new_status: status,
        _cancellation_reason: reason || null
    })

    if (error) return { error: error.message }
    revalidatePath('/')
    revalidatePath('/staff/booking')
    return { success: true }
}

// 13. UPDATE PATIENT DEMOGRAPHICS
export async function updatePatientDemographics(patientId: string, data: any) {
    const supabase = await createClient()

    // access_flags merging is handled in RPC, but we need to pass individual params or handle structure
    // The RPC signature:
    // _patient_id, _full_name, _phone, _age, _gender, _address, _district, _pincode, _is_wheelchair, _is_critical

    const { error } = await supabase.rpc('update_patient_demographics', {
        _patient_id: patientId,
        _full_name: data.full_name,
        _phone: data.phone,
        _age: data.age,
        _gender: data.gender,
        _address: data.address_street || data.address, // Handle both naming conventions
        _district: data.district,
        _pincode: data.pincode,
        _is_wheelchair: data.access_flags?.wheelchair,
        _is_critical: data.access_flags?.critical
    })

    if (error) {
        return { error: error.message }
    }

    revalidatePath(`/staff/patient/${patientId}`)
    return { success: true }
}

// 14. GET APPOINTMENT CLINICAL DETAILS
export async function getAppointmentClinicalDetails(appointmentId: string) {
    const supabase = await createClient()

    const { data, error } = await supabase.rpc('get_appointment_clinical_details', {
        _appointment_id: appointmentId
    })

    if (error) {
        return null
    }

    return data
}

// 15. FINANCE TRANSACTIONS
export interface FinanceTransactionsResult {
    stats: {
        total_billed: number
        total_collected: number
        total_pending: number
        total_refunded: number
        txn_count: number
    }
    transactions: Array<{
        invoice_id: string
        invoice_number: string
        created_at: string
        amount: number
        status: 'paid' | 'pending' | 'refunded'
        mode: string | null
        patient: {
            name: string
            phone: string
            uhid: string
        }
        doctor_name: string
    }>
    meta: {
        total_records: number
        current_page: number
        page_size: number
        total_pages: number
    }
}

export async function getFinanceTransactions({
    startDate,
    endDate,
    statusFilter = null,
    searchText = '',
    page = 1,
    pageSize = 10
}: {
    startDate: string
    endDate: string
    statusFilter?: 'paid' | 'pending' | 'refunded' | null
    searchText?: string
    page?: number
    pageSize?: number
}): Promise<FinanceTransactionsResult | null> {
    const supabase = await createClient()

    const { data, error } = await supabase.rpc('get_finance_transactions', {
        _start_date: startDate,
        _end_date: endDate,
        _status_filter: statusFilter,
        _search_text: searchText,
        _page: page,
        _page_size: pageSize
    })

    if (error) {
        return null
    }

    return data as FinanceTransactionsResult
}

// 16. PATIENT FOLLOW-UPS
export interface FollowupResult {
    patient_id: string
    patient_name: string
    phone: string
    uhid: string
    address: string
    last_visit_date: string
    next_visit_due_date: string
    next_visit_notes: string
    doctor_name: string
    is_already_booked: boolean
    total_count: number
}

export async function getPatientFollowups({
    startDate,
    endDate,
    page = 1,
    pageSize = 20
}: {
    startDate: string
    endDate: string
    page?: number
    pageSize?: number
}) {
    const supabase = await createClient()
    const clinicId = await getAuthenticatedClinic()
    if (!clinicId) return { data: [], total: 0 }

    const { data, error } = await supabase.rpc('get_patient_followups', {
        _clinic_id: clinicId,
        _start_date: startDate,
        _end_date: endDate,
        _page: page,
        _page_size: pageSize
    })

    if (error) {
        console.error('Error fetching follow-ups:', error)
        return { data: [], total: 0 }
    }

    const total = data.length > 0 ? Number(data[0].total_count) : 0
    return { data: data as FollowupResult[], total }
}
