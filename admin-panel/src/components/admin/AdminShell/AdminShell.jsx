'use client';
import { useState, useEffect } from 'react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import styles from './AdminShell.module.css';

const navPrincipal = [
  {
    href: '/admin',
    label: 'Dashboard',
    icon: (
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/>
        <rect x="14" y="14" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/>
      </svg>
    )
  },
  {
    href: '/admin/noticias',
    label: 'Noticias',
    icon: (
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/>
        <path d="M18 14h-8"/><path d="M10 6h8v4h-8V6Z"/>
      </svg>
    )
  },
  {
    href: '/admin/gaceta',
    label: 'Gaceta Oficial',
    icon: (
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
        <polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/>
        <line x1="16" y1="17" x2="8" y2="17"/><line x1="10" y1="9" x2="8" y2="9"/>
      </svg>
    )
  },
  {
    href: '/admin/carrusel',
    label: 'Carrusel',
    icon: (
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <rect x="2" y="7" width="20" height="14" rx="2"/>
        <path d="M16 3H8"/><path d="m8 11 4 4 4-4"/>
      </svg>
    )
  },
];

const navAdmin = [
  {
    href: '/admin/secretarias',
    label: 'Secretarías',
    soloSuperAdmin: false,
    icon: (
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
        <polyline points="9 22 9 12 15 12 15 22"/>
      </svg>
    )
  },
  {
    href: '/admin/configuracion',
    label: 'Configuración',
    soloSuperAdmin: true,
    icon: (
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <circle cx="12" cy="12" r="3"/>
        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/>
      </svg>
    )
  },
];

export default function AdminShell({ perfil, secretarias, children }) {
  const pathname = usePathname();
  const router = useRouter();
  const [logging, setLogging] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [collapsed, setCollapsed] = useState(false);
  const [isDarkMode, setIsDarkMode] = useState(true);

  const esSuperAdmin = perfil?.rol === 'super_admin';
  const nombreMostrar = perfil ? `${perfil.nombre}${perfil.apellido ? ' ' + perfil.apellido : ''}` : 'Admin';
  const iniciales = perfil ? `${perfil.nombre?.[0] || ''}${perfil.apellido?.[0] || perfil.nombre?.[1] || ''}`.toUpperCase() : 'AD';

  useEffect(() => {
    document.documentElement.setAttribute('data-admin-theme', isDarkMode ? 'dark' : 'light');
  }, [isDarkMode]);

  // Close mobile sidebar on route change
  useEffect(() => { setMobileOpen(false); }, [pathname]);

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

  // Build current page label for breadcrumb
  const currentPage = [...navPrincipal, ...navAdmin].find(item => isActive(item.href));

  return (
    <div className={`${styles.shell} ${isDarkMode ? styles.dark : styles.light}`}>

      {/* ── MOBILE OVERLAY ── */}
      {mobileOpen && (
        <div className={styles.overlay} onClick={() => setMobileOpen(false)} />
      )}

      {/* ── SIDEBAR ── */}
      <aside className={`${styles.sidebar} ${mobileOpen ? styles.mobileOpen : ''} ${collapsed ? styles.collapsed : ''}`}>

        {/* Brand */}
        <div className={styles.brand}>
          <div className={styles.brandIcon}>
            <img src="/escudo_oruro.jpg" alt="Escudo GADOR" />
          </div>
          {!collapsed && (
            <div style={{ overflow: 'hidden', flex: 1, minWidth: 0 }}>
              <div className={styles.brandName}>GADOR Admin</div>
              <div className={styles.brandSub}>Panel de Gestión</div>
            </div>
          )}
          <button className={styles.closeSidebar} onClick={() => setMobileOpen(false)} aria-label="Cerrar menú">✕</button>
        </div>

        {/* Rol badge */}
        {!collapsed && (
          <div className={styles.rolBadge}>
            {esSuperAdmin ? 'Super Administrador' : perfil?.secretarias?.nombre_corto || 'Secretaría'}
          </div>
        )}

        {/* Navigation */}
        <nav className={styles.nav} role="navigation" aria-label="Navegación principal">
          {!collapsed && <div className={styles.navLabel}>General</div>}
          {navPrincipal.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className={`${styles.navItem} ${isActive(item.href) ? styles.active : ''} ${collapsed ? styles.navItemCollapsed : ''}`}
              title={collapsed ? item.label : undefined}
            >
              <span className={styles.navIcon}>{item.icon}</span>
              {!collapsed && item.label}
            </Link>
          ))}

          <div className={styles.navDivider} />
          {!collapsed && <div className={styles.navLabel}>Administración</div>}

          {navAdmin.filter(item => !item.soloSuperAdmin || esSuperAdmin).map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className={`${styles.navItem} ${isActive(item.href) ? styles.active : ''} ${collapsed ? styles.navItemCollapsed : ''}`}
              title={collapsed ? item.label : undefined}
            >
              <span className={styles.navIcon}>{item.icon}</span>
              {!collapsed && item.label}
            </Link>
          ))}
        </nav>

        {/* Footer */}
        <div className={styles.sidebarFooter}>
          {!collapsed && (
            <div className={styles.userInfo}>
              <div className={styles.avatar}>
                {perfil?.avatar_url ? <img src={perfil.avatar_url} alt={nombreMostrar} /> : iniciales}
              </div>
              <div className={styles.userText}>
                <div className={styles.userName}>{nombreMostrar}</div>
                <div className={styles.userEmail}>{perfil?.email}</div>
              </div>
            </div>
          )}
          <button
            className={styles.logoutBtn}
            onClick={handleLogout}
            disabled={logging}
            id="admin-logout-btn"
            style={collapsed ? { justifyContent: 'center', padding: '0.7rem' } : {}}
          >
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
              <polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/>
            </svg>
            {!collapsed && (logging ? 'Cerrando sesión...' : 'Cerrar Sesión')}
          </button>
        </div>
      </aside>

      {/* ── MAIN AREA ── */}
      <div className={styles.main}>

        {/* Topbar */}
        <header className={styles.topbar}>
          <button
            className={styles.menuToggle}
            onClick={() => {
              if (typeof window !== 'undefined' && window.innerWidth <= 900) {
                setMobileOpen(v => !v);
              } else {
                setCollapsed(v => !v);
              }
            }}
            aria-label="Toggle sidebar"
          >
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/>
            </svg>
          </button>

          {/* Breadcrumb */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.4rem', fontSize: '0.82rem', color: 'var(--admin-text-muted)', overflow: 'hidden' }}>
            <span style={{ opacity: 0.6 }}>GADOR</span>
            <span style={{ opacity: 0.35 }}>/</span>
            <span style={{ color: 'var(--admin-text)', fontWeight: 600, whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
              {currentPage?.label || 'Panel'}
            </span>
          </div>

          <div className={styles.topbarRight}>
            {/* Theme toggle */}
            <button
              className={styles.themeToggle}
              onClick={() => setIsDarkMode(v => !v)}
              title={isDarkMode ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro'}
            >
              {isDarkMode ? (
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
              ) : (
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
              )}
            </button>

            {/* View site */}
            <Link href="/" target="_blank" className={styles.topbarLink}>
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
              Ver sitio
            </Link>

            {/* Avatar */}
            <div className={styles.topbarAvatar} title={nombreMostrar}>{iniciales}</div>
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
