// =====================================================
// lib/permissions.js
// Roles del panel y los módulos que puede administrar cada uno.
// Sin imports de servidor: lo usan el proxy, el AdminShell y las pages.
// =====================================================

// Rutas (prefijos bajo /admin) que administra cada rol restringido.
// '/admin' exacto = Dashboard.
export const ROLES_RESTRINGIDOS = {
  // UNICOM: comunicación → noticias, carrusel y videos de YouTube
  unicom: ['/admin/noticias', '/admin/carrusel', '/admin/videos'],
  // Secretaría General: toda la Gaceta Oficial
  secretaria_general: ['/admin/gaceta'],
  // UDNI: organigramas de las 10 secretarías
  udni: ['/admin/organigramas'],
};

export const ROL_LABELS = {
  super_admin: 'Super Administrador',
  secretaria_admin: 'Admin de Secretaría',
  unicom: 'UNICOM',
  secretaria_general: 'Secretaría General',
  udni: 'UDNI',
};

export const esRolRestringido = (rol) => Object.hasOwn(ROLES_RESTRINGIDOS, rol);

// ¿Puede este rol entrar a esta ruta del panel?
export function puedeAccederRuta(rol, pathname) {
  if (!esRolRestringido(rol)) return true;
  if (pathname === '/admin' || pathname === '/admin/') return true;
  return ROLES_RESTRINGIDOS[rol].some(
    (prefix) => pathname === prefix || pathname.startsWith(`${prefix}/`)
  );
}

// Rutas que SOLO ven super_admin y admins de secretaría (no los roles restringidos)
export function puedeVerItemNav(rol, href) {
  if (rol === 'super_admin') return true;
  if (rol === 'secretaria_admin') {
    return href !== '/admin/videos' && href !== '/admin/organigramas';
  }
  return puedeAccederRuta(rol, href);
}
