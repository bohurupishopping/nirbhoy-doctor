'use server'

import { createClient } from "@/lib/supabase/server"
import { createAdminClient } from "@/lib/supabase/admin"
import { revalidatePath } from "next/cache"
import { PutObjectCommand } from "@aws-sdk/client-s3"
import { getSignedUrl } from "@aws-sdk/s3-request-presigner"
import { r2, R2_BUCKET_NAME, R2_PUBLIC_DOMAIN } from "@/lib/r2"
import { v4 as uuidv4 } from 'uuid'

export type UserProfile = {
    id: string
    full_name: string
    email: string | null
    phone: string | null
    role: 'admin' | 'staff' | 'doctor' | 'user'
    is_active: boolean
    avatar_url: string | null
    created_at: string
}

export async function getUsers(): Promise<UserProfile[]> {
    const supabase = await createClient()

    // Security Check: Only Admin
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return []

    // Ensure requester is admin
    const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (profile?.role !== 'admin') {
        // Return empty or throw error
        return []
    }

    const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .order('created_at', { ascending: false })

    if (error) {
        return []
    }

    return data as UserProfile[]
}

export async function toggleUserAccess(userId: string, currentStatus: boolean) {
    const supabase = await createClient()

    // Security Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: 'Unauthorized' }

    // Check if admin
    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return { error: 'Unauthorized' }

    const { error } = await supabase.from('profiles').update({ is_active: !currentStatus }).eq('id', userId)

    if (error) return { error: error.message }

    revalidatePath('/(admin)/profile/users', "page")
    // Note: path might need to be specific to the route segment
    revalidatePath('/profile/users')

    return { success: true }
}

export async function updateUserRole(userId: string, newRole: 'admin' | 'staff' | 'doctor' | 'user') {
    const supabase = await createClient()

    // Security Check (Admin only)
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: 'Unauthorized' }
    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return { error: 'Unauthorized' }

    const { error } = await supabase.from('profiles').update({ role: newRole }).eq('id', userId)

    if (error) return { error: error.message }

    revalidatePath('/profile/users')
    return { success: true }
}

export async function updateUserProfile(userId: string, data: { full_name?: string, phone?: string, avatar_url?: string | null }) {
    const supabase = await createClient()

    // Security Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: 'Unauthorized' }

    // Check if requester is admin
    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return { error: 'Unauthorized' }

    const { error } = await supabase
        .from('profiles')
        .update(data)
        .eq('id', userId)

    if (error) return { error: error.message }

    // Revalidate paths
    revalidatePath('/profile/users')
    revalidatePath('/(admin)/profile/users')

    return { success: true }
}

export async function getAvatarUploadUrl(userId: string, fileName: string, fileType: string) {
    const supabase = await createClient()

    // Security Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: 'Unauthorized' }

    // Admin only
    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return { error: 'Unauthorized' }

    const cleanFileName = fileName.replace(/[^a-zA-Z0-9.-]/g, '_')
    const fileKey = `avatars/${userId}/${uuidv4()}-${cleanFileName}`

    const command = new PutObjectCommand({
        Bucket: R2_BUCKET_NAME,
        Key: fileKey,
        ContentType: fileType,
    })

    try {
        const signedUrl = await getSignedUrl(r2, command, { expiresIn: 3600 })
        const publicUrl = R2_PUBLIC_DOMAIN
            ? `${R2_PUBLIC_DOMAIN}/${fileKey}`
            : signedUrl.split('?')[0]
        return { success: true, url: signedUrl, publicUrl, fileKey }
    } catch (error: any) {
        console.error("Error generating upload URL:", error)
        return { error: error.message }
    }
}

export async function getClinicUploadUrl(fileName: string, fileType: string) {
    const supabase = await createClient()

    // Security Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: 'Unauthorized' }

    // Admin only
    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return { error: 'Unauthorized' }

    const cleanFileName = fileName.replace(/[^a-zA-Z0-9.-]/g, '_')
    const fileKey = `clinics/${uuidv4()}/${cleanFileName}`

    const command = new PutObjectCommand({
        Bucket: R2_BUCKET_NAME,
        Key: fileKey,
        ContentType: fileType,
    })

    try {
        const signedUrl = await getSignedUrl(r2, command, { expiresIn: 3600 })
        const publicUrl = R2_PUBLIC_DOMAIN
            ? `${R2_PUBLIC_DOMAIN}/${fileKey}`
            : signedUrl.split('?')[0]
        return { success: true, url: signedUrl, publicUrl, fileKey }
    } catch (error: any) {
        console.error("Error generating upload URL:", error)
        return { error: error.message }
    }
}

