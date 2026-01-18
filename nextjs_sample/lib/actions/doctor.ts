"use server";

import { createClient } from "@/lib/supabase/server";
import { format } from "date-fns";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";

export interface DoctorDashboardMetrics {
    waiting_count: number;
    completed_today: number;
    avg_consult_time_mins: number;
    avg_wait_time_mins: number;
}

export interface ActiveQueueItem {
    token_number: number;
    patient_name: string;
    age: number;
    gender: string;
    uhid: string;
    appointment_id: string;
    queue_status: string; // 'waiting', 'called', 'in_consult'
    payment_status: string;
    amount_due: number;
    access_flags: any;
    checked_in_at: string;
    wait_time_mins?: number;
}

export type DoctorDashboardData = {
    metrics: DoctorDashboardMetrics;
    activeQueue: ActiveQueueItem[];
    doctorName: string;
    todayDate: string;
    currentSession: ActiveQueueItem | null;
}

export async function getDoctorDashboardData(): Promise<DoctorDashboardData | { error: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        return { error: "Unauthorized" };
    }

    // Get basic profile to show name
    const { data: profile } = await supabase
        .from("profiles")
        .select("full_name")
        .eq("id", user.id)
        .single();

    if (!profile) {
        return { error: "Profile not found" };
    }

    try {
        // Fetch Metrics
        const { data: metricsData, error: metricsError } = await supabase
            .rpc("get_doctor_dashboard_metrics", { _doctor_id: user.id });

        if (metricsError) throw metricsError;

        // Fetch Active Queue
        const { data: queueData, error: queueError } = await supabase
            .rpc("get_doctor_active_queue", { _doctor_id: user.id });

        if (queueError) throw queueError;

        // Current Session: Either 'called' or 'in_consult' status
        const currentSession = queueData ? queueData.find((item: ActiveQueueItem) =>
            item.queue_status === 'called' || item.queue_status === 'in_consult'
        ) : null;

        // Waiting Queue: Only those with 'waiting' status
        const waitingQueue = queueData ? queueData.filter((item: ActiveQueueItem) =>
            item.queue_status === 'waiting'
        ) : [];

        // Map metrics
        const metrics = metricsData && metricsData.length > 0 ? metricsData[0] : {
            waiting_count: 0,
            completed_today: 0,
            avg_consult_time_mins: 0,
            avg_wait_time_mins: 0
        };

        return {
            metrics: {
                waiting_count: Number(metrics.waiting_count),
                completed_today: Number(metrics.completed_today),
                avg_consult_time_mins: Number(metrics.avg_consult_time_mins),
                avg_wait_time_mins: Number(metrics.avg_wait_time_mins)
            },
            activeQueue: waitingQueue,
            currentSession: currentSession || null,
            doctorName: profile.full_name,
            todayDate: format(new Date(), "EEEE, d MMMM yyyy")
        };

    } catch (e: any) {
        return { error: e.message };
    }
}

export async function callPatient(appointmentId: string) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { error: "Unauthorized" };

    try {
        const { error } = await supabase.rpc("doctor_call_patient", {
            _appointment_id: appointmentId,
            _doctor_id: user.id
        });

        if (error) throw error;

        revalidatePath("/doctor");
        return { success: true };
    } catch (e: any) {
        return { error: e.message };
    }
}

// --- Analytics Actions ---

export interface DoctorAnalyticsData {
    patients_seen_today: number;
    avg_consult_time_min: number;
}

export async function getDoctorAnalytics(): Promise<DoctorAnalyticsData | { error: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { error: "Unauthorized" };

    try {
        const { data, error } = await supabase
            .rpc("get_doctor_analytics", { _doctor_id: user.id });

        if (error) throw error;

        // RPC returns a single JSON object directly
        return {
            patients_seen_today: Number(data.patients_seen_today || 0),
            avg_consult_time_min: Number(data.avg_consult_time_min || 0)
        };
    } catch (e: any) {
        return { error: e.message };
    }
}

// --- Protocol Actions ---

export interface Protocol {
    id: string;
    name: string;
    drugs: any[];
    labs: any[];
    advice?: string;
}

export async function getDoctorProtocols(): Promise<Protocol[] | { error: string }> {
    // UPDATED: Use correct column names from schema_clean.sql and remove created_at sort
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { error: "Unauthorized" };

    try {
        const { data, error } = await supabase
            .from("doctor_protocols")
            .select(`
                id,
                protocol_name,
                drugs_template,
                labs_template,
                advice_template
            `)
            .eq("doctor_id", user.id);
        // .order("created_at"); // Removed as column doesn't exist

        if (error) throw error;

        return data.map((item: any) => ({
            id: item.id,
            name: item.protocol_name,
            drugs: item.drugs_template || [],
            labs: item.labs_template || [],
            advice: item.advice_template
        })) as Protocol[];
    } catch (e: any) {
        return { error: e.message };
    }
}

