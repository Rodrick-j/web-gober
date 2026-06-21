import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import { revalidatePath } from 'next/cache';
import styles from './page.module.css';

export const metadata = {
  title: 'Noticias — Admin GADOR',
};

export default async function NoticiasPage() {
  const supabase = await createClient();
  
  // Obtener el perfil del usuario logueado para saber su secretaría
  const { data: { user } } = await supabase.auth.getUser();
  const { data: perfil } = await supabase
    .from('usuarios_admin')
    .select('rol, secretaria_id')
    .eq('auth_user_id', user.id)
    .single();

  const esSuperAdmin = perfil?.rol === 'super_admin';

  // Consultar noticias. Si es super_admin ve todas, si no, solo las de su secretaría.
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

  const { data: noticias, error } = await query;

  return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Gestión de Noticias</h1>
          <p className="adminSubtitle">Administra los comunicados y artículos de prensa.</p>
        </div>
        <Link href="/admin/noticias/crear" className="btnPrimary">
          + Nueva Noticia
        </Link>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', marginBottom: '2rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>📢</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>¿Cómo funciona esto en la página pública?</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Las noticias publicadas aquí aparecerán automáticamente en la <strong>página principal</strong> (sección de Últimas Noticias) y en el portal de la <strong>Secretaría correspondiente</strong>. Si guardas una noticia como "Borrador", solo será visible en este panel hasta que la publiques.
          </p>
        </div>
      </div>

      <div className="tableCard">
        <div className="tableHeader">
          <div className="tableTitle">Lista de Noticias ({noticias?.length || 0})</div>
        </div>
        <div style={{ overflowX: 'auto' }}>
          <table className="table">
            <thead>
              <tr>
                <th>Imagen</th>
                <th>Título</th>
                <th>Categoría</th>
                <th>Tipo</th>
                {esSuperAdmin && <th>Secretaría</th>}
                <th>Fecha</th>
                <th>Estado</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {noticias?.length === 0 ? (
                <tr>
                  <td colSpan={esSuperAdmin ? 8 : 7} style={{ textAlign: 'center', padding: '2rem' }}>
                    No hay noticias registradas.
                  </td>
                </tr>
              ) : (
                noticias?.map((noticia) => (
                  <tr key={noticia.id}>
                    <td>
                      {noticia.imagen_portada_url ? (
                        <div className={styles.imgThumb}>
                          <img src={noticia.imagen_portada_url} alt="Portada" />
                        </div>
                      ) : (
                        <div className={styles.noImg}>Sin foto</div>
                      )}
                    </td>
                    <td>
                      <strong>{noticia.titulo}</strong>
                    </td>
                    <td>
                      <span className={styles.badgeSecretaria} style={{ background: 'var(--admin-surface-2)', color: 'var(--admin-text)' }}>
                        {noticia.categoria || 'Todas'}
                      </span>
                    </td>
                    <td>
                      {noticia.es_comunicado_rapido ? (
                        <span className="badge badgeWarning">Comunicado Rápido</span>
                      ) : (
                        <span className="badge badgeSuccess" style={{ background: '#3b82f6', color: '#fff' }}>Noticia Normal</span>
                      )}
                    </td>
                    {esSuperAdmin && (
                      <td>
                        <span className={styles.badgeSecretaria}>
                          {noticia.secretarias?.nombre_corto || 'General'}
                        </span>
                      </td>
                    )}
                    <td>{new Date(noticia.fecha_publicacion).toLocaleDateString('es-BO')}</td>
                    <td>
                      <span className={`badge ${noticia.estado === 'publicado' ? 'badgeSuccess' : 'badgeWarning'}`}>
                        {noticia.estado.toUpperCase()}
                      </span>
                    </td>
                    <td>
                      <div className={styles.actions} style={{ display: 'flex', gap: '0.5rem' }}>
                        <Link href={`/admin/noticias/editar/${noticia.id}`} className="btnSecondary" style={{ padding: '0.4rem 0.8rem', fontSize: '0.75rem' }}>
                          Editar
                        </Link>
                        {noticia.estado === 'publicado' && (
                          <form action={async () => {
                            'use server';
                            const supabaseServer = await createClient();
                            await supabaseServer.from('noticias').update({ estado: 'borrador' }).eq('id', noticia.id);
                            revalidatePath('/admin/noticias');
                            revalidatePath('/');
                          }}>
                            <button type="submit" className="btnSecondary" style={{ padding: '0.4rem 0.8rem', fontSize: '0.75rem', background: 'transparent', color: 'var(--admin-text-muted)', border: '1px solid var(--admin-border)' }}>
                              Ocultar
                            </button>
                          </form>
                        )}
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