// DOCTOR CONFIGURATION ACTIONS

export type DoctorProfileExtended = {
    profile_id: string
    full_name: string
    email: string | null
    specialty: string
    qualifications: string
    registration_number: string
    current_hospital_attachment: string | null
    digital_signature_url: string | null
    fees_structure: any
    avg_consult_time_min: number
    is_available: boolean
    schedules: any[]
    avatar_url: string | null
}

export async function getDoctorDetails(id: string): Promise<DoctorProfileExtended | null> {
    const supabase = await createClient()

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return null

    // Fetch Profile + Doctor Data + Schedule
    const { data: profile, error: pError } = await supabase
        .from('profiles')
        .select('full_name, email, avatar_url')
        .eq('id', id)
        .single()

    if (pError || !profile) return null

    const { data: doctor, error: dError } = await supabase
        .from('doctors')
        .select('*')
        .eq('profile_id', id)
        .single()

    // If no doctor entry yet (just promoted), return partial
    if (dError) {
        return {
            profile_id: id,
            full_name: profile.full_name,
            email: profile.email,
            specialty: '',
            qualifications: '',
            registration_number: '',
            current_hospital_attachment: null,
            digital_signature_url: null,
            fees_structure: {},
            avg_consult_time_min: 15,
            is_available: true,
            schedules: [],
            avatar_url: profile.avatar_url
        }
    }

    const { data: schedules } = await supabase
        .from('doctor_schedules')
        .select('*')
        .eq('doctor_id', id)

    return {
        ...doctor,
        full_name: profile.full_name,
        email: profile.email,
        schedules: schedules || [],
        avatar_url: profile.avatar_url
    }
}

export async function updateDoctorProfile(id: string, data: Partial<DoctorProfileExtended>) {
    const supabase = await createClient()

    // 1. Update Profile (Name)
    if (data.full_name) {
        await supabase.from('profiles').update({ full_name: data.full_name }).eq('id', id)
    }

    // 2. Upsert Doctor Entry
    const { error } = await supabase.from('doctors').upsert({
        profile_id: id,
        specialty: data.specialty,
        qualifications: data.qualifications,
        registration_number: data.registration_number,
        current_hospital_attachment: data.current_hospital_attachment,
        digital_signature_url: data.digital_signature_url,
        avg_consult_time_min: data.avg_consult_time_min,
        is_available: data.is_available ?? true
    })

    if (error) return { error: error.message }
    revalidatePath(`/admin/profile/doctors/${id}`)
    return { success: true }
}

export async function updateDoctorFees(id: string, fees: any) {
    const supabase = await createClient()
    const { error } = await supabase.from('doctors').update({ fees_structure: fees }).eq('profile_id', id)
    if (error) return { error: error.message }
    revalidatePath(`/admin/profile/doctors/${id}`)
    return { success: true }
}

export async function updateDoctorRoster(id: string, schedules: any[]) {
    const supabase = await createClient()

    // 1. Delete existing schedules
    const { error: deleteError } = await supabase
        .from('doctor_schedules')
        .delete()
        .eq('doctor_id', id)

    if (deleteError) return { error: deleteError.message }

    // 2. Insert new schedules
    if (schedules.length > 0) {
        const { error: insertError } = await supabase
            .from('doctor_schedules')
            .insert(schedules.map(s => ({
                doctor_id: id,
                day_of_week: s.day_of_week ?? s.day, // Handle both field names for compatibility
                start_time: s.start_time,
                end_time: s.end_time
            })))

        if (insertError) return { error: insertError.message }
    }

    revalidatePath(`/admin/profile/doctors/${id}`)
    return { success: true }
}

export async function getAdminDoctorsList(): Promise<(UserProfile & { is_available: boolean })[]> {
    const supabase = await createClient()

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return []

    // Ensure requester is admin
    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return []

    // Use Admin Client to bypass RLS for reliable fetching
    const adminClient = createAdminClient()

    // Fetch doctors joined with profiles
    const { data, error } = await adminClient
        .from('profiles')
        .select('*, doctors(is_available)')
        .eq('role', 'doctor')
        .order('created_at', { ascending: false })

    if (error) return []

    return data.map((d: any) => {
        const doctorData = Array.isArray(d.doctors) ? d.doctors[0] : d.doctors
        return {
            ...d,
            is_available: doctorData?.is_available ?? true // Default true if no doctor record yet
        }
    })
}

