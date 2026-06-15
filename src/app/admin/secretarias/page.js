import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';

export const metadata = { title: 'Secretarías — Admin GADOR' };

export default async function SecretariasAdminPage() {
  const supabase = await createClient();

  const { data: secretarias, error } = await supabase
    .from('secretarias')
    .select('*')
    .order('orden', { ascending: true });

  if (error) {
    return (
      <div style={{ padding: '2rem' }}>
        <h1 style={{ color: '#F87171', fontFamily: "'Outfit',sans-serif" }}>Error cargando Secretarías</h1>
        <p style={{ color: '#64748B', marginTop: '0.5rem' }}>{error.message}</p>
      </div>
    );
  }

  return (
    <div style={{ maxWidth: '1200px', display: 'flex', flexDirection: 'column', gap: '1.5rem', animation: 'fadeInUp 0.4s ease forwards' }}>

      {/* Header */}
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '1rem' }}>
        <div>
          <h1 style={{ fontFamily: "'Outfit',sans-serif", fontSize: '1.35rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
            Secretarías Departamentales
          </h1>
          <p style={{ color: 'var(--admin-text-muted)', marginTop: '0.25rem', fontSize: '0.8rem' }}>
            Gestiona las 10 secretarías — autoridades, contacto y configuración de marca.
          </p>
        </div>
        <div style={{ display: 'flex', gap: '0.75rem', flexShrink: 0 }}>
          <span style={{
            display: 'inline-flex', alignItems: 'center', gap: '0.4rem',
            background: 'var(--admin-success-bg, rgba(16,185,129,0.12))', color: 'var(--admin-success)',
            border: '1px solid var(--admin-success-border, rgba(16,185,129,0.2))',
            padding: '0.4rem 0.875rem', borderRadius: '8px',
            fontSize: '0.78rem', fontWeight: 600,
          }}>
            ● {secretarias?.length || 0} secretarías activas
          </span>
        </div>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>🏛️</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>¿Qué controla esta sección?</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Aquí puedes personalizar la <strong>información pública de cada Secretaría</strong>. Los cambios aplicados aquí modifican el menú de navegación de la página principal, los colores de su portal individual y la tarjeta de presentación de la máxima autoridad de cada área.
          </p>
        </div>
      </div>

      {/* Cards Grid */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fill, minmax(340px, 1fr))',
        gap: '1rem',
      }}>
        {secretarias?.map((sec) => (
          <div key={sec.id} style={{
            background: 'var(--admin-surface)',
            border: '1px solid var(--admin-border)',
            borderRadius: '14px',
            overflow: 'hidden',
            transition: 'all 0.2s',
            display: 'flex',
            flexDirection: 'column',
          }}>
            {/* Card color top stripe */}
            <div style={{
              height: '4px',
              background: sec.color_acento || '#C1272D',
              boxShadow: `0 0 12px ${sec.color_acento || '#C1272D'}66`,
            }} />

            <div style={{ padding: '1.25rem', display: 'flex', flexDirection: 'column', gap: '1rem', flex: 1 }}>

              {/* Top Row: icon + name + status */}
              <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.875rem' }}>
                <div style={{
                  width: 44, height: 44,
                  borderRadius: '12px',
                  background: `${sec.color_acento || '#C1272D'}20`,
                  border: `1px solid ${sec.color_acento || '#C1272D'}30`,
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontSize: '1.4rem', flexShrink: 0,
                }}>
                  {sec.icono || '🏛️'}
                </div>
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{ fontFamily: "'Outfit',sans-serif", fontWeight: 700, fontSize: '0.9rem', color: 'var(--admin-text)', lineHeight: 1.3 }}>
                    {sec.nombre_corto}
                  </div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)', marginTop: '2px', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                    {sec.nombre}
                  </div>
                </div>
                <span style={{
                  padding: '0.25rem 0.625rem',
                  borderRadius: '20px',
                  fontSize: '0.65rem',
                  fontWeight: 700,
                  background: sec.activo ? 'rgba(16,185,129,0.12)' : 'rgba(100,116,139,0.12)',
                  color: sec.activo ? '#34D399' : '#94A3B8',
                  border: `1px solid ${sec.activo ? 'rgba(16,185,129,0.2)' : 'rgba(100,116,139,0.2)'}`,
                  whiteSpace: 'nowrap',
                }}>
                  {sec.activo ? '● Activa' : '● Inactiva'}
                </span>
              </div>

              {/* Secretary info */}
              <div style={{
                background: 'var(--admin-surface-2)',
                borderRadius: '10px',
                padding: '0.875rem',
                display: 'flex', alignItems: 'center', gap: '0.75rem',
                border: '1px solid var(--admin-border)',
              }}>
                <div style={{
                  width: 36, height: 36, borderRadius: '10px',
                  background: `linear-gradient(135deg, ${sec.color_acento || '#C1272D'}, ${sec.color_acento || '#C1272D'}88)`,
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontSize: '0.75rem', fontWeight: 800, color: 'white', flexShrink: 0,
                }}>
                  {sec.secretario_nombre?.[0] || '?'}
                </div>
                <div style={{ minWidth: 0 }}>
                  {sec.secretario_nombre ? (
                    <>
                      <div style={{ fontSize: '0.8rem', fontWeight: 600, color: 'var(--admin-text)', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                        {sec.secretario_nombre}
                      </div>
                      <div style={{ fontSize: '0.7rem', color: 'var(--admin-text-muted)', marginTop: '1px' }}>
                        {sec.secretario_cargo || 'Secretario/a Departamental'}
                      </div>
                    </>
                  ) : (
                    <span style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', fontStyle: 'italic' }}>Sin secretario/a asignado/a</span>
                  )}
                </div>
              </div>

              {/* Contact Info */}
              {(sec.telefono || sec.email) && (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem' }}>
                  {sec.telefono && (
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', fontSize: '0.75rem', color: '#94A3B8' }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.11 7.18a2 2 0 0 1 2-2.18h3a2 2 0 0 1 2 1.72A12.84 12.84 0 0 0 12.7 9a2 2 0 0 1-.45 2.11L11 12.27a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                      {sec.telefono}
                    </div>
                  )}
                  {sec.email && (
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', fontSize: '0.75rem', color: '#94A3B8' }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                      {sec.email}
                    </div>
                  )}
                </div>
              )}

              {/* Color swatch */}
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                  <div style={{
                    width: 16, height: 16, borderRadius: '4px',
                    background: sec.color_acento || '#C1272D',
                    border: '1px solid rgba(255,255,255,0.1)',
                    boxShadow: `0 0 8px ${sec.color_acento || '#C1272D'}66`,
                  }} />
                  <span style={{ fontSize: '0.68rem', color: '#475569', fontFamily: 'monospace' }}>
                    {sec.color_acento || '#C1272D'}
                  </span>
                </div>
                <Link
                  href={`/admin/secretarias/editar/${sec.id}`}
                  style={{
                    display: 'inline-flex', alignItems: 'center', gap: '0.35rem',
                    background: 'var(--admin-surface-2)',
                    color: 'var(--admin-text)',
                    border: '1px solid var(--admin-border)',
                    padding: '0.4rem 0.875rem',
                    borderRadius: '8px',
                    fontSize: '0.75rem',
                    fontWeight: 600,
                    textDecoration: 'none',
                    transition: 'all 0.2s',
                  }}
                >
                  <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                  Editar
                </Link>
              </div>
            </div>
          </div>
        ))}

        {(!secretarias || secretarias.length === 0) && (
          <div style={{
            gridColumn: '1 / -1', textAlign: 'center', padding: '4rem',
            background: 'var(--admin-surface)', borderRadius: '14px',
            border: '1px solid var(--admin-border)', color: '#64748B',
          }}>
            <div style={{ fontSize: '2.5rem', marginBottom: '1rem' }}>🏛️</div>
            <div style={{ fontWeight: 600, marginBottom: '0.5rem', color: '#94A3B8' }}>No hay secretarías registradas</div>
            <div style={{ fontSize: '0.82rem' }}>Ejecuta el script <code style={{ background: 'var(--admin-surface-2)', padding: '0.2rem 0.4rem', borderRadius: '4px' }}>09_seed_secretarias.sql</code></div>
          </div>
        )}
      </div>
    </div>
  );
}
