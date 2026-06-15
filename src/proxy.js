// =====================================================
// proxy.js — GUARDIÁN DE SEGURIDAD (Next.js 16+ proxy)
// Se ejecuta en CADA petición antes de llegar a la página.
// Protege todas las rutas /admin/* y redirige si no hay sesión.
// =====================================================
import { createServerClient } from '@supabase/ssr';
import { NextResponse } from 'next/server';

export async function proxy(request) {
  let supabaseResponse = NextResponse.next({ request });

  // Crear cliente Supabase para el middleware
  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          );
          supabaseResponse = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  // ⚠️ IMPORTANTE: Refrescar la sesión del usuario
  // Esto renueva el token JWT automáticamente si expiró
  const { data: { user } } = await supabase.auth.getUser();

  const { pathname } = request.nextUrl;

  // ── Rutas protegidas ──────────────────────────────
  const isAdminRoute = pathname.startsWith('/admin');
  const isLoginPage  = pathname === '/admin/login';

  // Si intenta acceder a /admin/* sin sesión → redirigir al login
  if (isAdminRoute && !isLoginPage && !user) {
    const loginUrl = new URL('/admin/login', request.url);
    // Guardar la URL original para redirigir después del login
    loginUrl.searchParams.set('redirectTo', pathname);
    return NextResponse.redirect(loginUrl);
  }

  // Si ya tiene sesión y va al login → redirigir al dashboard
  // EXCEPTO si viene con un error (ej. no_access), en ese caso le dejamos ver el error en el login
  const hasError = request.nextUrl.searchParams.has('error');
  if (isLoginPage && user && !hasError) {
    return NextResponse.redirect(new URL('/admin', request.url));
  }

  // Add current pathname as header so layouts can detect which page they're on
  supabaseResponse.headers.set('x-pathname', pathname);
  return supabaseResponse;
}


// Configurar en qué rutas aplica el proxy
export const config = {
  matcher: [
    // Aplica a todas las rutas excepto archivos estáticos y API de Next.js
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
};
