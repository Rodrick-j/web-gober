import { createClient } from '@/lib/supabase/server';
import { getAdminUser } from '@/lib/auth';

export const metadata = { title: 'Estadísticas — Admin GADOR' };

async function safeCount(supabase, table, filters = {}) {
  try {
    let q = supabase.from(table).select('*', { count: 'exact', head: true });
    Object.entries(filters).forEach(([col, val]) => { q = q.eq(col, val); });
    const { count } = await q;
    return count || 0;
  } catch { return 0; }
}

export default async function EstadisticasPage() {
  const { perfil } = await getAdminUser();
  const supabase = await createClient();
  const esSuperAdmin = perfil.rol === 'super_admin';

  // Conteos en paralelo
  const [
    totalNoticias,
    noticiasPublicadas,
    totalGaceta,
    totalTransparencia,
    totalCarrusel,
    totalUsuarios,
    usuariosActivos,
    totalSecretarias,
  ] = await Promise.all([
    safeCount(supabase, 'noticias'),
    safeCount(supabase, 'noticias', { publicado: true }),
    safeCount(supabase, 'gaceta_documentos'),
    safeCount(supabase, 'transparencia_documentos'),
    safeCount(supabase, 'carrusel_items'),
    esSuperAdmin ? safeCount(supabase, 'usuarios_admin') : Promise.resolve(null),
    esSuperAdmin ? safeCount(supabase, 'usuarios_admin', { activo: true }) : Promise.resolve(null),
    safeCount(supabase, 'secretarias', { activo: true }),
  ]);

  // Últimas 5 noticias
  const { data: ultimasNoticias } = await supabase
    .from('noticias')
    .select('id, titulo, publicado, created_at, secretarias(nombre_corto, color_acento)')
    .order('created_at', { ascending: false })
    .limit(5);

  const statCards = [
    { label: 'Noticias totales', value: totalNoticias, sub: `${noticiasPublicadas} publicadas`, color: '#6366f1', icon: '📰', href: '/admin/noticias' },
    { label: 'Gaceta Oficial', value: totalGaceta, sub: 'documentos', color: '#f59e0b', icon: '📋', href: '/admin/gaceta' },
    { label: 'Transparencia', value: totalTransparencia, sub: 'documentos', color: '#10b981', icon: '🔍', href: '/admin/transparencia' },
    { label: 'Slides carrusel', value: totalCarrusel, sub: 'activos en inicio', color: '#0ea5e9', icon: '🖼️', href: '/admin/carrusel' },
    { label: 'Secretarías', value: totalSecretarias, sub: 'activas', color: '#8b0000', icon: '🏛️', href: '/admin/secretarias' },
    ...(esSuperAdmin ? [{ label: 'Administradores', value: totalUsuarios, sub: `${usuariosActivos} activos`, color: '#E53935', icon: '👥', href: '/admin/usuarios' }] : []),
  ];

  function timeAgo(dateStr) {
    if (!dateStr) return '';
    const diff = Date.now() - new Date(dateStr).getTime();
    const hours = Math.floor(diff / 3600000);
    if (hours < 1) return 'Hace menos de 1h';
    if (hours < 24) return `Hace ${hours}h`;
    const days = Math.floor(diff / 86400000);
    if (days < 30) return `Hace ${days} días`;
    return `Hace ${Math.floor(days / 30)} meses`;
  }

  return (
    <div style={{ maxWidth: '1100px', display: 'flex', flexDirection: 'column', gap: '1.75rem' }}>
      <style>{`.statCardHover:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(0,0,0,0.12); }`}</style>

      {/* Header */}
      <div>
        <h1 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.4rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
          📊 Estadísticas del Sistema
        </h1>
        <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
          Resumen de contenido y actividad en el portal del GADOR Oruro.
        </p>
      </div>

      {/* Stat cards */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(180px, 1fr))', gap: '1rem' }}>
        {statCards.map(stat => (
          <a
            key={stat.label}
            href={stat.href}
            className="statCardHover"
            style={{
              background: 'var(--admin-surface)', border: '1px solid var(--admin-border)',
              borderTop: `3px solid ${stat.color}`, borderRadius: '14px', padding: '1.25rem 1.5rem',
              textDecoration: 'none', display: 'block', transition: 'all 0.2s', cursor: 'pointer',
            }}
          >
            <div style={{ fontSize: '1.75rem', marginBottom: '0.5rem' }}>{stat.icon}</div>
            <div style={{ fontSize: '2rem', fontWeight: 900, color: 'var(--admin-text)', lineHeight: 1, fontFamily: 'Outfit, sans-serif' }}>
              {stat.value ?? '—'}
            </div>
            <div style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', marginTop: '0.25rem', fontWeight: 600 }}>{stat.label}</div>
            {stat.sub && <div style={{ fontSize: '0.68rem', color: stat.color, fontWeight: 700, marginTop: '0.2rem' }}>{stat.sub}</div>}
          </a>
        ))}
      </div>

      {/* Actividad reciente */}
      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', overflow: 'hidden' }}>
        <div style={{ padding: '1.25rem 1.5rem', borderBottom: '1px solid var(--admin-border)', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>
            🕐 Últimas noticias publicadas
          </h2>
          <a href="/admin/noticias" style={{ fontSize: '0.75rem', color: 'var(--admin-primary)', textDecoration: 'none', fontWeight: 600 }}>Ver todas →</a>
        </div>

        {!ultimasNoticias || ultimasNoticias.length === 0 ? (
          <div style={{ padding: '2rem', textAlign: 'center', color: 'var(--admin-text-muted)', fontSize: '0.85rem' }}>
            No hay noticias aún.
          </div>
        ) : (
          <div style={{ display: 'flex', flexDirection: 'column' }}>
            {ultimasNoticias.map((n, i) => (
              <div
                key={n.id}
                style={{
                  padding: '0.875rem 1.5rem',
                  borderBottom: i < ultimasNoticias.length - 1 ? '1px solid var(--admin-border)' : 'none',
                  display: 'flex', alignItems: 'center', gap: '1rem',
                }}
              >
                <div style={{
                  width: 8, height: 8, borderRadius: '50%', flexShrink: 0,
                  background: n.publicado ? '#10b981' : '#94a3b8',
                  boxShadow: n.publicado ? '0 0 8px #10b98180' : 'none',
                }} />
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{ fontSize: '0.85rem', fontWeight: 600, color: 'var(--admin-text)', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                    {n.titulo}
                  </div>
                  <div style={{ display: 'flex', gap: '0.5rem', marginTop: '0.2rem', alignItems: 'center' }}>
                    {n.secretarias && (
                      <span style={{ fontSize: '0.68rem', color: n.secretarias.color_acento || '#94a3b8', fontWeight: 700 }}>
                        {n.secretarias.nombre_corto}
                      </span>
                    )}
                    <span style={{ fontSize: '0.68rem', color: 'var(--admin-text-subtle)' }}>·</span>
                    <span style={{ fontSize: '0.68rem', color: 'var(--admin-text-muted)' }}>{timeAgo(n.created_at)}</span>
                  </div>
                </div>
                <span style={{
                  padding: '2px 8px', borderRadius: '20px', fontSize: '0.65rem', fontWeight: 700, whiteSpace: 'nowrap',
                  color: n.publicado ? '#10b981' : '#94a3b8',
                  background: n.publicado ? 'rgba(16,185,129,0.1)' : 'rgba(148,163,184,0.1)',
                }}>
                  {n.publicado ? 'Publicado' : 'Borrador'}
                </span>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Info módulos */}
      <div style={{ background: 'var(--admin-surface-2)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem 1.5rem', fontSize: '0.8rem', color: 'var(--admin-text-muted)', lineHeight: '1.7' }}>
        💡 <strong>Tip:</strong> Haz clic en cualquier tarjeta de estadística para ir directamente al módulo correspondiente y gestionar el contenido.
      </div>
    </div>
  );
}
