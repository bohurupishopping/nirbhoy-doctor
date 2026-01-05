import { createClient } from '@/lib/supabase/middleware'
import { NextResponse, type NextRequest } from 'next/server'

export default async function proxy(request: NextRequest) {
    // 1. Setup Supabase Client & Response
    const { supabase, response } = await createClient(request)

    // Allow requests to _next/static, _next/image, favicon.ico, etc.
    if (
        request.nextUrl.pathname.startsWith('/_next') ||
        request.nextUrl.pathname.startsWith('/api') ||
        request.nextUrl.pathname.startsWith('/static') ||
        request.nextUrl.pathname.includes('.') // file extension
    ) {
        return response
    }

    // 2. Subdomain Detection
    const hostname = request.headers.get('host') ?? ''
    const subdomain = hostname.split('.')[0]

    // Define portal subdomains and their corresponding URL prefixes
    const portalConfig: Record<string, { urlPrefix: string; role: 'admin' | 'staff' | 'doctor' }> = {
        admin: { urlPrefix: '/admin', role: 'admin' },
        app: { urlPrefix: '/staff', role: 'staff' },
        doctor: { urlPrefix: '/doctor', role: 'doctor' }
    }

    const isPortalSubdomain = subdomain in portalConfig
    const portalPaths = ['/admin', '/staff', '/doctor']
    const isPortalPath = portalPaths.some(p =>
        request.nextUrl.pathname === p || request.nextUrl.pathname.startsWith(`${p}/`)
    )

    // SECURITY: Block direct path access to portal routes
    // If accessing /admin, /staff, /doctor directly (not via subdomain), block it
    if (!isPortalSubdomain && isPortalPath) {
        return new NextResponse('Not Found', { status: 404 })
    }

    // If not a portal subdomain, serve public page as-is
    if (!isPortalSubdomain) {
        return response
    }

    // 3. Portal subdomain detected - apply auth and rewrite
    const config = portalConfig[subdomain]
    const requiredRole = config.role
    const urlPrefix = config.urlPrefix

    // Auth Check - Refresh session and get user
    const {
        data: { user },
    } = await supabase.auth.getUser()

    // Define route types
    const isLoginPage = request.nextUrl.pathname === '/login' || request.nextUrl.pathname.startsWith('/login/')
    const isUnauthorizedPage = request.nextUrl.pathname === '/unauthorized'
    const isPublicArg = request.nextUrl.searchParams.get('public') === 'true'

    // 4. Security: Redirect unauthenticated users to login
    if (!user && !isLoginPage && !isPublicArg) {
        const url = request.nextUrl.clone()
        url.pathname = '/login'
        return NextResponse.redirect(url)
    }

    // 5. RBAC: Check role matches portal
    if (user && !isLoginPage && !isPublicArg && !isUnauthorizedPage) {
        // OPTIMIZATION: Check app_metadata first (populated by trigger)
        let userRole = user.app_metadata?.role

        // Fallback: If metadata not present, fetch from DB
        if (!userRole) {
            const { data: profile } = await supabase
                .from('profiles')
                .select('role')
                .eq('id', user.id)
                .single()
            userRole = profile?.role
        }

        let allowed = false
        if (userRole === 'super_admin') allowed = true
        else {
            if (requiredRole === 'admin' && userRole === 'admin') allowed = true
            if (requiredRole === 'doctor' && userRole === 'doctor') allowed = true
            if (requiredRole === 'staff' && (userRole === 'staff' || userRole === 'admin')) allowed = true
        }

        if (!allowed) {
            const url = request.nextUrl.clone()
            url.pathname = '/unauthorized'
            return NextResponse.redirect(url)
        }
    }

    // 6. Rewrite subdomain requests to portal paths
    // For login and unauthorized, use shared pages at root (no rewrite)
    if (isLoginPage || isUnauthorizedPage) {
        return response
    }

    // Build rewrite path: urlPrefix + original pathname
    // e.g., admin.localhost/ → /admin, admin.localhost/booking → /admin/booking
    const originalPath = request.nextUrl.pathname
    const rewritePath = originalPath === '/'
        ? urlPrefix
        : `${urlPrefix}${originalPath}`

    const rewriteUrl = new URL(rewritePath, request.url)

    const rewriteResponse = NextResponse.rewrite(rewriteUrl, {
        request: {
            headers: request.headers
        }
    })

    // Copy cookies from session refresh
    response.cookies.getAll().forEach(cookie => {
        rewriteResponse.cookies.set(cookie.name, cookie.value)
    })

    return rewriteResponse
}

export const config = {
    matcher: [
        '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
    ],
}
