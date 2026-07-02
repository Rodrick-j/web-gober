import { createClient } from '@/lib/supabase/server';
import { getAdminUser } from '@/lib/auth';
import NoticiasClient from './NoticiasClient';

export const metadata = {
  title: 'Noticias — Admin GADOR',
};

export default async function NoticiasPage() {
  const { perfil } = await getAdminUser();
  const supabase = await createClient();

  const esSuperAdmin = perfil?.rol === 'super_admin';

  let query = supabase
    .from('noticias')
    .select(`
      id,
      titulo,
      fecha_publicacion,
      estado,
      imagen_portada_url,
      categoria,
      es_comunicado_rapido,
      secretarias ( nombre_corto )
    `)
    .order('fecha_publicacion', { ascending: false });

  if (!esSuperAdmin && perfil?.secretaria_id) {
    query = query.eq('secretaria_id', perfil.secretaria_id);
  }

  const { data: noticias } = await query;

  return <NoticiasClient noticias={noticias || []} esSuperAdmin={esSuperAdmin} />;
}
