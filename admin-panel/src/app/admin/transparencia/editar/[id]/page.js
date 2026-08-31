import { createClient } from '@/lib/supabase/server';
import { getAdminUser } from '@/lib/auth';
import { notFound } from 'next/navigation';
import EditarForm from './EditarForm';
import Link from 'next/link';

export const metadata = {
  title: 'Editar Documento de Transparencia — Admin GADOR',
};

export default async function EditarTransparenciaPage({ params }) {
  await getAdminUser(); // redirige a /admin/login si no hay sesión de admin
  const { id } = await params;
  const supabase = await createClient();

  // Obtener los datos actuales del documento
  const { data: documento, error } = await supabase
    .from('transparencia_documentos')
    .select('*')
    .eq('id', id)
    .single();

  if (error || !documento) {
    console.error('Error cargando documento:', error);
    notFound();
  }

  return (
    <div className="adminPage">
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '2rem' }}>
        <div>
          <h1 className="adminTitle">Editar Documento de Transparencia</h1>
          <p className="adminSubtitle">Modifica los detalles del documento o gestión sin necesidad de resubir el PDF.</p>
        </div>
        <Link href="/admin/transparencia" className="btnSecondary">
          Cancelar
        </Link>
      </div>

      <div className="tableCard">
        <EditarForm documento={documento} />
      </div>
    </div>
  );
}
