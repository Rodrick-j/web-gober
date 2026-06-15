import { createClient } from '@/lib/supabase/server';
import { revalidatePath } from 'next/cache';
import Link from 'next/link';
import Image from 'next/image';
import DeleteBannerBtn from './DeleteBannerBtn';

export const metadata = {
  title: 'Carrusel Inicio — Admin GADOR',
};

// Server Actions para reordenar y ocultar/mostrar
async function toggleBanner(id, currentState) {
  'use server';
  const supabase = await createClient();
  await supabase.from('banners_inicio').update({ activo: !currentState }).eq('id', id);
  revalidatePath('/admin/carrusel');
  revalidatePath('/');
}

async function moveBanner(id, currentOrder, direction, allBanners) {
  'use server';
  const supabase = await createClient();
  
  // Find the banner to swap with
  const swapIndex = allBanners.findIndex(b => b.id === id) + direction;
  if (swapIndex < 0 || swapIndex >= allBanners.length) return; // Can't move further
  
  const swapBanner = allBanners[swapIndex];
  
  // Perform the swap in DB
  await supabase.from('banners_inicio').update({ orden: swapBanner.orden }).eq('id', id);
  await supabase.from('banners_inicio').update({ orden: currentOrder }).eq('id', swapBanner.id);
  
  revalidatePath('/admin/carrusel');
  revalidatePath('/');
}

export default async function CarruselAdminPage() {
  const supabase = await createClient();
  
  const { data: banners, error } = await supabase
    .from('banners_inicio')
    .select('*')
    .order('orden', { ascending: true });

  return (
    <div className="adminPage">
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.5rem' }}>
        <div>
          <h1 className="adminTitle">Carrusel de Inicio</h1>
          <p className="adminSubtitle">Administra las imágenes grandes (Hero) de la página principal.</p>
        </div>
        <Link href="/admin/carrusel/crear" className="btnPrimary">
          + Agregar Imagen
        </Link>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', marginBottom: '2rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>🖼️</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>¿Cómo funciona esto en la página pública?</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Estas imágenes aparecen en la <strong>portada principal</strong> del sitio web. Usa las flechas para reordenar las imágenes y los botones de ocultar para pausar una imagen temporalmente. ¡Prueba las nuevas opciones de animación al editar!
          </p>
        </div>
      </div>

      <div className="tableCard">
        <div className="tableHeader">
          <div className="tableTitle">Imágenes Activas ({banners?.length || 0})</div>
        </div>
        <div style={{ overflowX: 'auto' }}>
          <table className="table">
            <thead>
              <tr>
                <th style={{ width: '80px', textAlign: 'center' }}>Orden</th>
                <th>Imagen</th>
                <th>Título / Animación</th>
                <th>Estado</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {banners?.length === 0 ? (
                <tr>
                  <td colSpan="5" style={{ textAlign: 'center', padding: '2rem' }}>
                    No hay imágenes configuradas para el carrusel.
                  </td>
                </tr>
              ) : (
                banners?.map((banner, index) => (
                  <tr key={banner.id}>
                    <td>
                      <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.2rem' }}>
                        <form action={moveBanner.bind(null, banner.id, banner.orden, -1, banners)}>
                          <button type="submit" disabled={index === 0} style={{ background: 'none', border: 'none', cursor: index === 0 ? 'not-allowed' : 'pointer', opacity: index === 0 ? 0.3 : 1 }}>
                            🔼
                          </button>
                        </form>
                        <strong>{banner.orden}</strong>
                        <form action={moveBanner.bind(null, banner.id, banner.orden, 1, banners)}>
                          <button type="submit" disabled={index === banners.length - 1} style={{ background: 'none', border: 'none', cursor: index === banners.length - 1 ? 'not-allowed' : 'pointer', opacity: index === banners.length - 1 ? 0.3 : 1 }}>
                            🔽
                          </button>
                        </form>
                      </div>
                    </td>
                    <td>
                      <div style={{ position: 'relative', width: '140px', height: '70px', borderRadius: '6px', overflow: 'hidden', background: '#111', border: '1px solid var(--admin-border)' }}>
                        <Image 
                          src={banner.imagen_url} 
                          alt="Banner" 
                          fill
                          style={{ objectFit: 'cover' }} 
                        />
                      </div>
                    </td>
                    <td>
                      <div style={{ fontWeight: 600 }}>{banner.titulo || <span style={{ color: '#999', fontWeight: 'normal' }}>Sin título</span>}</div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--admin-text-muted)', marginTop: '0.3rem', display: 'flex', gap: '0.5rem' }}>
                        <span style={{ background: 'var(--admin-surface-2)', padding: '0.1rem 0.4rem', borderRadius: '4px' }}>
                          Texto: {banner.animacion_texto || 'fade-in'}
                        </span>
                        <span style={{ background: 'var(--admin-surface-2)', padding: '0.1rem 0.4rem', borderRadius: '4px' }}>
                          Transición: {banner.animacion_carrusel || 'creative'}
                        </span>
                      </div>
                    </td>
                    <td>
                      <form action={toggleBanner.bind(null, banner.id, banner.activo)}>
                        <button type="submit" className={`badge ${banner.activo ? 'badgeSuccess' : 'badgeWarning'}`} style={{ border: 'none', cursor: 'pointer' }}>
                          {banner.activo ? 'ACTIVO' : 'OCULTO'}
                        </button>
                      </form>
                    </td>
                    <td>
                      <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <Link 
                          href={`/admin/carrusel/editar/${banner.id}`}
                          className="btnSecondary" 
                          style={{ padding: '0.4rem 0.8rem', fontSize: '0.8rem', textDecoration: 'none' }}
                        >
                          Editar
                        </Link>
                        <DeleteBannerBtn banner={banner} />
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
