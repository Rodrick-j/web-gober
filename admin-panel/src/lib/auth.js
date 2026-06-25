// =====================================================
// lib/auth.js
// Funciones de autenticación y control de roles
// =====================================================
import { createClient } from '@/lib/supabase/server';
import { redirect } from 'next/navigation';

/**
 * Obtiene el usuario autenticado + su perfil de admin con rol y secretaría.
 * Úsala en Server Components dentro de /admin/*
 * Si no hay sesión, redirige al login automáticamente.
 */
export async function getAdminUser() {
  const supabase = await createClient();

  // Verificar sesión
  const { data: { user }, error: authError } = await supabase.auth.getUser();

  if (authError || !user) {
    redirect('/admin/login');
  }

  // Obtener perfil del admin con rol y secretaría asignada
  const { data: perfil, error: perfilError } = await supabase
    .from('usuarios_admin')
    .select(`
      id,
      nombre,
      apellido,
      email,
      cargo,
      rol,
      activo,
      avatar_url,
      last_login,
      secretaria_id,
      secretarias (
        id,
        nombre,
        nombre_corto,
        slug,
        color_acento,
        icono
      )
    `)
    .eq('auth_user_id', user.id)
    .eq('activo', true)
    .single();

  if (perfilError || !perfil) {
    // El usuario existe en auth pero no tiene perfil de admin → sin acceso
    redirect('/admin/login?error=no_access');
  }

  return { user, perfil };
}

/**
 * Verifica que el usuario sea super_admin.
 * Redirige a dashboard si no lo es.
 */
export async function requireSuperAdmin() {
  const { user, perfil } = await getAdminUser();

  if (perfil.rol !== 'super_admin') {
    redirect('/admin?error=forbidden');
  }

  return { user, perfil };
}

/**
 * Verifica que el usuario pueda acceder a una secretaría específica.
 * super_admin puede acceder a todas. secretaria_admin solo a la suya.
 */
export async function requireAccesoSecretaria(secretariaId) {
  const { user, perfil } = await getAdminUser();

  if (
    perfil.rol !== 'super_admin' &&
    perfil.secretaria_id !== secretariaId
  ) {
    redirect('/admin?error=forbidden');
  }

  return { user, perfil };
}
