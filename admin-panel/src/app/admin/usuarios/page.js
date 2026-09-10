import { createClient } from '@/lib/supabase/server';
import { requireSuperAdmin } from '@/lib/auth';
import Link from 'next/link';

export const metadata = { title: 'Usuarios & Roles — Admin GADOR' };

const ROL_CONFIG = {
  super_admin: { label: 'Super Admin', color: '#E53935', bg: 'rgba(229,57,53,0.12)', border: 'rgba(229,57,53,0.25)' },
  secretaria_admin: { label: 'Admin Secretaría', color: '#3B82F6', bg: 'rgba(59,130,246,0.12)', border: 'rgba(59,130,246,0.25)' },
};

function timeAgo(dateStr) {
  if (!dateStr) return 'Nunca';
  const diff = Date.now() - new Date(dateStr).getTime();
  const days = Math.floor(diff / 86400000);
  if (days === 0) return 'Hoy';
  if (days === 1) return 'Ayer';
  if (days < 30) return `Hace ${days} días`;
  if (days < 365) return `Hace ${Math.floor(days / 30)} meses`;
  return `Hace ${Math.floor(days / 365)} años`;
}

export default async function UsuariosAdminPage() {
  await requireSuperAdmin();
  const supabase = await createClient();

  const { data: usuarios, error } = await supabase
    .from('usuarios_admin')
    .select(`
      id, nombre, apellido, email, cargo, rol, activo,
      avatar_url, last_login, created_at,
      secretarias ( id, nombre_corto, color_acento, icono )
    `)
    .order('created_at', { ascending: false });

  const totalActivos = (usuarios || []).filter(u => u.activo).length;
  const totalSuperAdmin = (usuarios || []).filter(u => u.rol === 'super_admin').length;
  const totalSecAdmin = (usuarios || []).filter(u => u.rol === 'secretaria_admin').length;

  return (
    <div style={{ maxWidth: '1100px', display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
      <style>{`.usuariosRow:hover { background: var(--admin-surface-2); }`}</style>

      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', flexWrap: 'wrap', gap: '1rem' }}>
        <div>
          <h1 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.4rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
            👥 Usuarios & Roles
          </h1>
          <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
            Gestiona los administradores del sistema y sus permisos de acceso.
          </p>
        </div>
        <Link
          href="/admin/usuarios/nuevo"
          style={{
            display: 'inline-flex', alignItems: 'center', gap: '0.4rem',
            padding: '0.6rem 1.25rem', borderRadius: '10px',
            background: 'var(--admin-primary)', color: '#fff',
            fontFamily: 'Outfit, sans-serif', fontWeight: 700, fontSize: '0.85rem',
            textDecoration: 'none', transition: 'all 0.2s',
            boxShadow: '0 4px 14px var(--admin-primary-glow)',
          }}
        >
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Nuevo Administrador
        </Link>
      </div>

      {/* Stats row */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(160px, 1fr))', gap: '1rem' }}>
        {[
          { label: 'Total usuarios', value: usuarios?.length || 0, color: '#6366f1', icon: '👤' },
          { label: 'Activos', value: totalActivos, color: '#10b981', icon: '✅' },
          { label: 'Super Admins', value: totalSuperAdmin, color: '#E53935', icon: '🛡️' },
          { label: 'Admin Secretaría', value: totalSecAdmin, color: '#3B82F6', icon: '🏛️' },
        ].map(stat => (
          <div key={stat.label} style={{
            background: 'var(--admin-surface)', border: '1px solid var(--admin-border)',
            borderTop: `3px solid ${stat.color}`, borderRadius: '12px', padding: '1rem 1.25rem',
          }}>
            <div style={{ fontSize: '1.4rem', marginBottom: '0.4rem' }}>{stat.icon}</div>
            <div style={{ fontSize: '1.6rem', fontWeight: 800, color: 'var(--admin-text)', lineHeight: 1 }}>{stat.value}</div>
            <div style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)', marginTop: '0.2rem' }}>{stat.label}</div>
          </div>
        ))}
      </div>

      {/* Roles info */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
        <div style={{ background: 'var(--admin-surface)', border: '1px solid rgba(229,57,53,0.2)', borderRadius: '12px', padding: '1.25rem' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.75rem' }}>
            <span style={{ fontSize: '1.25rem' }}>🛡️</span>
            <strong style={{ color: '#E53935', fontFamily: 'Outfit, sans-serif' }}>Super Administrador</strong>
          </div>
          <ul style={{ margin: 0, paddingLeft: '1.25rem', color: 'var(--admin-text-muted)', fontSize: '0.8rem', lineHeight: '1.8' }}>
            <li>Acceso total al panel</li>
            <li>Gestiona usuarios y roles</li>
            <li>Accede a todas las secretarías</li>
            <li>Configuración global del sistema</li>
          </ul>
        </div>
        <div style={{ background: 'var(--admin-surface)', border: '1px solid rgba(59,130,246,0.2)', borderRadius: '12px', padding: '1.25rem' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.75rem' }}>
            <span style={{ fontSize: '1.25rem' }}>🏛️</span>
            <strong style={{ color: '#3B82F6', fontFamily: 'Outfit, sans-serif' }}>Admin de Secretaría</strong>
          </div>
          <ul style={{ margin: 0, paddingLeft: '1.25rem', color: 'var(--admin-text-muted)', fontSize: '0.8rem', lineHeight: '1.8' }}>
            <li>Acceso limitado a su secretaría</li>
            <li>Gestiona noticias y documentos propios</li>
            <li>No puede crear otros usuarios</li>
            <li>No ve configuración global</li>
          </ul>
        </div>
      </div>

      {/* Tabla de usuarios */}
      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', overflow: 'hidden' }}>
        <div style={{ padding: '1.25rem 1.5rem', borderBottom: '1px solid var(--admin-border)', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>
            Todos los administradores
          </h2>
          <span style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)' }}>{usuarios?.length || 0} usuarios</span>
        </div>

        {error ? (
          <div style={{ padding: '2rem', textAlign: 'center', color: '#ef4444' }}>
            Error cargando usuarios: {error.message}
          </div>
        ) : !usuarios || usuarios.length === 0 ? (
          <div style={{ padding: '3rem', textAlign: 'center', color: 'var(--admin-text-muted)' }}>
            <div style={{ fontSize: '2.5rem', marginBottom: '0.5rem' }}>👤</div>
            <div style={{ fontWeight: 600 }}>No hay usuarios administradores</div>
            <div style={{ fontSize: '0.78rem', marginTop: '0.25rem' }}>Crea el primer administrador con el botón de arriba.</div>
          </div>
        ) : (
          <div style={{ overflowX: 'auto' }}>
            <table style={{ width: '100%', borderCollapse: 'collapse', fontFamily: 'Inter, sans-serif', fontSize: '0.82rem' }}>
              <thead>
                <tr style={{ background: 'var(--admin-surface-2)' }}>
                  {['Usuario', 'Rol', 'Secretaría', 'Estado', 'Último acceso', 'Acciones'].map(h => (
                    <th key={h} style={{ padding: '0.75rem 1rem', textAlign: 'left', fontWeight: 700, color: 'var(--admin-text-muted)', fontSize: '0.7rem', textTransform: 'uppercase', letterSpacing: '0.5px', borderBottom: '1px solid var(--admin-border)', whiteSpace: 'nowrap' }}>{h}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {usuarios.map((u) => {
                  const iniciales = `${u.nombre?.[0] || ''}${u.apellido?.[0] || u.nombre?.[1] || ''}`.toUpperCase();
                  const rolCfg = ROL_CONFIG[u.rol] || ROL_CONFIG.secretaria_admin;
                  return (
                    <tr
                      key={u.id}
                      className="usuariosRow"
                      style={{ borderBottom: '1px solid var(--admin-border)', transition: 'background 0.15s' }}
                    >
                      {/* Usuario */}
                      <td style={{ padding: '0.875rem 1rem' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                          <div style={{
                            width: 36, height: 36, borderRadius: '10px',
                            background: u.activo ? 'linear-gradient(135deg, #7f0000, #C41E3A)' : 'var(--admin-surface-3)',
                            display: 'flex', alignItems: 'center', justifyContent: 'center',
                            fontSize: '0.72rem', fontWeight: 800, color: '#fff', flexShrink: 0, overflow: 'hidden',
                          }}>
                            {u.avatar_url ? <img src={u.avatar_url} alt={u.nombre} style={{ width: '100%', height: '100%', objectFit: 'cover' }} /> : iniciales}
                          </div>
                          <div>
                            <div style={{ fontWeight: 600, color: 'var(--admin-text)' }}>{u.nombre} {u.apellido || ''}</div>
                            <div style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)' }}>{u.email}</div>
                            {u.cargo && <div style={{ fontSize: '0.68rem', color: 'var(--admin-text-subtle)', fontStyle: 'italic' }}>{u.cargo}</div>}
                          </div>
                        </div>
                      </td>

                      {/* Rol */}
                      <td style={{ padding: '0.875rem 1rem' }}>
                        <span style={{ padding: '3px 10px', borderRadius: '20px', fontSize: '0.72rem', fontWeight: 700, color: rolCfg.color, background: rolCfg.bg, border: `1px solid ${rolCfg.border}` }}>
                          {rolCfg.label}
                        </span>
                      </td>

                      {/* Secretaría */}
                      <td style={{ padding: '0.875rem 1rem' }}>
                        {u.secretarias ? (
                          <span style={{ display: 'inline-flex', alignItems: 'center', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--admin-text)' }}>
                            <span>{u.secretarias.icono}</span>
                            {u.secretarias.nombre_corto}
                          </span>
                        ) : (
                          <span style={{ fontSize: '0.72rem', color: 'var(--admin-text-subtle)', fontStyle: 'italic' }}>Todas</span>
                        )}
                      </td>

                      {/* Estado */}
                      <td style={{ padding: '0.875rem 1rem' }}>
                        <span style={{ padding: '3px 10px', borderRadius: '20px', fontSize: '0.72rem', fontWeight: 700, color: u.activo ? '#10b981' : '#94a3b8', background: u.activo ? 'rgba(16,185,129,0.1)' : 'rgba(148,163,184,0.1)', border: `1px solid ${u.activo ? 'rgba(16,185,129,0.2)' : 'rgba(148,163,184,0.2)'}` }}>
                          {u.activo ? '● Activo' : '○ Inactivo'}
                        </span>
                      </td>

                      {/* Último acceso */}
                      <td style={{ padding: '0.875rem 1rem', color: 'var(--admin-text-muted)', fontSize: '0.78rem', whiteSpace: 'nowrap' }}>
                        {timeAgo(u.last_login)}
                      </td>

                      {/* Acciones */}
                      <td style={{ padding: '0.875rem 1rem' }}>
                        <div style={{ display: 'flex', gap: '0.4rem' }}>
                          <Link
                            href={`/admin/usuarios/editar/${u.id}`}
                            style={{ padding: '0.3rem 0.75rem', borderRadius: '8px', fontSize: '0.75rem', fontWeight: 600, background: 'var(--admin-surface-2)', border: '1px solid var(--admin-border)', color: 'var(--admin-text)', textDecoration: 'none', transition: 'all 0.15s', whiteSpace: 'nowrap' }}
                          >
                            ✏️ Editar
                          </Link>
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
