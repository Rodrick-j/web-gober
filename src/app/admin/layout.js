import { createClient } from '@/lib/supabase/server';
import AdminShell from '@/components/admin/AdminShell/AdminShell';
import './admin.css';

export const metadata = {
  title: 'Panel Admin — GADOR Oruro',
  description: 'Panel de administración del Gobierno Autónomo Departamental de Oruro',
  robots: 'noindex, nofollow',
};

export default async function AdminRootLayout({ children }) {
  const supabase = await createClient();

  // Check if user has an active session
  const { data: { user } } = await supabase.auth.getUser();

  // If no session, just render children (the login page handles its own UI + redirect)
  if (!user) {
    return children;
  }

  // Get admin profile
  const { data: perfil } = await supabase
    .from('usuarios_admin')
    .select(`
      id, nombre, apellido, email, cargo, rol, avatar_url,
      secretaria_id,
      secretarias ( id, nombre, nombre_corto, slug, color_acento, icono )
    `)
    .eq('auth_user_id', user.id)
    .eq('activo', true)
    .single();

  // If no valid admin profile, render children (login page will handle the error display)
  if (!perfil) {
    return children;
  }

  // Get all secretarías for sidebar
  const { data: secretarias } = await supabase
    .from('secretarias')
    .select('id, nombre, nombre_corto, slug, color_acento, icono, orden')
    .eq('activo', true)
    .order('orden');

  return (
    <AdminShell perfil={perfil} secretarias={secretarias || []}>
      {children}
    </AdminShell>
  );
}
