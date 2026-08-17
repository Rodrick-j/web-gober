import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import { revalidatePath } from 'next/cache';
import styles from './page.module.css';

export const metadata = {
  title: 'Gaceta Oficial — Admin GADOR',
};

const TIPO_LABELS = {
  ley_departamental:        { label: 'Leyes Departamentales',        emoji: '⚖️',  color: '#a80a15' },
  decreto_departamental:    { label: 'Decretos Departamentales',     emoji: '📄',  color: '#1d4ed8' },
  decreto_ejecutivo:        { label: 'Decretos Ejecutivos',          emoji: '📝',  color: '#7c3aed' },
  resolucion_administrativa:{ label: 'Resoluciones Administrativas', emoji: '📌',  color: '#d97706' },
  resolucion_secretarial:   { label: 'Resoluciones Secretariales',   emoji: '🗂️', color: '#059669' },
  convenio:                 { label: 'Convenios',                    emoji: '🤝',  color: '#0891b2' },
  contrato:                 { label: 'Contratos',                    emoji: '📋',  color: '#64748b' },
  otro:                     { label: 'Otros',                        emoji: '📦',  color: '#6b7280' },
};

function formatFecha(fechaStr) {
  if (!fechaStr) return '';
  return new Date(fechaStr.split('T')[0] + 'T00:00:00').toLocaleDateString('es-BO');
}

function getAnio(fechaStr) {
  if (!fechaStr) return null;
  return String(new Date(fechaStr.split('T')[0] + 'T00:00:00').getFullYear());
}

function chipStyle(active, color) {
  return {
    padding: '0.35rem 0.85rem',
    borderRadius: '20px',
    fontSize: '0.8rem',
    fontWeight: active ? 700 : 500,
    textDecoration: 'none',
    background: active ? color : 'var(--admin-surface)',
    color: active ? '#fff' : 'var(--admin-text)',
    border: active ? `1px solid ${color}` : '1px solid var(--admin-border)',
    transition: 'all 0.2s',
  };
}