export async function saveDoctorProtocol(name: string, drugs: any[], labs: any[], id?: string): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { success: false, error: "Unauthorized" };

    // Map to DB columns
    const payload = {
        protocol_name: name,
        drugs_template: drugs,
        labs_template: labs
    };

    try {
        if (id) {
            // Update
            const { error } = await supabase
                .from("doctor_protocols")
                .update(payload)
                .eq("id", id)
                .eq("doctor_id", user.id);
            if (error) throw error;
        } else {
            // Create
            const { error } = await supabase
                .from("doctor_protocols")
                .insert({
                    doctor_id: user.id,
                    ...payload
                });
            if (error) throw error;
        }

        revalidatePath("/my-protocols");
        return { success: true };
    } catch (e: any) {
        return { success: false, error: e.message };
    }
}

export async function deleteDoctorProtocol(id: string): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { success: false, error: "Unauthorized" };

    try {
        const { error } = await supabase
            .from("doctor_protocols")
            .delete()
            .eq("id", id)
            .eq("doctor_id", user.id);

        if (error) throw error;

        revalidatePath("/my-protocols");
        return { success: true };
    } catch (e: any) {
        return { success: false, error: e.message };
    }
}

// --- Consultation Actions ---

export interface AppointmentDetails {
    id: string;
    patient_id: string;
    doctor_id: string;
    patient_name: string;
    patient_phone: string;
    patient_uhid: string;
    start_time: string;
    status: string;
}

export interface Patient360Data {
    profile: {
        id: string;
        full_name: string;
        age: number;
        gender: string;
        uhid: string;
    } | null;
    medical_history: {
        allergies: string[];
        chronic_conditions: string[];
    } | null;
    last_visit: {
        date: string;
        diagnosis: any[];
    } | null;
    vitals_history: any[] | null;
}

export interface ConsultationContext {
    appointmentId: string;
    appointmentNumber: string;
    consultationId: string;
    patient: {
        id: string;
        name: string;
        age: number;
        gender: string;
        uhid: string;
        phone?: string;
        address?: string;
        district?: string;
        pincode?: string;
        religion?: string;
        access_flags?: {
            critical: boolean;
            wheelchair: boolean;
        };
    };
    safetyProfile: {
        allergies: string[];
        chronic_conditions: string[];
        family_history: string[];
        lifestyle: Record<string, any>;
    };
    visitHistory: Array<{
        date: string;
        doctor_name?: string;
        specialty?: string;
        diagnosis: any[];
        symptoms?: any;
        notes?: string;
        vitals?: any;
        advice?: {
            next_visit_date?: string;
            next_visit_text?: string;
        };
        prescriptions?: Array<{
            brand_name: string;
            generic_name: string;
            dosage: string;
            duration: string;
            instruction: string;
            type: string;
            note?: string;
        }>;
        lab_orders?: Array<{
            test_name: string;
            instruction: string;
            is_completed: boolean;
        }>;
    }>;
    documents: Array<{
        id: string;
        file_name: string;
        file_url: string;
        category: string;
        uploaded_at: string;
        uploaded_by?: string;
    }>;
    vitalsTrend: Array<{
        date: string;
        bp?: string;
        weight?: string;
        temp?: string;
    }>;
    doctor: {
        name: string;
        specialty: string;
        qualifications: string;
        reg_number: string;
        signature_url?: string;
    };
    clinic: {
        name: string;
        address: string;
        phone?: string;
        email?: string;
        logo_url?: string;
        header_image_url?: string;
        footer_text?: string;
    };
}

