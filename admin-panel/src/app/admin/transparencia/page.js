import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import { revalidatePath } from 'next/cache';
import styles from './page.module.css';

export const metadata = {
  title: 'Transparencia — Admin GADOR',
};

// Mapeo de valores DB a etiquetas legibles
const TIPO_LABELS = {
  rendicion_cuentas: { label: 'Rendición de Cuentas', emoji: '📊', color: '#10b981' },
  actividades: { label: 'Actividades', emoji: '🗓️', color: '#3b82f6' },
  reclamos: { label: 'Formulario de Reclamos', emoji: '📝', color: '#f59e0b' },
  auditoria_gador: { label: 'Auditoría G.A.D.O.R.', emoji: '🏢', color: '#8b0000' },
  auditoria_sedcam: { label: 'Auditoría S.E.D.C.A.M.', emoji: '🛣️', color: '#eab308' },
  auditoria_sedeges: { label: 'Auditoría S.E.D.E.G.E.S.', emoji: '🤝', color: '#8b5cf6' },
  auditoria_sedes: { label: 'Auditoría S.E.D.E.S.', emoji: '🏥', color: '#14b8a6' },
};

function formatFecha(fechaStr) {
  if (!fechaStr) return '';
  const dateOnly = fechaStr.split('T')[0];
  return new Date(dateOnly + 'T00:00:00').toLocaleDateString('es-BO');
}

