// =====================================================
// src/proxy.js  (antes "middleware" — renombrado en Next 16)
// Barrera de autenticación para TODO /admin/*
//
// Chequeo optimista: si no hay sesión válida de Supabase se
// redirige al login ANTES de renderizar cualquier página.
// La autorización fina (rol, secretaría) se sigue haciendo en
// cada page / server action / API route + RLS en la base de datos.
// =====================================================
import { NextResponse } from 'next/server';
import { createServerClient } from '@supabase/ssr';

export async function proxy(request) {
  let response = NextResponse.next({ request });

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
          response = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            response.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  // getUser() valida el JWT contra el servidor de Auth (no confía en la cookie)
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const path = request.nextUrl.pathname;
  const isLoginRoute = path === '/admin/login';

  // Sin sesión → solo se permite el login
  if (!user && !isLoginRoute) {
    const url = request.nextUrl.clone();
    url.pathname = '/admin/login';
    url.search = '';
    url.searchParams.set('redirectTo', path);
    return NextResponse.redirect(url);
  }

  // Con sesión y entrando al login → mandar al panel
  if (user && isLoginRoute) {
    const url = request.nextUrl.clone();
    url.pathname = '/admin';
    url.search = '';
    return NextResponse.redirect(url);
  }

  return response;
}

export const config = {
  // Solo corre en el panel. Excluye estáticos.
  matcher: ['/admin/:path*'],
};