export async function getAppointmentForConsultation(appointmentId: string): Promise<ConsultationContext | { error: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { error: "Unauthorized" };

    try {
        // 1. Get appointment details
        const { data: apptData, error: apptError } = await supabase
            .rpc("get_appointment_details_by_id", { _appointment_id: appointmentId });

        if (apptError) throw apptError;
        if (!apptData?.appointment) return { error: "Appointment not found" };

        const patientId = apptData.appointment.patient_id;

        // 2. Get patient 360 summary (New Rich RPC)
        const { data: p360Data, error: p360Error } = await supabase
            .rpc("get_patient_360_summary", { _patient_id: patientId, _doctor_id: user.id });

        if (p360Error) throw p360Error;

        // 3. Get doctor and clinic details for prescription header/footer
        const { data: doctorData } = await supabase
            .from("doctors")
            .select("specialty, qualifications, registration_number, digital_signature_url, profiles(full_name)")
            .eq("profile_id", user.id)
            .single();

        const { data: clinicData } = await supabase
            .from("clinics")
            .select("*")
            .eq("id", apptData.appointment.clinic_id)
            .single();

        // 4. Check if consultation exists, if not create one
        let consultationId: string;
        const { data: existingConsult } = await supabase
            .from("consultations")
            .select("id")
            .eq("appointment_id", appointmentId)
            .single();

        if (existingConsult) {
            consultationId = existingConsult.id;
        } else {
            const { data: newConsult, error: createError } = await supabase
                .from("consultations")
                .insert({
                    appointment_id: appointmentId,
                    doctor_id: user.id,
                })
                .select("id")
                .single();

            if (createError) throw createError;
            consultationId = newConsult.id;
        }

        // Build response from Rich RPC data
        const summary = p360Data || {};
        const patient = summary.patient || {};
        const medicalProfile = summary.medical_profile || {};

        return {
            appointmentId,
            appointmentNumber: apptData.appointment.appointment_number || "",
            consultationId,
            patient: {
                id: patient.id || patientId,
                name: patient.full_name || apptData.appointment.patient_name || "Unknown",
                age: patient.age || 0,
                gender: patient.gender || "Unknown",
                uhid: patient.uhid || apptData.appointment.patient_uhid || "",
                phone: patient.phone,
                address: patient.address,
                access_flags: patient.flags,
            },
            safetyProfile: {
                allergies: medicalProfile.allergies || [],
                chronic_conditions: medicalProfile.chronic_conditions || [],
                family_history: medicalProfile.family_history || [],
                lifestyle: medicalProfile.lifestyle || {},
            },
            visitHistory: (summary.visit_history || []).map((v: any) => ({
                date: v.visit_date,
                doctor_name: v.doctor_name,
                specialty: v.specialty,
                diagnosis: v.diagnosis || [],
                symptoms: v.symptoms,
                notes: v.notes,
                vitals: v.vitals,
                advice: v.advice,
                prescriptions: v.prescriptions || [],
                lab_orders: v.lab_orders || []
            })),
            documents: (summary.documents || []).map((d: any) => ({
                id: d.id,
                file_name: d.name,
                file_url: d.url,
                category: d.category || "other",
                uploaded_at: d.date,
                uploaded_by: d.uploaded_by
            })),
            vitalsTrend: summary.vitals_trend || [],
            doctor: {
                name: (doctorData?.profiles as any)?.full_name || "Doctor",
                specialty: doctorData?.specialty || "",
                qualifications: doctorData?.qualifications || "",
                reg_number: doctorData?.registration_number || "",
                signature_url: doctorData?.digital_signature_url,
            },
            clinic: {
                name: clinicData?.name || "Clinic",
                address: [clinicData?.address_line_1, clinicData?.address_line_2, clinicData?.city, clinicData?.state].filter(Boolean).join(", "),
                phone: clinicData?.phone_primary,
                email: clinicData?.email_contact,
                logo_url: clinicData?.logo_url,
                header_image_url: clinicData?.header_image_url,
                footer_text: clinicData?.footer_text,
            },
        };
    } catch (e: any) {
        return { error: e.message };
    }
}

export interface MedicineSearchResult {
    id: string;
    brand_name: string;
    generic_name: string;
    strength: string;
    type: string;
}

export async function searchMedicines(query: string): Promise<MedicineSearchResult[] | { error: string }> {
    if (!query || query.length < 2) return [];

    const supabase = await createClient();

    try {
        const { data, error } = await supabase
            .rpc("search_medicines_vector", { _query: query });

        if (error) throw error;

        return (data || []) as MedicineSearchResult[];
    } catch (e: any) {
        return { error: e.message };
    }
}

export interface SubmitPrescriptionPayload {
    consultationId: string;
    diagnosis: Array<{ code: string; label: string }>;
    chiefComplaint: string;
    notes: string;
    vitals: { bp: string; temp: string; weight: string; spo2: string };
    medicines: Array<{
        master_id: string | null;
        name: string;
        frequency: string;
        duration: string;
        instruction: string;
        special_instructions?: string;
        composition?: string;
    }>;
    labs: Array<{ test_name: string }>;
    next_visit_date: string | null;
    next_visit_text: string;
}