export async function toggleDoctorAvailability(doctorId: string, isAvailable: boolean) {
    const supabase = await createClient()

    // Auth Check (Security)
    const { data: { user } = { user: null } } = await supabase.auth.getUser()
    if (!user) return { error: "Unauthorized" }

    const { data: requester } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (requester?.role !== 'admin') return { error: "Unauthorized" }

    // Use Admin Client for data mutation
    const adminClient = createAdminClient()

    // 1. Check if doctor record exists
    const { data: existing } = await adminClient.from('doctors').select('profile_id').eq('profile_id', doctorId).single()

    let error;
    if (!existing) {
        // Create if missing
        const { error: insertError } = await adminClient.from('doctors').insert({
            profile_id: doctorId,
            is_available: isAvailable
        })
        error = insertError
    } else {
        // Update
        const { error: updateError } = await adminClient.from('doctors').update({ is_available: isAvailable }).eq('profile_id', doctorId)
        error = updateError
    }

    if (error) return { error: error.message }

    // revalidatePath might not work perfectly with CSR page but good practice
    revalidatePath('/admin/profile/doctors')
    return { success: true }
}

// DASHBOARD ACTIONS
export async function getAdminDashboardStats() {
    const supabase = await createClient()

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return null

    // Get Clinic ID (For MVP just pick first one)
    const { data: clinic } = await supabase.from('clinics').select('id').limit(1).single()
    if (!clinic) return {
        revenue_today: 0,
        revenue_month: 0,
        doctors_active: 0,
        patients_today: 0,
        pending_queue: 0
    }

    const { data, error } = await supabase.rpc('get_admin_dashboard_stats', { _clinic_id: clinic.id })

    if (error) {
        // console.error("Dashboard Stats Error", error)
        // Fail gracefully
        return {
            revenue_today: 0,
            revenue_month: 0,
            doctors_active: 0,
            patients_today: 0,
            pending_queue: 0
        }
    }

    return data
}

// ---------------------------------------------------------
// NEW ACTIONS FOR REMAINING MODULES
// ---------------------------------------------------------

// 1. CLINIC CONFIGURATION
export async function updateClinicSettings(settings: any) {
    const supabase = await createClient()

    // Get Clinic ID
    const { data: clinic } = await supabase.from('clinics').select('id').limit(1).single()
    if (!clinic) return { error: "No clinic found" }

    const { error } = await supabase.rpc('update_clinic_master_settings', {
        _clinic_id: clinic.id,
        _settings: settings
    })

    if (error) return { error: error.message }
    return { success: true }
}

export async function getClinicSettings() {
    const supabase = await createClient()
    const { data: clinic } = await supabase.from('clinics').select('settings').limit(1).single()
    return clinic?.settings || {}
}

// 2. INVENTORY (MEDICINE UPLOAD)
export async function bulkUploadMedicines(csvData: any[]) {
    const supabase = await createClient()
    // Transform CSV data if needed to match JSON expected by RPC
    // RPC expects: [{name, type, price, manufacturer}]
    const { error } = await supabase.rpc('bulk_upload_medicines', { _meds: csvData })

    if (error) return { error: error.message }
    return { success: true }
}

// 3. FINANCIAL REPORTS
export async function getFinancialReport(startDate: string, endDate: string) {
    const supabase = await createClient()

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return null
    const { data: profile } = await supabase.from('profiles').select('role, clinic_id').eq('id', user.id).single()
    if (profile?.role !== 'admin') return null

    // For now, use the profile's clinic_id or default to the first clinic
    const clinicId = profile.clinic_id || (await supabase.from('clinics').select('id').limit(1).single()).data?.id

    if (!clinicId) return {
        total_revenue: 0,
        tax_collected: 0,
        breakdown: {}
    }

    const { data, error } = await supabase.rpc('get_financial_report', {
        _start_date: startDate,
        _end_date: endDate,
        _clinic_id: clinicId
    })

    if (error) return { error: error.message }
    return data
}

