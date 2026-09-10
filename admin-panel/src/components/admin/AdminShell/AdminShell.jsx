'use client';
import { useState, useEffect } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { usePathname, useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import styles from './AdminShell.module.css';

// ── GRUPOS DE NAVEGACIÓN ──────────────────────────────
// Cada grupo tiene: id, label, icon, items[], soloSuperAdmin?
const buildNavGroups = () => [
  {
    id: 'general',
    label: null, // sin label = item suelto arriba
    items: [
      {
        href: '/admin',
        label: 'Dashboard',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/>
            <rect x="14" y="14" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'estadisticas',
    label: null,
    items: [
      {
        href: '/admin/estadisticas',
        label: 'Estadísticas',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/>
            <line x1="6" y1="20" x2="6" y2="14"/><line x1="2" y1="20" x2="22" y2="20"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'comunicacion',
    label: 'Comunicación',
    emoji: '📢',
    items: [
      {
        href: '/admin/noticias',
        label: 'Noticias',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/>
            <path d="M18 14h-8"/><path d="M10 6h8v4h-8V6Z"/>
          </svg>
        ),
      },
      {
        href: '/admin/carrusel',
        label: 'Carrusel',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <rect x="2" y="7" width="20" height="14" rx="2"/>
            <path d="M16 3H8"/><path d="m8 11 4 4 4-4"/>
          </svg>
        ),
      },
      {
        href: '/admin/publicaciones',
        label: 'Publicaciones',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/>
          </svg>
        ),
      },
      {
        href: '/admin/solicitudes',
        label: 'Solicitudes Ciudadanas',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M22 12h-6l-2 3h-4l-2-3H2"/>
            <path d="M5.45 5.11 2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'documentos',
    label: 'Documentos Públicos',
    emoji: '📄',
    items: [
      {
        href: '/admin/gaceta',
        label: 'Gaceta Oficial',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
            <polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/>
            <line x1="16" y1="17" x2="8" y2="17"/><line x1="10" y1="9" x2="8" y2="9"/>
          </svg>
        ),
      },
      {
        href: '/admin/transparencia',
        label: 'Transparencia',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'planificacion',
    label: 'Planificación',
    emoji: '📊',
    items: [
      {
        href: '/admin/poa',
        label: 'POA',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/>
            <line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'institucion',
    label: 'Institución',
    emoji: '🏛️',
    items: [
      {
        href: '/admin/secretarias',
        label: 'Secretarías',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
            <polyline points="9 22 9 12 15 12 15 22"/>
          </svg>
        ),
      },
      {
        href: '/admin/contenido-institucional',
        label: 'Contenido Institucional',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4Z"/>
          </svg>
        ),
      },
      {
        href: '/admin/autoridades',
        label: 'Autoridades',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
            <path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
        ),
      },
      {
        href: '/admin/contrataciones',
        label: 'Contrataciones',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/>
            <rect x="8" y="2" width="8" height="4" rx="1"/><path d="m9 14 2 2 4-4"/>
          </svg>
        ),
      },
      {
        href: '/admin/institucion-documentos',
        label: 'Docs. Institución',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
            <polyline points="14 2 14 8 20 8"/>
            <line x1="16" y1="13" x2="8" y2="13"/>
            <line x1="16" y1="17" x2="8" y2="17"/>
            <line x1="10" y1="9" x2="8" y2="9"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'usuarios',
    label: 'Usuarios & Roles',
    emoji: '👥',
    soloSuperAdmin: true,
    items: [
      {
        href: '/admin/usuarios',
        label: 'Administradores',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
        ),
      },
    ],
  },
  {
    id: 'sistema',
    label: 'Sistema',
    emoji: '⚙️',
    soloSuperAdmin: true,
    items: [
      {
        href: '/admin/configuracion',
        label: 'Configuración',
        icon: (
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <circle cx="12" cy="12" r="3"/>
            <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/>
          </svg>
        ),
      },
    ],
  },
];

// Todos los items aplanados para el breadcrumb
const allNavItems = buildNavGroups().flatMap(g => g.items);

export default function AdminShell({ perfil, secretarias, children }) {
  const pathname = usePathname();
  const router = useRouter();
  const [logging, setLogging] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [collapsed, setCollapsed] = useState(false);
  const [isDarkMode, setIsDarkMode] = useState(true);
  // Grupos colapsados: array de ids de grupos cerrados
  const [closedGroups, setClosedGroups] = useState([]);

  const esSuperAdmin = perfil?.rol === 'super_admin';
  const nombreMostrar = perfil ? `${perfil.nombre}${perfil.apellido ? ' ' + perfil.apellido : ''}` : 'Admin';
  const iniciales = perfil ? `${perfil.nombre?.[0] || ''}${perfil.apellido?.[0] || perfil.nombre?.[1] || ''}`.toUpperCase() : 'AD';

  // Cargar preferencias guardadas
  useEffect(() => {
    const preferenceFrame = window.requestAnimationFrame(() => {
      try {
        const saved = localStorage.getItem('admin-closed-groups');
        if (saved) setClosedGroups(JSON.parse(saved));
        const savedTheme = localStorage.getItem('admin-theme');
        if (savedTheme) setIsDarkMode(savedTheme === 'dark');
        const savedCollapsed = localStorage.getItem('admin-sidebar-collapsed');
        if (savedCollapsed) setCollapsed(savedCollapsed === 'true');
      } catch { /* ignore */ }
    });

    return () => window.cancelAnimationFrame(preferenceFrame);
  }, []);

  useEffect(() => {
    document.documentElement.setAttribute('data-admin-theme', isDarkMode ? 'dark' : 'light');
    try { localStorage.setItem('admin-theme', isDarkMode ? 'dark' : 'light'); } catch { /* ignore */ }
  }, [isDarkMode]);

  useEffect(() => {
    try { localStorage.setItem('admin-sidebar-collapsed', String(collapsed)); } catch { /* ignore */ }
  }, [collapsed]);

  // Cerrar sidebar mobile al cambiar de ruta
  useEffect(() => {
    const closeFrame = window.requestAnimationFrame(() => setMobileOpen(false));
    return () => window.cancelAnimationFrame(closeFrame);
  }, [pathname]);

  const handleLogout = async () => {
    setLogging(true);
    const supabase = createClient();
    await supabase.auth.signOut();
    router.push('/admin/login');
    router.refresh();
  };

  const isActive = (href) => {
    if (href === '/admin') return pathname === '/admin';
    return pathname.startsWith(href);
  };

  const toggleGroup = (groupId) => {
    setClosedGroups(prev => {
      const next = prev.includes(groupId)
        ? prev.filter(g => g !== groupId)
        : [...prev, groupId];
      try { localStorage.setItem('admin-closed-groups', JSON.stringify(next)); } catch { /* ignore */ }
      return next;
    });
  };

  const navGroups = buildNavGroups();
  // Contexto de la ruta actual para el encabezado.
  const currentPage = allNavItems.find(item => isActive(item.href));
  const currentGroup = navGroups.find(group => group.items.some(item => isActive(item.href)));
  const roleLabel = esSuperAdmin
    ? 'Super Administrador'
    : perfil?.secretarias?.nombre_corto || 'Secretaría';

  return (
    <div className={`${styles.shell} ${isDarkMode ? styles.dark : styles.light}`}>

      {/* ── MOBILE OVERLAY ── */}
      {mobileOpen && (
        <button
          className={styles.overlay}
          onClick={() => setMobileOpen(false)}
          aria-label="Cerrar menú lateral"
        />
      )}

      {/* ── SIDEBAR ── */}
      <aside
        className={`${styles.sidebar} ${mobileOpen ? styles.mobileOpen : ''} ${collapsed ? styles.collapsed : ''}`}
        aria-label="Panel de administración"
      >
        <div className={styles.sidebarAura} aria-hidden="true" />

        {/* Brand */}
        <div className={styles.brand}>
          <div className={styles.brandIcon}>
            <Image src="/escudo_oruro.jpg" alt="Escudo GADOR" width={48} height={48} priority />
          </div>
          {!collapsed && (
            <div className={styles.brandCopy}>
              <div className={styles.brandName}>GADOR <span>Admin</span></div>
              <div className={styles.brandSub}>Gestión institucional</div>
            </div>
          )}
          {!collapsed && (
            <span className={styles.brandSignal} aria-label="Sistema en línea" title="Sistema en línea">
              <span />
              <span />
              <span />
            </span>
          )}
          <button className={styles.closeSidebar} onClick={() => setMobileOpen(false)} aria-label="Cerrar menú">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
              <path d="m6 6 12 12M18 6 6 18" />
            </svg>
          </button>
        </div>

        {/* Rol badge */}
        {!collapsed && (
          <div className={styles.rolBadge}>
            <span className={styles.rolIndicator} aria-hidden="true" />
            <span className={styles.rolText}>{roleLabel}</span>
            <span className={styles.rolStatus}>Activo</span>
          </div>
        )}

        {/* Navigation */}
        <nav className={styles.nav} aria-label="Navegación principal">
          {navGroups.map((group) => {
            // Filtrar grupos de super admin
            if (group.soloSuperAdmin && !esSuperAdmin) return null;

            const isGroupClosed = closedGroups.includes(group.id);
            const hasActiveItem = group.items.some(item => isActive(item.href));

            // Grupos sin label (items sueltos)
            if (!group.label) {
              return group.items.map((item) => (
                <Link
                  key={item.href}
                  href={item.href}
                  className={`${styles.navItem} ${isActive(item.href) ? styles.active : ''} ${collapsed ? styles.navItemCollapsed : ''}`}
                  title={collapsed ? item.label : undefined}
                  aria-current={isActive(item.href) ? 'page' : undefined}
                >
                  <span className={styles.navIcon}>{item.icon}</span>
                  {!collapsed && <span className={styles.navItemLabel}>{item.label}</span>}
                </Link>
              ));
            }

            // Grupos con label (colapsables)
            return (
              <div key={group.id} className={styles.navGroup}>
                {!collapsed ? (
                  <button
                    className={`${styles.navGroupHeader} ${hasActiveItem ? styles.navGroupHeaderActive : ''}`}
                    onClick={() => toggleGroup(group.id)}
                    aria-expanded={!isGroupClosed}
                  >
                    <span className={styles.navGroupMarker} aria-hidden="true"><span /></span>
                    <span className={styles.navGroupLabel}>{group.label}</span>
                    <svg
                      className={`${styles.navGroupChevron} ${isGroupClosed ? styles.navGroupChevronClosed : ''}`}
                      width="12" height="12" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" strokeWidth="2.5"
                    >
                      <polyline points="6 9 12 15 18 9"/>
                    </svg>
                  </button>
                ) : (
                  // En modo collapsed: mostrar divisor en vez del header
                  <div className={styles.navDividerCollapsed} title={group.label} />
                )}

                {/* Items del grupo */}
                {(!isGroupClosed || collapsed) && (
                  <div className={`${styles.navGroupItems} ${!collapsed ? styles.navGroupItemsExpanded : ''}`}>
                    {group.items.map((item) => (
                      <Link
                        key={item.href}
                        href={item.href}
                        className={`${styles.navItem} ${!collapsed ? styles.navItemIndented : ''} ${isActive(item.href) ? styles.active : ''} ${collapsed ? styles.navItemCollapsed : ''}`}
                        title={collapsed ? item.label : undefined}
                        aria-current={isActive(item.href) ? 'page' : undefined}
                      >
                        <span className={styles.navIcon}>{item.icon}</span>
                        {!collapsed && <span className={styles.navItemLabel}>{item.label}</span>}
                      </Link>
                    ))}
                  </div>
                )}
              </div>
            );
          })}
        </nav>

        {/* Footer */}
        <div className={styles.sidebarFooter}>
          {!collapsed && (
            <div className={styles.userInfo}>
              <div className={styles.avatar}>
                {perfil?.avatar_url ? (
                  <Image src={perfil.avatar_url} alt={nombreMostrar} width={38} height={38} />
                ) : iniciales}
              </div>
              <div className={styles.userText}>
                <div className={styles.userName}>{nombreMostrar}</div>
                <div className={styles.userEmail}>{perfil?.cargo || perfil?.email}</div>
              </div>
            </div>
          )}
          <button
            className={styles.logoutBtn}
            onClick={handleLogout}
            disabled={logging}
            id="admin-logout-btn"
            title={collapsed ? 'Cerrar sesión' : undefined}
          >
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
              <polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/>
            </svg>
            {!collapsed && (logging ? 'Cerrando sesión...' : 'Cerrar sesión')}
          </button>
        </div>
      </aside>

      {/* ── MAIN AREA ── */}
      <div className={styles.main}>

        {/* Topbar */}
        <header className={styles.topbar}>
          <div className={styles.topbarGlow} aria-hidden="true" />
          <button
            className={styles.menuToggle}
            onClick={() => {
              if (typeof window !== 'undefined' && window.innerWidth <= 900) {
                setMobileOpen(v => !v);
              } else {
                setCollapsed(v => !v);
              }
            }}
            aria-label={collapsed ? 'Expandir menú lateral' : 'Contraer menú lateral'}
            aria-expanded={!collapsed}
          >
            <svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <line x1="4" y1="7" x2="20" y2="7"/><line x1="4" y1="12" x2="15" y2="12"/><line x1="4" y1="17" x2="20" y2="17"/>
            </svg>
          </button>

          {/* Breadcrumb */}
          <div className={styles.pageContext}>
            <span className={styles.pageEyebrow}>{currentGroup?.label || 'Vista general'}</span>
            <div className={styles.pageTitleRow}>
              <span className={styles.pageAccent} aria-hidden="true" />
              <strong className={styles.pageTitle}>{currentPage?.label || 'Panel de control'}</strong>
            </div>
          </div>

          <div className={styles.topbarRight}>
            {/* Theme toggle */}
            <button
              className={styles.themeToggle}
              onClick={() => setIsDarkMode(v => !v)}
              title={isDarkMode ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro'}
              aria-label={isDarkMode ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro'}
              aria-pressed={isDarkMode}
            >
              {isDarkMode ? (
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
              ) : (
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
              )}
            </button>

            {/* View site */}
            <Link href="/" target="_blank" rel="noopener noreferrer" className={styles.topbarLink}>
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
              <span>Ver sitio</span>
            </Link>

            {/* Avatar */}
            <div className={styles.topbarUser} title={nombreMostrar}>
              <div className={styles.topbarAvatar}>{iniciales}</div>
              <div className={styles.topbarUserCopy}>
                <strong>{nombreMostrar}</strong>
                <span>{roleLabel}</span>
              </div>
            </div>
          </div>
        </header>

        {/* Page content */}
        <main className={styles.content}>
          {children}
        </main>
      </div>
    </div>
  );
}