export default async function GacetaPage({ searchParams }) {
  const params = await searchParams;
  const activeTab  = params?.tab  || 'todos';
  const activeAnio = params?.anio || 'todos';

  const supabase = await createClient();

  const { data: documentos } = await supabase
    .from('documentos')
    .select('id, tipo, numero, titulo, fecha_publicacion, es_publico, archivo_url')
    .order('fecha_publicacion', { ascending: false })
    .order('created_at', { ascending: false });

  const allDocs = documentos || [];

  // Años disponibles según el tab activo
  const docsParaAnios = activeTab === 'todos' ? allDocs : allDocs.filter(d => d.tipo === activeTab);
  const aniosSet = new Set(docsParaAnios.map(d => getAnio(d.fecha_publicacion)).filter(Boolean));
  const anios = Array.from(aniosSet).sort((a, b) => Number(b) - Number(a));

  // Filtrar según tab y año
  const docsFiltrados = allDocs.filter(d => {
    const matchTab  = activeTab  === 'todos' || d.tipo === activeTab;
    const matchAnio = activeAnio === 'todos' || getAnio(d.fecha_publicacion) === activeAnio;
    return matchTab && matchAnio;
  });

  // Agrupar por tipo
  const grupos = {};
  for (const tipo of Object.keys(TIPO_LABELS)) {
    grupos[tipo] = docsFiltrados.filter(d => d.tipo === tipo);
  }

  // URL helper
  function buildHref(tab, anio) {
    const p = new URLSearchParams();
    if (tab  !== 'todos') p.set('tab',  tab);
    if (anio !== 'todos') p.set('anio', anio);
    const qs = p.toString();
    return qs ? `/admin/gaceta?${qs}` : '/admin/gaceta';
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

      {/* Info banner */}
      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1rem 1.25rem', marginBottom: '1.5rem', display: 'flex', gap: '1rem', alignItems: 'center' }}>
        <div style={{ fontSize: '1.4rem', background: 'var(--admin-surface-2)', padding: '0.6rem', borderRadius: '10px', flexShrink: 0 }}>📜</div>
        <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5', margin: 0 }}>
          Los documentos marcados como <strong>Públicos</strong> aparecen automáticamente en la sección <strong>Gaceta Oficial</strong> de la portada. Filtra por <strong>tipo</strong> y <strong>año</strong> para navegar rápidamente.
        </p>
      </div>

      {/* ---- FILTRO TIPO ---- */}
      <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginBottom: '0.75rem' }}>
        <Link href={buildHref('todos', activeAnio)} style={chipStyle(activeTab === 'todos', 'var(--color-primary)')}>
          Todos los tipos
        </Link>
        {Object.entries(TIPO_LABELS).map(([tipo, cfg]) => (
          <Link key={tipo} href={buildHref(tipo, activeAnio)} style={chipStyle(activeTab === tipo, cfg.color)}>
            <span>{cfg.emoji}</span> {cfg.label}
          </Link>
        ))}
      </div>

      {/* ---- FILTRO AÑO ---- */}
      {anios.length > 0 && (
        <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginBottom: '2rem', alignItems: 'center' }}>
          <span style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--admin-text-muted)', marginRight: '0.25rem' }}>Año:</span>
          <Link href={buildHref(activeTab, 'todos')} style={chipStyle(activeAnio === 'todos', '#475569')}>Todos</Link>
          {anios.map(anio => (
            <Link key={anio} href={buildHref(activeTab, anio)} style={chipStyle(activeAnio === anio, '#475569')}>
              {anio}
            </Link>
          ))}
        </div>
      )}

      {/* ----- SECCIONES POR TIPO ----- */}
      {Object.entries(TIPO_LABELS)
        .filter(([tipo]) => activeTab === 'todos' || activeTab === tipo)
        .map(([tipo, cfg]) => {
          const docs = grupos[tipo] || [];
          const totalTipo = allDocs.filter(d => d.tipo === tipo).length;
          return (
            <div key={tipo} className="tableCard" style={{ marginBottom: '2rem' }}>
              {/* Cabecera */}
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '1rem 1.5rem', borderBottom: '1px solid var(--admin-border)', background: `linear-gradient(90deg, ${cfg.color}12, transparent)`, borderRadius: '12px 12px 0 0', flexWrap: 'wrap', gap: '0.5rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                  <span style={{ fontSize: '1.4rem', background: `${cfg.color}18`, padding: '0.45rem', borderRadius: '8px' }}>{cfg.emoji}</span>
                  <div>
                    <h2 style={{ fontSize: '0.95rem', fontWeight: 800, color: '#fff', background: cfg.color, padding: '0.25rem 0.6rem', borderRadius: '6px', margin: 0, display: 'inline-block' }}>
                      {cfg.label}
                    </h2>
                    <span style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', marginLeft: '0.6rem' }}>
                      {docs.length !== totalTipo
                        ? `${docs.length} de ${totalTipo} docs`
                        : `${docs.length} doc${docs.length !== 1 ? 's' : ''}`}
                    </span>
                  </div>
                </div>
                <Link href={`/admin/gaceta/crear?tipo=${tipo}`} style={{ fontSize: '0.8rem', fontWeight: 600, color: cfg.color, border: `1px solid ${cfg.color}50`, borderRadius: '20px', padding: '0.4rem 0.9rem', textDecoration: 'none', background: `${cfg.color}0f` }}>
                  + Agregar
                </Link>
              </div>

              {docs.length === 0 ? (
                <div style={{ textAlign: 'center', padding: '2.5rem', color: 'var(--admin-text-muted)' }}>
                  <div style={{ fontSize: '2rem', marginBottom: '0.5rem', opacity: 0.4 }}>{cfg.emoji}</div>
                  <p style={{ fontSize: '0.9rem' }}>
                    {activeAnio !== 'todos'
                      ? `No hay documentos de este tipo en ${activeAnio}.`
                      : 'No hay documentos de este tipo aún.'}
                  </p>
                </div>
              ) : (
                <div style={{ overflowX: 'auto' }}>
                  <table className="table">
                    <thead>
                      <tr>
                        <th style={{ width: '90px' }}>Número</th>
                        <th>Título</th>
                        <th style={{ width: '90px' }}>Fecha</th>
                        <th style={{ width: '80px' }}>Estado</th>
                        <th style={{ width: '80px' }}>Archivo</th>
                        <th style={{ width: '160px' }}>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      {docs.map(doc => (
                        <tr key={doc.id}>
                          <td><strong style={{ color: cfg.color, fontSize: '0.82rem' }}>{doc.numero || '—'}</strong></td>
                          <td style={{ fontSize: '0.82rem', fontWeight: 500, maxWidth: '320px' }}>
                            {doc.titulo}
                          </td>
                          <td style={{ whiteSpace: 'nowrap', fontSize: '0.82rem' }}>{formatFecha(doc.fecha_publicacion)}</td>
                          <td>
                            <span className={`badge ${doc.es_publico ? 'badgeSuccess' : 'badgeWarning'}`}>
                              {doc.es_publico ? 'PÚBLICO' : 'OCULTO'}
                            </span>
                          </td>
                          <td>
                            {doc.archivo_url ? (
                              <a href={doc.archivo_url} target="_blank" rel="noopener noreferrer"
                                style={{ color: 'var(--color-primary)', textDecoration: 'underline', fontSize: '0.82rem' }}>
                                Ver PDF
                              </a>
                            ) : (
                              <span style={{ color: 'var(--admin-text-muted)', fontSize: '0.82rem' }}>Sin archivo</span>
                            )}
                          </td>
                          <td>
                            <div style={{ display: 'flex', gap: '0.4rem', alignItems: 'center' }}>
                              <Link href={`/admin/gaceta/editar/${doc.id}`} className="btnSecondary"
                                style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', textDecoration: 'none' }}>
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
                                  <button type="submit" className="btnSecondary"
                                    style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', color: 'var(--color-primary)', border: '1px solid var(--color-primary)' }}>
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
                                <button type="submit" className="btnSecondary"
                                  style={{ padding: '0.3rem 0.7rem', fontSize: '0.75rem', color: '#ef4444', border: '1px solid #ef444440' }}>
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