export async function getAdvancedFinancials({
    startDate,
    endDate,
    clinicId: requestedClinicId,
    doctorId,
    statusFilter = 'all',
    searchText = '',
    page = 1,
    pageSize = 10
}: {
    startDate: string
    endDate: string
    clinicId?: string
    doctorId?: string
    statusFilter?: string
    searchText?: string
    page?: number
    pageSize?: number
}) {
    const supabase = await createClient()

    // 1. Auth & Authorization
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return null

    const { data: profile } = await supabase
        .from('profiles')
        .select('role, clinic_id')
        .eq('id', user.id)
        .single()

    if (profile?.role !== 'admin') return null

    // Determine target clinic
    // If global admin (clinic_id null), use requestedClinicId or default to first
    const clinicId = profile.clinic_id || requestedClinicId || (await supabase.from('clinics').select('id').limit(1).single()).data?.id

    // 2. Execute High-Efficiency RPC
    const { data, error } = await supabase.rpc('get_admin_finance_advanced', {
        _start_date: startDate,
        _end_date: endDate,
        _clinic_id: clinicId,
        _doctor_id: doctorId,
        _status_filter: statusFilter,
        _search_text: searchText,
        _page: page,
        _page_size: pageSize
    })

    if (error) {
        console.error('Advanced Finance RPC Error:', error)
        throw new Error(error.message)
    }

    return data
}

// ---------------------------------------------------------
// REAL DATA FETCHERS (NEW)
// ---------------------------------------------------------

// 1. CLINICS
export async function getClinics() {
    const supabase = await createClient()

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return []

    // Fetch clinics
    const { data, error } = await supabase
        .from('clinics')
        .select('*')
        .order('created_at', { ascending: true })

    if (error) {
        return []
    }
    return data
}

// 2. MEDICINES
export async function getMedicines({
    page = 1,
    limit = 50,
    search = '',
    typeFilter = 'all',
    showDiscontinued = false
}: {
    page?: number
    limit?: number
    search?: string
    typeFilter?: string
    showDiscontinued?: boolean
}) {
    const supabase = await createClient()

    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { data: [], total: 0, meta: null }

    const { data, error } = await supabase.rpc('get_admin_medicines_paginated', {
        _page: page,
        _page_size: limit,
        _search: search,
        _type_filter: typeFilter,
        _show_discontinued: showDiscontinued
    })

    if (error) {
        console.error('getMedicines Error:', error)
        return { data: [], total: 0, meta: null }
    }

    return {
        data: data.data || [],
        total: data.meta.total_records || 0,
        meta: data.meta
    }
}

export async function getMedicineTypes() {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_medicine_types')
    if (error) return []
    return data as string[]
}

export async function createMedicine(payload: any) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    // Admin check logic similar to other functions can be added here if not strictly handled by RLS/RPC
    if (!user) return { error: "Unauthorized" }

    const { data, error } = await supabase.rpc("create_new_medicine", {
        _name: payload.name,
        _manufacturer_name: payload.manufacturer,
        _salt_composition: payload.generic,
        _short_composition1: payload.composition_short_1,
        _short_composition2: payload.composition_short_2,
        _pack_size_label: payload.pack_size,
        _price: payload.price,
        _type: payload.type,
        _medicine_desc: payload.description,
        _side_effects: payload.side_effects
    })

    if (error) return { error: error.message }

    revalidatePath('/admin/inventory/medicines')
    return { success: true, id: data }
}

export async function getInventoryStats() {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_inventory_stats')
    if (error) return null
    return data
}

// 3. SERVICES
export interface Service {
    id: string
    clinic_id: string | null
    name: string
    default_price: number
    tax_rate: number
    is_active: boolean
}

export async function getServices(): Promise<Service[]> {
    const supabase = await createClient()
    const { data, error } = await supabase.from('service_master').select('*').order('name')
    if (error) return []
    return data as Service[]
}

export async function getServiceById(id: string): Promise<Service | null> {
    const supabase = await createClient()
    const { data, error } = await supabase.from('service_master').select('*').eq('id', id).single()
    if (error) return null
    return data as Service
}

export async function createService(data: Omit<Service, 'id' | 'clinic_id'>) {
    const supabase = await createClient()

    // Get First Clinic ID for now (MVP behavior)
    const { data: clinic } = await supabase.from('clinics').select('id').limit(1).single()
    if (!clinic) return { error: "No clinic found to associate service with." }

    const { data: newService, error } = await supabase
        .from('service_master')
        .insert({
            ...data,
            clinic_id: clinic.id,
            is_active: true
        })
        .select()
        .single()

    if (error) return { error: error.message }
    revalidatePath('/admin/inventory/services')
    return { success: true, data: newService }
}

