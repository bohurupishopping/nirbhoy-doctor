'use server'

import { z } from "zod"
import { createClient } from "@/lib/supabase/server"
import { redirect } from "next/navigation"
import { headers } from "next/headers"

const loginSchema = z.object({
    email: z.string().email(),
    password: z.string().min(6),
})

export type AuthState = {
    error?: string
    success?: boolean
    redirectTo?: string // URL to redirect to on success
}

const signupSchema = z.object({
    email: z.string().email(),
    password: z.string().min(6),
    fullName: z.string().min(2, "Full Name is required"),
})

export async function loginAction(prevState: AuthState | null, formData: FormData): Promise<AuthState> {
    const email = formData.get("email") as string
    const password = formData.get("password") as string

    const validation = loginSchema.safeParse({ email, password })

    if (!validation.success) {
        return { error: "Invalid email or password format." }
    }

    const supabase = await createClient()

    const { error } = await supabase.auth.signInWithPassword({
        email,
        password,
    })

    if (error) {
        return { error: error.message }
    }

    // Return success with redirect URL - client will do HARD navigation
    // This prevents the brief flash of cached public page

    // Determine redirect based on role
    // We can try to get the role from the refreshed session metadata immediately
    // or fetched profile.

    // Refresh session to get latest metadata after login
    const { data: { user } } = await supabase.auth.getUser()

    let redirectTo = "/"
    if (user) {
        let role = user.app_metadata?.role

        if (!role) {
            const { data: profile } = await supabase
                .from('profiles')
                .select('role')
                .eq('id', user.id)
                .single()
            role = profile?.role
        }

        // DYNAMIC DOMAIN RESOLUTION
        const headersList = await headers()
        const host = headersList.get("host") || "localhost:3000"
        const protocol = host.includes("localhost") ? "http" : "https"

        // Strip existing subdomains to get the root domain
        // Regex removes 'admin.', 'doctor.', 'app.' from the start if present
        const rootDomain = host.replace(/^(admin|doctor|app)\./, '')

        if (role === 'admin') redirectTo = `${protocol}://admin.${rootDomain}`
        else if (role === 'doctor') redirectTo = `${protocol}://doctor.${rootDomain}`
        else if (role === 'staff') redirectTo = `${protocol}://app.${rootDomain}`

        // NOTE: For local dev on simple localhost:3000 without sophisticated DNS, 
        // subdomains might be simulated or we might need relative paths if using path-rewrites?
        // The proxy instructions show:
        // admin.* -> /admin
        // But the proxy logic DETECTS subdomain.
        // If I am on `localhost:3000/login`, and I login as admin.
        // If I redirect to `/`, I am still on `localhost:3000`.
        // The proxy sees `localhost` (no subdomain? or just main domain).
        // It serves public page.
        // So I MUST redirect to the subdomain for the proxy to trigger the rewrite!

        // DEVELOPMENT ENVIRONMENT HANDLING:
        // Ideally use environment variables for the domains.
        // For now, I'll assume standard localhost subdomains if we are in dev.
        // Or if production, use the real domain.

        // Let's try to be smart about the host.
        // But server actions don't easily give request host without headers.
        // For now, let's just return success=true, and let the CLIENT component handle the navigation logic?
        // The schema says `redirectTo?: string`. 
        // Let's implement this logic client-side OR return a "role" in the state?
        // No, `AuthState` is defined. Let's add role to it or just return a smart URL.
    }

    // Returning just / for now might be safer if we don't know the domain.
    // BUT the user specifically asked for "good eficinent, smarter".
    // Let's return the role in the response? We can't change the type easily without breaking other things?
    // Actually I can change the type in line 12.

    return { success: true, redirectTo }
}

export async function signupAction(prevState: AuthState | null, formData: FormData): Promise<AuthState> {
    const email = formData.get("email") as string
    const password = formData.get("password") as string
    const fullName = formData.get("display_name") as string

    const validation = signupSchema.safeParse({ email, password, fullName })

    if (!validation.success) {
        return { error: validation.error.issues[0].message }
    }

    const supabase = await createClient()

    const { error } = await supabase.auth.signUp({
        email,
        password,
        options: {
            data: {
                full_name: fullName
            }
        }
    })

    if (error) {
        return { error: error.message }
    }

    // Usually signup requires email verification, so we might not redirect immediately.
    // Or if autoconfirm is enabled. Assuming we show a success message or redirect.
    // Let's redirect to login or show success.
    // For now, redirecting to / with a query param? Or just let it flow.
    // If email confirmation is ON, user can't login yet. 
    // Let's return success state and let UI handle it.

    return { success: true }
}

export async function logoutAction() {
    const supabase = await createClient()
    await supabase.auth.signOut()
    redirect("/login")
}

export async function getCurrentUserProfile() {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) return null

    const { data: profile } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', user.id)
        .single()

    return profile
}
