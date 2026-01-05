'use server'

import { createClient } from "@/lib/supabase/server"
import { PutObjectCommand, DeleteObjectCommand } from "@aws-sdk/client-s3"
import { getSignedUrl } from "@aws-sdk/s3-request-presigner"
import { r2, R2_BUCKET_NAME, R2_PUBLIC_DOMAIN } from "@/lib/r2"
import { v4 as uuidv4 } from 'uuid'
import { revalidatePath } from "next/cache"

// TYPES
// Matches public.file_category + new migrations
export type FileCategory = 'other' | 'lab_report' | 'prescription' | 'x_ray' | 'discharge_summary' | 'insurance' | 'prescription_old'

export interface PatientDocument {
    id: string
    file_name: string
    file_url: string
    category: FileCategory
    uploaded_at: string
    uploaded_by: string
}

// 1. GENERATE UPLOAD URL (Presigned URL for Direct Upload)
export async function getUploadUrl(
    fileName: string,
    fileType: string,
    patientId: string
) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
        return { error: 'Unauthorized' }
    }

    // Sanitize filename and create unique path
    const cleanFileName = fileName.replace(/[^a-zA-Z0-9.-]/g, '_')
    const fileKey = `patients/${patientId}/${uuidv4()}-${cleanFileName}`

    const command = new PutObjectCommand({
        Bucket: R2_BUCKET_NAME,
        Key: fileKey,
        ContentType: fileType,
        // ACL: 'public-read' // R2 doesn't strictly support ACLs the same way, usually bucket policy handles it or it's private by default. 
        // We will rely on Public Access or Worker if configured, or signed GETs. 
        // User provided R2_PUBLIC_DOMAIN, so we assume public read is enabled or we return the public URL.
    })

    try {
        const signedUrl = await getSignedUrl(r2, command, { expiresIn: 3600 })

        // Construct the final public URL
        // If R2_PUBLIC_DOMAIN is set, use it. Otherwise, use what? 
        // Example: https://cdn.example.com/patients/...
        const publicUrl = R2_PUBLIC_DOMAIN
            ? `${R2_PUBLIC_DOMAIN}/${fileKey}`
            : signedUrl.split('?')[0] // Fallback (might not work if bucket is private)

        return { success: true, url: signedUrl, publicUrl, fileKey }
    } catch (error: any) {
        console.error("Error generating upload URL:", error)
        return { error: error.message }
    }
}

// 2. SAVE METADATA
export async function saveDocumentMetadata(
    patientId: string,
    fileName: string,
    fileUrl: string,
    category: string
) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) return { error: 'Unauthorized' }

    const { data, error } = await supabase.rpc('save_patient_document', {
        _patient_id: patientId,
        _file_name: fileName,
        _file_url: fileUrl,
        _category: category,
        _uploaded_by: user.id
    })

    if (error) {
        console.error("Error saving document metadata:", error)
        return { error: error.message }
    }

    revalidatePath(`/staff/patient/${patientId}`)
    return { success: true, id: data }
}

// 3. GET DOCUMENTS
export async function fetchPatientDocuments(patientId: string): Promise<PatientDocument[]> {
    const supabase = await createClient()

    // Auth check optional for reading? usually yes.
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return []

    const { data, error } = await supabase.rpc('get_patient_documents', {
        _patient_id: patientId
    })

    if (error) {
        console.error("Error fetching documents:", error)
        return []
    }

    return data as PatientDocument[]
}

// 4. DELETE DOCUMENT
export async function deleteDocument(documentId: string, fileUrl: string) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return { error: 'Unauthorized' }

    // 1. Delete from R2
    // Extract Key from URL
    // URL format: https://cdn.domain.com/patients/id/filename
    // We need "patients/id/filename"
    let fileKey = ''
    if (fileUrl.includes(R2_PUBLIC_DOMAIN!)) {
        fileKey = fileUrl.replace(`${R2_PUBLIC_DOMAIN}/`, '')
    } else {
        // Fallback for direct URLs if used
        try {
            const urlObj = new URL(fileUrl)
            fileKey = urlObj.pathname.substring(1) // remove leading /
        } catch (e) {
            console.error("Invalid URL parsing for delete", e)
        }
    }

    if (fileKey) {
        try {
            await r2.send(new DeleteObjectCommand({
                Bucket: R2_BUCKET_NAME,
                Key: fileKey
            }))
        } catch (r2Error) {
            console.error("Error deleting from R2:", r2Error)
            // We continue to delete from DB even if R2 fails (orphan cleanup later?)
        }
    }

    // 2. Delete from DB
    const { error } = await supabase.rpc('delete_patient_document', {
        _document_id: documentId
    })

    if (error) return { error: error.message }

    revalidatePath('/staff/patient') // Revalidate broader path or specific
    return { success: true }
}