export async function updateService(id: string, data: Partial<Service>) {
    const supabase = await createClient()
    const { error } = await supabase
        .from('service_master')
        .update(data)
        .eq('id', id)

    if (error) return { error: error.message }
    revalidatePath('/admin/inventory/services')
    return { success: true }
}

export async function deleteService(id: string) {
    const supabase = await createClient()
    // Soft delete by deactivating
    const { error } = await supabase
        .from('service_master')
        .update({ is_active: false })
        .eq('id', id)

    if (error) return { error: error.message }
    revalidatePath('/admin/inventory/services')
    return { success: true }
}

// 4. PATIENTS (Global Search)
export async function searchPatientDirectory(query: string) {
    if (!query) return []

    const supabase = await createClient()

    // Use the RPC defined in schema
    const { data, error } = await supabase.rpc('search_patients_fuzzy', { _query: query })

    if (error) {
        return []
    }
    return data
}

// 5. ONBOARDING (WIZARD)
// 5. ONBOARDING (WIZARD)
export async function onboardClinic(formData: any) {
    const supabase = await createClient()

    const { data: clinicId, error } = await supabase.rpc('onboard_new_clinic', {
        _name: formData.name,
        _city: formData.city,
        _address_1: formData.address_line_1,
        _address_2: formData.address_line_2,
        _state: formData.state,
        _pincode: formData.pincode,
        _phone_primary: formData.phone_primary,
        _phone_secondary: formData.phone_secondary,
        _email_contact: formData.email_contact,
        _website_url: formData.website_url,
        _admin_email: formData.admin_email,
        _admin_name: formData.admin_name,
        _admin_uid: formData.admin_uid,
        _logo_url: formData.logo_url,
        _header_image_url: formData.header_image_url,
        _footer_text: formData.footer_text,
        _sms_enabled: formData.sms_enabled
    })

    if (error) {
        return { error: error.message }
    }

    revalidatePath('/admin/clinics')
    // Also revalidate the specific clinic page just in case
    // revalidatePath(`/admin/clinics/${clinicId}`) // clinicId is returned
    return { success: true, clinicId }
}

// 6. OBSERVE (AUDIT LOGS)
export async function getAuditLogs({
    page = 1,
    pageSize = 20,
    actionFilter = null,
    startDate = null,
    endDate = null,
    searchText = ''
}: {
    page?: number
    pageSize?: number
    actionFilter?: string | null
    startDate?: string | null
    endDate?: string | null
    searchText?: string
} = {}) {
    const supabase = await createClient()

    let query = supabase
        .from('audit_logs')
        .select(`
            *,
            profiles:user_id (full_name, role)
        `, { count: 'exact' })

    // Filtering
    if (actionFilter && actionFilter !== 'all') {
        // action matches TG_TABLE_NAME || '_' || TG_OP (e.g. patients_INSERT)
        // We can search for the operation suffix
        if (actionFilter === 'INSERT') query = query.ilike('action', '%_INSERT')
        if (actionFilter === 'UPDATE') query = query.ilike('action', '%_UPDATE')
        if (actionFilter === 'DELETE') query = query.ilike('action', '%_DELETE')
    }

    if (startDate) {
        query = query.gte('created_at', startDate)
    }
    if (endDate) {
        // Set end date to end of day if it's just a date string
        const end = endDate.includes('T') ? endDate : `${endDate}T23:59:59`
        query = query.lte('created_at', end)
    }

    if (searchText) {
        // Search in action or resource_id
        query = query.or(`action.ilike.%${searchText}%,resource_id.eq.${searchText}`)
    }

    const from = (page - 1) * pageSize
    const to = from + pageSize - 1

    const { data, count, error } = await query
        .order('created_at', { ascending: false })
        .range(from, to)

    if (error) {
        console.error('Audit Log Fetch Error:', error)
        return { data: [], meta: { total_records: 0, current_page: page, page_size: pageSize, total_pages: 0 } }
    }

    const totalRecords = count || 0
    const totalPages = Math.ceil(totalRecords / pageSize)

    return {
        data: data || [],
        meta: {
            total_records: totalRecords,
            current_page: page,
            page_size: pageSize,
            total_pages: totalPages
        }
    }
}

// 7. EDIT CLINIC
export async function getClinicById(id: string) {
    const supabase = await createClient()

    // Fetch clinic + Consultation Fee (via service_master)
    const { data: clinic, error } = await supabase.from('clinics').select('*').eq('id', id).single()

    if (error) return null

    // Fetch fee separately
    return {
        ...clinic,
        sms_enabled: clinic.settings?.sms_enabled ?? true
    }
}