export async function submitPrescription(payload: SubmitPrescriptionPayload): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { success: false, error: "Unauthorized" };

    try {
        const { error } = await supabase.rpc("submit_prescription_complete", {
            _consult_id: payload.consultationId,
            _diagnosis: payload.diagnosis,
            _chief_complaint: payload.chiefComplaint,
            _notes: payload.notes,
            _vitals: payload.vitals,
            _meds: payload.medicines,
            _labs: payload.labs,
            _next_visit_date: payload.next_visit_date,
            _next_visit_text: payload.next_visit_text,
        });

        if (error) throw error;

        revalidatePath("/doctor");
        return { success: true };
    } catch (e: any) {
        return { success: false, error: e.message };
    }
}

// --- Medical Profile Management ---

export interface MedicalProfile {
    allergies: string[];
    chronic_conditions: string[];
    lifestyle_tags: Record<string, any>;
    family_history: string[];
}

export async function getMedicalProfile(patientId: string): Promise<MedicalProfile | { error: string }> {
    const supabase = await createClient();

    try {
        const { data, error } = await supabase
            .rpc("get_patient_medical_profile", { _patient_id: patientId });

        if (error) throw error;

        if (data && data.length > 0) {
            const profile = data[0];
            return {
                allergies: profile.allergies || [],
                chronic_conditions: profile.chronic_conditions || [],
                lifestyle_tags: profile.lifestyle_tags || {},
                family_history: profile.family_history || [],
            };
        }

        // Return empty profile if none exists
        return {
            allergies: [],
            chronic_conditions: [],
            lifestyle_tags: {},
            family_history: [],
        };
    } catch (e: any) {
        return { error: e.message };
    }
}


export async function updateMedicalProfile(
    patientId: string,
    profile: Partial<MedicalProfile>
): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { success: false, error: "Unauthorized" };

    try {
        const { data, error } = await supabase.rpc("upsert_patient_medical_profile", {
            _patient_id: patientId,
            _allergies: profile.allergies || null,
            _chronic_conditions: profile.chronic_conditions || null,
            _lifestyle_tags: profile.lifestyle_tags || null,
            _family_history: profile.family_history || null,
        });

        if (error) throw error;

        return { success: true };
    } catch (e: any) {
        return { success: false, error: e.message };
    }
}

// --- Medicine Management ---

export interface CreateMedicinePayload {
    name: string;
    manufacturer_name?: string;
    salt_composition?: string;
    short_composition1?: string;
    short_composition2?: string;
    pack_size_label?: string;
    price?: number;
    type?: string;
    medicine_desc?: string;
    side_effects?: string;
}

export async function createMedicine(payload: CreateMedicinePayload): Promise<{ success: boolean; id?: string; error?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { success: false, error: "Unauthorized" };

    try {
        const { data, error } = await supabase.rpc("create_new_medicine", {
            _name: payload.name,
            _manufacturer_name: payload.manufacturer_name,
            _salt_composition: payload.salt_composition,
            _short_composition1: payload.short_composition1,
            _short_composition2: payload.short_composition2,
            _pack_size_label: payload.pack_size_label,
            _price: payload.price,
            _type: payload.type,
            _medicine_desc: payload.medicine_desc,
            _side_effects: payload.side_effects
        });

        if (error) throw error;

        return { success: true, id: data };
    } catch (e: any) {
        return { success: false, error: e.message };
    }
}
// --- Appointment History Actions ---

export interface AppointmentHistoryItem {
    appointment_id: string;
    appointment_number: string;
    date: string;
    status: string;
    type: string;
    patient: {
        name: string;
        uhid: string;
        details: string;
        phone: string;
    };
    diagnosis: any;
    can_print: boolean;
}

export interface AppointmentHistoryResult {
    data: AppointmentHistoryItem[];
    meta: {
        total_records: number;
        page: number;
        page_size: number;
        total_pages: number;
    };
}

export interface HistorySearchParams {
    page?: number;
    pageSize?: number;
    startDate?: string;
    endDate?: string;
    searchText?: string;
    statusFilter?: string;
}

export async function getDoctorAppointmentsHistory(params: HistorySearchParams): Promise<AppointmentHistoryResult | { error: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { error: "Unauthorized" };

    try {
        const { data, error } = await supabase.rpc("get_doctor_appointments_history", {
            _page: params.page || 1,
            _page_size: params.pageSize || 10,
            _start_date: params.startDate || null,
            _end_date: params.endDate || null,
            _search_text: params.searchText || "",
            _status_filter: params.statusFilter || "all"
        });

        if (error) throw error;

        // Calculate total_pages since RPC doesn't provide it
        const totalRecords = data.meta.total_records;
        const totalPages = Math.ceil(totalRecords / (params.pageSize || 10));

        return {
            data: data.data,
            meta: {
                ...data.meta,
                total_pages: totalPages
            }
        };
    } catch (e: any) {
        return { error: e.message };
    }
}
