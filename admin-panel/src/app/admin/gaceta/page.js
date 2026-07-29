import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import { revalidatePath } from 'next/cache';
import styles from './page.module.css';

export const metadata = {
  title: 'Gaceta Oficial — Admin GADOR',
};

// Mapeo de valores DB a etiquetas legibles
const TIPO_LABELS = {
  ley_departamental: { label: 'Leyes Departamentales', emoji: '⚖️', color: '#a80a15' },
  decreto_departamental: { label: 'Decretos Departamentales', emoji: '📄', color: '#1d4ed8' },
  decreto_ejecutivo: { label: 'Decretos Ejecutivos', emoji: '📝', color: '#7c3aed' },
  resolucion_administrativa: { label: 'Resoluciones Administrativas', emoji: '📌', color: '#d97706' },
  resolucion_secretarial: { label: 'Resoluciones Secretariales', emoji: '🗂️', color: '#059669' },
  convenio: { label: 'Convenios', emoji: '🤝', color: '#0891b2' },
  contrato: { label: 'Contratos', emoji: '📋', color: '#64748b' },
  otro: { label: 'Otros', emoji: '📦', color: '#6b7280' },
};

function formatFecha(fechaStr) {
  if (!fechaStr) return '';
  const dateOnly = fechaStr.split('T')[0];
  return new Date(dateOnly + 'T00:00:00').toLocaleDateString('es-BO');
}

export default async function GacetaPage({ searchParams }) {
  const params = await searchParams;
  const activeTab = params?.tab || 'todos';

  const supabase = await createClient();
  
  const { data: documentos } = await supabase
    .from('documentos')
    .select('id, tipo, numero, titulo, fecha_publicacion, es_publico, archivo_url')
    .order('fecha_publicacion', { ascending: false });

  // Agrupar por tipo
  const grupos = {};
  for (const tipo of Object.keys(TIPO_LABELS)) {
    grupos[tipo] = (documentos || []).filter(d => d.tipo === tipo);
  }

  return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Gaceta Oficial</h1>
          <p className="adminSubtitle">Administra leyes, decretos y resoluciones departamentales.</p>
        </div>
        <Link href="/admin/gaceta/crear" className="btnPrimary">
          + Nuevo Documento
        </Link>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', marginBottom: '1.5rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>📜</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>Publicación Oficial</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Los documentos marcados como <strong>"Públicos"</strong> aparecerán automáticamente en la sección <strong>Gaceta Oficial</strong> de la portada. Usa las pestañas de abajo para filtrar por tipo y evitar desplazarte mucho.
          </p>
        </div>
      </div>

      {/* Tabs / Botones de Filtro */}
      <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginBottom: '2rem' }}>
        <Link 
          href="/admin/gaceta" 
          style={{
            padding: '0.5rem 1.2rem', 
            borderRadius: '20px', 
            fontSize: '0.85rem', 
            fontWeight: 700,
            textDecoration: 'none',
            background: activeTab === 'todos' ? 'var(--color-primary)' : 'var(--admin-surface)',
            color: activeTab === 'todos' ? '#fff' : 'var(--admin-text)',
            border: activeTab === 'todos' ? '1px solid var(--color-primary)' : '1px solid var(--admin-border)',
            transition: 'all 0.2s'
          }}
        >
          Ver Todos
        </Link>
        {Object.entries(TIPO_LABELS).map(([tipo, config]) => (
          <Link 
            key={tipo} 
            href={`/admin/gaceta?tab=${tipo}`} 
            style={{
              padding: '0.5rem 1rem', 
              borderRadius: '20px', 
              fontSize: '0.85rem', 
              fontWeight: 600,
              textDecoration: 'none',
              display: 'flex',
              alignItems: 'center',
              gap: '0.4rem',
              background: activeTab === tipo ? config.color : 'var(--admin-surface)',
              color: activeTab === tipo ? '#fff' : 'var(--admin-text)',
              border: activeTab === tipo ? `1px solid ${config.color}` : '1px solid var(--admin-border)',
              transition: 'all 0.2s'
            }}
          >
            <span>{config.emoji}</span> {config.label}
          </Link>
        ))}
      </div>

      {/* Secciones separadas por tipo */}
      {Object.entries(TIPO_LABELS)
        .filter(([tipo]) => activeTab === 'todos' || activeTab === tipo)
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
                href={`/admin/gaceta/crear?tipo=${tipo}`}
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
                      <th>Número</th>
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
                        <td><strong style={{ color: config.color }}>{doc.numero}</strong></td>
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
                              href={`/admin/gaceta/editar/${doc.id}`}
                              className="btnSecondary" 
                              style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', textDecoration: 'none' }}
                            >
                              Editar
                            </Link>
                            {doc.es_publico ? (
                              <form action={async () => {
                                'use server';
                                const sb = await createClient();
                                await sb.from('documentos').update({ es_publico: false, es_gaceta_oficial: false }).eq('id', doc.id);
                                revalidatePath('/admin/gaceta');
                                revalidatePath('/');
                              }}>
                                <button type="submit" className="btnSecondary" style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem' }}>
                                  Ocultar
                                </button>
                              </form>
                            ) : (
                              <form action={async () => {
                                'use server';
                                const sb = await createClient();
                                await sb.from('documentos').update({ es_publico: true, es_gaceta_oficial: true }).eq('id', doc.id);
                                revalidatePath('/admin/gaceta');
                                revalidatePath('/');
                              }}>
                                <button type="submit" className="btnSecondary" style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', color: 'var(--color-primary)', border: '1px solid var(--color-primary)' }}>
                                  Publicar
                                </button>
                              </form>
                            )}
                            <form action={async () => {
                              'use server';
                              const sb = await createClient();
                              await sb.from('documentos').delete().eq('id', doc.id);
                              revalidatePath('/admin/gaceta');
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
}