export default async function TransparenciaPage({ searchParams }) {
  try {
    const params = await searchParams;
    const activeTab = params?.tab || 'rendicion_cuentas';
    const supabase = await createClient();
    
    // Try to get transparencia documentos
    let { data: documentos, error } = await supabase
      .from('transparencia_documentos')
      .select('id, tipo, gestion, titulo, fecha_publicacion, es_publico, archivo_url')
      .order('gestion', { ascending: false })
      .order('fecha_publicacion', { ascending: false });

    if (error) {
      // Show a helpful error message if the table doesn't exist
      if (error.code === '42P01') {
        return (
          <div className="adminPage">
            <div className={styles.header}>
              <div>
                <h1 className="adminTitle">Transparencia Institucional</h1>
                <p className="adminSubtitle">Administra documentos de transparencia.</p>
              </div>
            </div>
            <div style={{ background: '#fef2f2', border: '1px solid #fecaca', padding: '2rem', borderRadius: '12px', color: '#991b1b', textAlign: 'center' }}>
              <h2 style={{ fontSize: '1.25rem', fontWeight: 'bold', marginBottom: '1rem' }}>Tabla no encontrada en la Base de Datos</h2>
              <p style={{ marginBottom: '1rem' }}>Por favor ejecuta el script SQL provisto en el plan de implementación en tu Supabase SQL Editor para crear la tabla <code>transparencia_documentos</code>.</p>
              <pre style={{ background: '#7f1d1d', color: '#fef2f2', padding: '1rem', borderRadius: '8px', textAlign: 'left', fontSize: '0.85rem', overflowX: 'auto' }}>
{`CREATE TABLE transparencia_documentos (
  id uuid default gen_random_uuid() primary key,
  titulo text not null,
  tipo text not null,
  gestion integer not null,
  archivo_url text not null,
  es_publico boolean default true,
  fecha_publicacion date default CURRENT_DATE,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);`}
              </pre>
            </div>
          </div>
        );
      }
      console.error(error);
      documentos = [];
    }

    // Agrupar por tipo
    const grupos = {};
    for (const tipo of Object.keys(TIPO_LABELS)) {
      grupos[tipo] = (documentos || []).filter(d => d.tipo === tipo);
    }

    return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Transparencia Institucional</h1>
          <p className="adminSubtitle">Administra reportes, auditorías y rendiciones de cuenta.</p>
        </div>
        <Link href={`/admin/transparencia/crear?tipo=${activeTab}`} className="btnPrimary">
          + Nuevo Documento
        </Link>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', marginBottom: '1.5rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>🔍</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>Portal de Transparencia</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Sube los PDFs correspondientes a cada gestión y unidad. Los documentos marcados como <strong>"Públicos"</strong> se listarán automáticamente en la sección Transparencia de la página principal de los ciudadanos.
          </p>
        </div>
      </div>

      {/* Menú de Pestañas (Tabs) */}
      <div style={{ display: 'flex', gap: '0.5rem', overflowX: 'auto', paddingBottom: '0.5rem', marginBottom: '1.5rem' }}>
        {Object.entries(TIPO_LABELS).map(([tipo, config]) => (
          <Link
            key={tipo}
            href={`?tab=${tipo}`}
            style={{
              padding: '0.55rem 1.1rem',
              borderRadius: '20px',
              textDecoration: 'none',
              fontSize: '0.85rem',
              fontWeight: activeTab === tipo ? 700 : 500,
              background: activeTab === tipo ? `${config.color}15` : 'transparent',
              color: activeTab === tipo ? config.color : 'var(--admin-text-muted)',
              border: `1px solid ${activeTab === tipo ? config.color : 'var(--admin-border)'}`,
              whiteSpace: 'nowrap',
              transition: 'all 0.2s ease',
              display: 'flex',
              alignItems: 'center',
              gap: '0.4rem',
              boxShadow: activeTab === tipo ? `0 4px 10px ${config.color}10` : 'none'
            }}
          >
            <span style={{ fontSize: '1rem' }}>{config.emoji}</span> 
            {config.label}
          </Link>
        ))}
      </div>

      {/* Sección Activa */}
      {Object.entries(TIPO_LABELS)
        .filter(([tipo]) => tipo === activeTab)
        .map(([tipo, config]) => {
          const docs = grupos[tipo] || [];
        return (
          <div key={tipo} className="tableCard" style={{ marginBottom: '2rem' }}>
            {/* Cabecera de sección */}
            <div style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              padding: '1.25rem 1.5rem',
              borderBottom: '1px solid var(--admin-border)',
              background: `linear-gradient(90deg, ${config.color}10, transparent)`,
              borderRadius: '12px 12px 0 0',
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                <span style={{ fontSize: '1.5rem', background: `${config.color}18`, padding: '0.5rem', borderRadius: '10px' }}>
                  {config.emoji}
                </span>
                <div>
                  <h2 style={{ fontSize: '1.05rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>
                    {config.label}
                  </h2>
                  <span style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)' }}>
                    {docs.length} documento{docs.length !== 1 ? 's' : ''}
                  </span>
                </div>
              </div>
              <Link
                href={`/admin/transparencia/crear?tipo=${tipo}`}
                style={{
                  fontSize: '0.8rem',
                  fontWeight: 600,
                  color: config.color,
                  border: `1px solid ${config.color}40`,
                  borderRadius: '20px',
                  padding: '0.4rem 0.9rem',
                  textDecoration: 'none',
                  background: `${config.color}0d`,
                  transition: 'all 0.2s'
                }}
              >
                + Agregar
              </Link>
            </div>

            {docs.length === 0 ? (
              <div style={{ textAlign: 'center', padding: '2.5rem', color: 'var(--admin-text-muted)' }}>
                <div style={{ fontSize: '2rem', marginBottom: '0.5rem', opacity: 0.4 }}>{config.emoji}</div>
                <p style={{ fontSize: '0.9rem' }}>No hay documentos de este tipo aún.</p>
              </div>
            ) : (
              <div style={{ overflowX: 'auto' }}>
                <table className="table">
                  <thead>
                    <tr>
                      <th>Gestión</th>
                      <th>Título</th>
                      <th>Fecha</th>
                      <th>Estado</th>
                      <th>Archivo</th>
                      <th>Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    {docs.map(doc => (
                      <tr key={doc.id}>
                        <td><strong style={{ color: config.color, background: `${config.color}10`, padding: '4px 8px', borderRadius: '4px' }}>{doc.gestion}</strong></td>
                        <td style={{ maxWidth: '280px' }}>{doc.titulo}</td>
                        <td style={{ whiteSpace: 'nowrap' }}>
                          {formatFecha(doc.fecha_publicacion)}
                        </td>
                        <td>
                          <span className={`badge ${doc.es_publico ? 'badgeSuccess' : 'badgeWarning'}`}>
                            {doc.es_publico ? 'PÚBLICO' : 'OCULTO'}
                          </span>
                        </td>
                        <td>
                          {doc.archivo_url ? (
                            <a href={doc.archivo_url} target="_blank" rel="noopener noreferrer"
                              style={{ color: 'var(--color-primary)', textDecoration: 'underline', fontSize: '0.85rem' }}>
                              Ver PDF
                            </a>
                          ) : (
                            <span style={{ color: 'var(--admin-text-muted)', fontSize: '0.85rem' }}>Sin archivo</span>
                          )}
                        </td>
                        <td>
                          <div style={{ display: 'flex', gap: '0.4rem', alignItems: 'center' }}>
                            <Link 
                              href={`/admin/transparencia/editar/${doc.id}`}
                              className="btnSecondary" 
                              style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', textDecoration: 'none' }}
                            >
                              Editar
                            </Link>
                            {doc.es_publico ? (
                              <form action={async () => {
                                'use server';
                                const sb = await createClient();
                                await sb.from('transparencia_documentos').update({ es_publico: false }).eq('id', doc.id);
                                revalidatePath('/admin/transparencia');
                                revalidatePath('/transparencia');
                              }}>
                                <button type="submit" className="btnSecondary" style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem' }}>
                                  Ocultar
                                </button>
                              </form>
                            ) : (
                              <form action={async () => {
                                'use server';
                                const sb = await createClient();
                                await sb.from('transparencia_documentos').update({ es_publico: true }).eq('id', doc.id);
                                revalidatePath('/admin/transparencia');
                                revalidatePath('/transparencia');
                              }}>
                                <button type="submit" className="btnSecondary" style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', color: 'var(--color-primary)', border: '1px solid var(--color-primary)' }}>
                                  Publicar
                                </button>
                              </form>
                            )}
                            <form action={async () => {
                              'use server';
                              const sb = await createClient();
                              await sb.from('transparencia_documentos').delete().eq('id', doc.id);
                              revalidatePath('/admin/transparencia');
                            }}>
                              <button type="submit" className="btnSecondary" style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', color: '#ef4444', border: '1px solid #ef444440' }}>
                                Eliminar
                              </button>
                            </form>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        );
      })}
    </div>
  );
  } catch (e) {
    console.error("TRANSAPARENCIA PAGE ERROR:", e);
    return (
      <div style={{ padding: '2rem', color: 'red' }}>
        <h2>Error Server Side</h2>
        <pre>{e.message || JSON.stringify(e)}</pre>
      </div>
    );
  }
}