export async function updateClinic(id: string, formData: any) {
    const supabase = await createClient()

    // Security Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: "Unauthorized" }

    // Validate Admin Role
    const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (profile?.role !== 'admin') return { error: "Unauthorized" }

    // Prepare Settings
    const { data: existing } = await supabase.from('clinics').select('settings').eq('id', id).single()
    const currentSettings = existing?.settings || { currency: 'INR', tax_rate: 0 }

    const newSettings = {
        ...currentSettings,
        sms_enabled: formData.sms_enabled
    }

    const { error: clinicError } = await supabase.from('clinics').update({
        name: formData.name,
        city: formData.city,
        address_line_1: formData.address_line_1,
        address_line_2: formData.address_line_2,
        state: formData.state,
        pincode: formData.pincode,
        phone_primary: formData.phone_primary,
        phone_secondary: formData.phone_secondary,
        email_contact: formData.email_contact,
        website_url: formData.website_url,
        logo_url: formData.logo_url,
        header_image_url: formData.header_image_url,
        footer_text: formData.footer_text,
        settings: newSettings
    }).eq('id', id)

    if (clinicError) {
        return { error: clinicError.message }
    }



    revalidatePath('/clinics')
    revalidatePath(`/clinics/${id}`)
    return { success: true }
}

// 8. PATIENT MANAGEMENT (SYNCED FROM STAFF)

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

    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { data: [], total: 0 }

    const { data: profile } = await supabase.from('profiles').select('role, clinic_id').eq('id', user.id).single()
    if (profile?.role !== 'admin') return { data: [], total: 0 }

    // If we want a truly global Master Patient Index for Admins:
    // We attempt to use the RPC with _clinic_id as NULL.
    // If the RPC hasn't been updated to support NULL, it might return 0 results or error.

    const { data, error } = await supabase.rpc('get_patients_v2', {
        _clinic_id: profile.clinic_id, // If null, the RPC (updated version) handles it as global
        _search: search,
        _gender: gender,
        _page: page,
        _page_size: pageSize
    })

    if (error || (data && data.length === 0 && !search)) {
        // Fallback to direct query if RPC fails or returns nothing (when not searching)
        // This ensures the Master Patient Index is truly global if the RPC is restrictive
        let query = supabase.from('patients').select('id, full_name, phone, uhid, gender, age, created_at', { count: 'exact' })

        if (search) {
            query = query.or(`full_name.ilike.%${search}%,phone.ilike.%${search}%,uhid.ilike.%${search}%`)
        }

        if (gender) {
            query = query.eq('gender', gender)
        }

        const from = (page - 1) * pageSize
        const to = from + pageSize - 1

        const { data: directData, count, error: directError } = await query
            .order('created_at', { ascending: false })
            .range(from, to)

        if (directError) {
            return { data: [], total: 0 }
        }

        return {
            data: directData.map(p => ({ ...p, total_count: count })),
            total: count || 0
        }
    }

    const total = data.length > 0 ? Number(data[0].total_count) : 0
    return { data, total }
}

export async function getPatientAdminHistory(patientId: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_patient_admin_history', {
        _patient_id: patientId
    })

    if (error) {
        return null
    }
    return data
}

export async function updatePatientDemographics(patientId: string, data: any) {
    const supabase = await createClient()

    const { error } = await supabase.rpc('update_patient_demographics', {
        _patient_id: patientId,
        _full_name: data.full_name,
        _phone: data.phone,
        _age: data.age,
        _gender: data.gender,
        _address: data.address_street || data.address,
        _district: data.district,
        _pincode: data.pincode,
        _is_wheelchair: data.access_flags?.wheelchair,
        _is_critical: data.access_flags?.critical
    })

    if (error) {
        return { error: error.message }
    }

    revalidatePath(`/admin/operations/patients/${patientId}`)
    return { success: true }
}

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

export async function getInvoicePrintData(invoiceId: string) {
    const supabase = await createClient()
    const { data, error } = await supabase.rpc('get_invoice_print_data', {
        _invoice_id: invoiceId
    })

    if (error) {
        return null
    }

    return data?.[0] || data || null
}

// --- MISSING FUNCTIONS PORTED FROM STAFF ---

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
    return data as { success: boolean, message: string, financial_warning: boolean }
}
