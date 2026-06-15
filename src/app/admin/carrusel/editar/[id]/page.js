import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import EditarCarruselForm from './EditarCarruselForm';
import Link from 'next/link';

export const metadata = {
  title: 'Editar Banner — Admin GADOR',
};

export default async function EditarBannerPage({ params }) {
  const { id } = await params;
  const supabase = await createClient();

  // Obtener los datos actuales del banner
  const { data: banner, error } = await supabase
    .from('banners_inicio')
    .select('*')
    .eq('id', id)
    .single();

  if (error || !banner) {
    console.error('Error cargando banner:', error);
    notFound();
  }

  return (
    <div className="adminPage">
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '2rem' }}>
        <div>
          <h1 className="adminTitle">Editar Banner</h1>
          <p className="adminSubtitle">Modifica los detalles, enlaces y animaciones de la imagen seleccionada.</p>
        </div>
        <Link href="/admin/carrusel" className="btnSecondary">
          Cancelar
        </Link>
      </div>

      <div className="tableCard">
        <EditarCarruselForm banner={banner} />
      </div>
    </div>
  );
}
