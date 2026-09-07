import { createClient } from '@/lib/supabase/server';
import { requireSuperAdmin } from '@/lib/auth';
import EditarUsuarioClient from './EditarUsuarioClient';
import { notFound } from 'next/navigation';

export const metadata = { title: 'Editar Usuario — Admin GADOR' };

export default async function EditarUsuarioPage({ params }) {
  await requireSuperAdmin();
  const { id } = await params;
  const supabase = await createClient();

  const [{ data: usuario }, { data: secretarias }] = await Promise.all([
    supabase
      .from('usuarios_admin')
      .select('id, nombre, apellido, email, cargo, telefono, rol, activo, secretaria_id, avatar_url')
      .eq('id', id)
      .single(),
    supabase
      .from('secretarias')
      .select('id, nombre_corto, icono')
      .eq('activo', true)
      .order('orden'),
  ]);

  if (!usuario) notFound();

  return <EditarUsuarioClient usuario={usuario} secretarias={secretarias || []} />;
}
