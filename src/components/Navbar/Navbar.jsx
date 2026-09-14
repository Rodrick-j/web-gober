'use client';
import { useState, useEffect, useRef, useMemo } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { motion, AnimatePresence } from 'framer-motion';
import LanguageSwitcher from '../LanguageSwitcher/LanguageSwitcher';
import GlobalSearchModal from '@/components/GlobalSearchModal/GlobalSearchModal';
import { createClient } from '@/lib/supabase/client';
import { 
  Home, ClipboardList, Building2, ScrollText, Landmark, Search, Newspaper,
  BookOpen, FileText, FileSignature, Pin, User, GitMerge, Scale, Pickaxe,
  Leaf, Gavel, HardHat, HeartPulse, Coins, Menu, X, ChevronDown, ExternalLink,
  Globe, Map, Tractor
} from 'lucide-react';
import styles from './Navbar.module.css';

// Helper function to extract initials from full name
function getAcronym(nombre) {
  if(!nombre) return '';
  const ignoredWords = ['de', 'del', 'y', 'e', 'la', 'las', 'el', 'los', 'en', 'al', 'a', 'por', 'para'];
  const words = nombre.split(' ').filter(w => !ignoredWords.includes(w.toLowerCase()));
  return words.map(w => w[0].toUpperCase()).join('');
}

// Los 14 enlaces de Institución se agrupan por tema y se muestran en columnas,
// todos visibles a la vez, en lugar de una única lista larga.
const institucionGroups = [
  {
    title: 'Acerca de Nosotros',
    items: [
      { label: 'Historia, Misión y Visión', Icon: Landmark, href: '/institucion/historia-institucion' },
      { label: 'Datos de Municipio', Icon: BookOpen, href: '/institucion/historia' },
      { label: 'Organigrama', Icon: GitMerge, href: '/institucion/organigrama' },
      { label: 'Nómina de Autoridades', Icon: User, href: '/institucion/autoridades' },
    ],
  },
  {
    title: 'Planificación',
    items: [
      { label: 'Plan Estratégico Institucional', Icon: ScrollText, href: '/institucion/plan-estrategico' },
      { label: 'Seguimiento al POA', Icon: ClipboardList, href: '/institucion/seguimiento-poa' },
      { label: 'Marco Normativo', Icon: Scale, href: '/institucion/marco-normativo' },
    ],
  },
  {
    title: 'Contrataciones',
    items: [
      { label: 'Contrataciones y Convocatorias', Icon: FileSignature, href: '/contrataciones' },
      { label: 'Licitación Pública', Icon: Gavel, href: '/institucion/licitacion-publica' },
    ],
  },
  {
    title: 'Administración',
    items: [
      { label: 'Información Financiera', Icon: Coins, href: '/institucion/informacion-financiera' },
      { label: 'Presupuesto y Ejecución', Icon: Coins, href: '/institucion/presupuesto' },
      { label: 'Recursos Humanos', Icon: User, href: '/institucion/recursos-humanos' },
      { label: 'Escala Salarial', Icon: Coins, href: '/institucion/escala-salarial' },
      { label: 'Desarrollo Organizacional', Icon: GitMerge, href: '/institucion/desarrollo-organizacional' },
    ],
  },
];

const navItems = [
  { label: 'Inicio', Icon: Home, href: '/' },
  {
    label: 'Institución',
    Icon: Landmark,
    href: '#',
    groups: institucionGroups,
    // children plano: lo siguen usando el indicador de flecha y el menú móvil.
    children: institucionGroups.flatMap((group) => group.items),
  },
  {
    label: 'Secretarías',
    Icon: Building2,
    href: '#',
    children: [], // Se llenará dinámicamente desde la base de datos
  },
  {
    label: 'Transparencia',
    Icon: Search,
    href: '/transparencia',
    children: [
      { label: 'Portal de Transparencia', Icon: Scale, href: '/transparencia' },
      { label: 'Unidad de Transparencia (UTLCC)', Icon: Landmark, href: '/transparencia/unidad' },
      { label: 'Solicitud de Información', Icon: FileText, href: '/transparencia/solicitud-informacion' },
      { label: 'Rendición Pública de Cuentas', Icon: FileSignature, href: '/transparencia/rendicion_cuentas' },
      { label: 'Datos y Estadísticas', Icon: BookOpen, href: '/datos-estadisticas' },
      { label: 'Auditoria Interna', Icon: ClipboardList, href: '/auditoria' },
    ],
  },
  { label: 'Noticias', Icon: Newspaper, href: '/noticias' },
  { label: 'Publicaciones', Icon: BookOpen, href: '/publicaciones' },
  {
    label: 'Gaceta Oficial',
    Icon: ScrollText,
    href: '#',
    children: [
      { label: 'Leyes Departamentales', Icon: Scale, href: '/gaceta/leyes' },
      { label: 'Decretos Departamentales', Icon: FileText, href: '/gaceta/decretos-departamentales' },
      { label: 'Decretos Ejecutivos', Icon: FileSignature, href: '/gaceta/decretos-ejecutivos' },
      { label: 'Resoluciones Administrativas', Icon: Pin, href: '/gaceta/resoluciones' },
    ],
  },
];

const getSecretariaIcon = (sec) => {
  const text = (sec.slug + ' ' + (sec.nombre_corto || '') + ' ' + (sec.nombre || '')).toLowerCase();
  if (text.includes('minería') || text.includes('mineria') || text.includes('metalurgia')) return Pickaxe;
  if (text.includes('medio ambiente') || text.includes('madre tierra') || text.includes('agua')) return Leaf;
  if (text.includes('jurídico') || text.includes('juridico') || text.includes('justicia')) return Gavel;
  if (text.includes('obras') || text.includes('infraestructura')) return HardHat;
  if (text.includes('social') || text.includes('salud') || text.includes('desarrollo humano')) return HeartPulse;
  if (text.includes('economía') || text.includes('economia') || text.includes('finanzas') || text.includes('planificación')) return Coins;
  if (text.includes('cultura') || text.includes('turismo')) return Map;
  if (text.includes('producción') || text.includes('productivo') || text.includes('desarrollo productivo')) return Tractor;
  return Building2;
};

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [searchOpen, setSearchOpen] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState(null);
  const [activeMobileAccordion, setActiveMobileAccordion] = useState(null);
  const [activeMobileGroup, setActiveMobileGroup] = useState(null);
  const [secretariasList, setSecretariasList] = useState([]);
  const [currentDateTime, setCurrentDateTime] = useState(null);
  const timeoutRef = useRef(null);
  const supabase = useMemo(() => createClient(), []);

  const fallbackSecretarias = [
    { nombre: 'Secretaría General', nombre_corto: 'Sec. General', slug: 'secretaria-general', icono: '🏛️' },
    { nombre: 'Secretaría Departamental de Desarrollo Productivo e Industria', nombre_corto: 'Desarrollo Productivo', slug: 'desarrollo-productivo-industria', icono: '🌾' },
    { nombre: 'Secretaría Departamental de Cultura y Turismo', nombre_corto: 'Cultura y Turismo', slug: 'cultura-turismo', icono: '🎭' },
    { nombre: 'Secretaría Departamental de Obras Públicas', nombre_corto: 'Obras Públicas', slug: 'obras-publicas', icono: '🏗️' },
    { nombre: 'Secretaría Departamental de Minería y Metalurgia', nombre_corto: 'Minería y Metalurgia', slug: 'mineria-y-metalurgia', icono: '⛏️' },
    { nombre: 'Secretaría Departamental de Medio Ambiente, Agua y Madre Tierra', nombre_corto: 'Medio Ambiente', slug: 'medio-ambiente-agua-madre-tierra', icono: '🌿' },
    { nombre: 'Secretaría Departamental de Asuntos Jurídicos', nombre_corto: 'Asuntos Jurídicos', slug: 'asuntos-juridicos', icono: '⚖️' },
    { nombre: 'Secretaría Departamental de Desarrollo Social y Seguridad Alimentaria', nombre_corto: 'Desarrollo Social', slug: 'desarrollo-social-seguridad-alimentaria', icono: '🏥' },
    { nombre: 'Secretaría Departamental de Planificación del Desarrollo', nombre_corto: 'Planificación', slug: 'planificacion-desarrollo', icono: '📊' },
    { nombre: 'Secretaría Departamental de Administración y Finanzas Públicas', nombre_corto: 'Administración y Finanzas', slug: 'administracion-finanzas-publicas', icono: '💰' }
  ];

  useEffect(() => {
    setCurrentDateTime(new Date());
    const clockTimer = setInterval(() => {
      setCurrentDateTime(new Date());
    }, 1000);

    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll, { passive: true });
    
    const handleResize = () => {
      if (window.innerWidth > 900) {
        setMobileOpen(false);
        setActiveMobileAccordion(null);
        setActiveMobileGroup(null);
      }
    };
    window.addEventListener('resize', handleResize);

    // Load secretarias dynamically
    const loadSecretarias = async () => {
      const supabase = createClient();
      const { data, error } = await supabase
        .from('secretarias')
        .select('nombre, nombre_corto, slug, icono')
        .eq('activo', true)
        .order('orden', { ascending: true });
        
      if (data && !error && data.length > 0) {
        setSecretariasList(data);
      } else {
        setSecretariasList(fallbackSecretarias);
      }
    };
    loadSecretarias();

    return () => {
      window.removeEventListener('scroll', handleScroll);
      window.removeEventListener('resize', handleResize);
      clearInterval(clockTimer);
    };
  }, [supabase]);

  // Update navItems dynamically with DB secretariats
  const dynamicNavItems = navItems.map(item => {
    if (item.label === 'Secretarías') {
      const listToUse = secretariasList.length > 0 ? secretariasList : fallbackSecretarias;
      return {
        ...item,
        children: listToUse.map(sec => {
          const SecIcon = getSecretariaIcon(sec);
          return {
            label: sec.nombre_corto,
            fullLabel: sec.nombre || sec.nombre_corto,
            Icon: SecIcon,
            href: `/secretarias/${sec.slug}`,
            acronym: getAcronym(sec.nombre || sec.nombre_corto)
          }
        })
      };
    }
    return item;
  });

  const handleMouseEnter = (label) => {
    clearTimeout(timeoutRef.current);
    setActiveDropdown(label);
  };

  const handleMouseLeave = () => {
    timeoutRef.current = setTimeout(() => setActiveDropdown(null), 100);
  };

  const toggleMobileAccordion = (label, hasNestedGroups = false) => {
    const isClosing = activeMobileAccordion === label;
    setActiveMobileAccordion(isClosing ? null : label);

    if (isClosing || !hasNestedGroups) {
      setActiveMobileGroup(null);
    }
  };

  const toggleMobileGroup = (groupTitle) => {
    setActiveMobileGroup((current) => current === groupTitle ? null : groupTitle);
  };

  const closeMobileMenu = () => {
    setMobileOpen(false);
    setActiveMobileAccordion(null);
    setActiveMobileGroup(null);
  };

  const toggleMobileMenu = () => {
    if (mobileOpen) {
      closeMobileMenu();
      return;
    }

    setMobileOpen(true);
  };

  return (
    <>
      {/* Top Bar */}
      <div className={styles.topBar}>
        <div className={styles.topBarInner}>
          <span className={styles.topBarTitle}>
            🇧🇴 Bolivia — <span className={styles.topBarLong}>Departamento de Oruro</span><span className={styles.topBarShort}> Oruro</span>
          </span>
          <div className={styles.topBarLinks}>
            {currentDateTime && (
              <span className={styles.topBarDateTime}>
                <span className={styles.dateLong}>
                  {currentDateTime.toLocaleDateString('es-BO', { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' })}
                </span>
                <span className={styles.dateShort}>
                  {currentDateTime.toLocaleDateString('es-BO', { day: '2-digit', month: '2-digit', year: 'numeric' })}
                </span>
                <span className={styles.topBarTimeSeparator}> | </span>
                <span className={styles.topBarTimeString}>
                  {currentDateTime.toLocaleTimeString('es-BO')}
                </span>
              </span>
            )}
            <LanguageSwitcher />
          </div>
        </div>
      </div>

      {/* Main Navbar */}
      <motion.header
        className={`${styles.navbar} ${scrolled ? styles.scrolled : ''}`}
        initial={{ y: -100 }}
        animate={{ y: 0 }}
        transition={{ duration: 0.5, ease: 'easeOut' }}
      >
        <div className={styles.navInner}>
          <Link 
            href="/" 
            className={styles.logo}
          >
            <div className={styles.logoContainer}>
              {/* Primer Logo: Logo Institucional */}
              <div style={{ position: 'absolute', inset: 0, display: 'flex', alignItems: 'center', justifyContent: 'flex-start' }}>
                <div className={styles.logoCrossfade1}>
                    <Image
                      src="/imagotipo_gador_2026.png"
                      alt="Gobierno Autónomo Departamental de Oruro"
                      height={90}
                      width={180}
                      style={{ objectFit: 'contain', width: 'auto', height: '64px' }}
                      priority
                    />
                </div>
              </div>

              {/* Segundo Logo: Marca de Gobierno */}
              <div style={{ position: 'absolute', inset: 0, display: 'flex', alignItems: 'center', justifyContent: 'flex-start' }}>
                <div className={styles.logoCrossfade2}>
                  <Image
                    src="/marca_gobierno_2.png"
                    alt="¡Gobierno de Unidad!"
                    width={310}
                    height={68}
                    style={{ objectFit: 'contain', width: 'auto', height: '64px' }}
                  />
                </div>
              </div>
            </div>
          </Link>

          {/* Desktop Nav */}
          <nav className={styles.desktopNav}>
            {dynamicNavItems.map((item) => (
              <div
                key={item.label}
                className={styles.navItem}
                onMouseEnter={() => item.children && handleMouseEnter(item.label)}
                onMouseLeave={handleMouseLeave}
              >
                <Link 
                  href={item.href} 
                  className={styles.navLink}
                  onClick={(e) => {
                    if (item.href === '#') e.preventDefault();
                  }}
                >
                  <span className={styles.navEmoji}><item.Icon size={18} strokeWidth={2.2} /></span>
                  {item.label}
                  {item.children && (
                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor">
                      <path d="M2 4l4 4 4-4" stroke="currentColor" strokeWidth="1.5" fill="none" strokeLinecap="round"/>
                    </svg>
                  )}
                </Link>

                <AnimatePresence>
                  {item.children && activeDropdown === item.label && (
                    <motion.div
                      className={
                        item.groups
                          ? styles.groupMenu
                          : item.label === 'Secretarías'
                            ? styles.megaMenu
                            : styles.dropdown
                      }
                      initial={{ opacity: 0, y: 15, scale: 0.95 }}
                      animate={{ opacity: 1, y: 0, scale: 1 }}
                      exit={{ opacity: 0, y: 15, scale: 0.95 }}
                      transition={{ type: "spring", stiffness: 300, damping: 24 }}
                      onMouseEnter={() => clearTimeout(timeoutRef.current)}
                      onMouseLeave={handleMouseLeave}
                    >
                      {item.groups ? (
                        item.groups.map((group) => (
                          <div key={group.title} className={styles.groupColumn}>
                            <span className={styles.groupTitle}>{group.title}</span>
                            {group.items.map((child) => (
                              <Link key={child.label} href={child.href} className={styles.groupLink}>
                                <span className={styles.dropdownEmoji}><child.Icon size={16} strokeWidth={2.2} /></span>
                                {child.label}
                              </Link>
                            ))}
                          </div>
                        ))
                      ) : (
                        item.children.map((child) => (
                          item.label === 'Secretarías' ? (
                            <Link key={child.label} href={child.href} className={styles.megaLink}>
                              <div className={styles.megaEmoji}><child.Icon size={24} strokeWidth={2} /></div>
                              <div className={styles.megaText}>
                                <span className={styles.megaAcronym}>{child.acronym}</span>
                                <span className={styles.megaFullName}>{child.fullLabel}</span>
                              </div>
                            </Link>
                          ) : (
                            <Link key={child.label} href={child.href} className={styles.dropdownLink}>
                              <span className={styles.dropdownEmoji}><child.Icon size={16} strokeWidth={2.2} /></span>
                              {child.label}
                            </Link>
                          )
                        ))
                      )}
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            ))}
          </nav>

          {/* Search + Mobile Toggle */}
          <div className={styles.navActions}>
            <button className={styles.searchBtn} onClick={() => setSearchOpen(true)} aria-label="Buscar" title="Buscar (Ctrl + K)">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
              </svg>
            </button>
            <button
              className={styles.mobileToggle}
              onClick={toggleMobileMenu}
              aria-label="Menú"
              aria-expanded={mobileOpen}
            >
              <span className={`${styles.hamburger} ${mobileOpen ? styles.open : ''}`} />
            </button>
          </div>
        </div>

        {/* Mobile Menu Dropdown */}
        <AnimatePresence>
          {mobileOpen && (
            <motion.div
              className={styles.mobileMenu}
              initial={{ opacity: 0, y: -15 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -15 }}
              transition={{ duration: 0.2, ease: 'easeOut' }}
              style={{ transformOrigin: 'top' }}
            >
              <div className={styles.mobileMenuInner}>
                {dynamicNavItems.map((item, i) => (
                  <motion.div
                    key={item.label}
                    initial={{ opacity: 0, x: -10 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: i * 0.02, duration: 0.2 }}
                  >
                  {item.children ? (
                    <button
                      className={styles.mobileLink}
                      onClick={() => toggleMobileAccordion(item.label, Boolean(item.groups))}
                      aria-expanded={activeMobileAccordion === item.label}
                      style={{ width: '100%', textAlign: 'left', border: 'none', background: 'transparent', display: 'flex', justifyContent: 'space-between', alignItems: 'center', cursor: 'pointer' }}
                    >
                      <span><span className={styles.navEmoji}><item.Icon size={18} strokeWidth={2.2} /></span> {item.label}</span>
                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ transform: activeMobileAccordion === item.label ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.3s' }}>
                        <path d="M6 9l6 6 6-6" />
                      </svg>
                    </button>
                  ) : (
                    <Link
                      href={item.href}
                      className={styles.mobileLink}
                      onClick={closeMobileMenu}
                    >
                      <span className={styles.navEmoji}><item.Icon size={18} strokeWidth={2.2} /></span> {item.label}
                    </Link>
                  )}

                  <AnimatePresence>
                    {item.children && activeMobileAccordion === item.label && (
                      <motion.div
                        className={styles.mobileSub}
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        transition={{ duration: 0.15, ease: 'easeOut' }}
                        style={{ overflow: 'hidden' }}
                      >
                        <div 
                          className={item.label === 'Secretarías' ? styles.mobileChipsGrid : ''}
                          style={{ paddingTop: '0.5rem', paddingBottom: '0.5rem' }}
                        >
                          {item.groups ? (
                            item.groups.map((group, groupIndex) => {
                              const isGroupOpen = activeMobileGroup === group.title;
                              const groupId = `mobile-institution-group-${groupIndex}`;

                              return (
                                <div key={group.title} className={styles.mobileGroup}>
                                  <button
                                    type="button"
                                    className={styles.mobileGroupButton}
                                    onClick={() => toggleMobileGroup(group.title)}
                                    aria-expanded={isGroupOpen}
                                    aria-controls={groupId}
                                  >
                                    <span className={styles.mobileGroupTitle}>{group.title}</span>
                                    <svg
                                      className={`${styles.mobileGroupChevron} ${isGroupOpen ? styles.mobileGroupChevronOpen : ''}`}
                                      width="15"
                                      height="15"
                                      viewBox="0 0 24 24"
                                      fill="none"
                                      stroke="currentColor"
                                      strokeWidth="2"
                                      aria-hidden="true"
                                    >
                                      <path d="M6 9l6 6 6-6" />
                                    </svg>
                                  </button>

                                  <AnimatePresence initial={false}>
                                    {isGroupOpen && (
                                      <motion.div
                                        id={groupId}
                                        className={styles.mobileGroupItems}
                                        initial={{ height: 0, opacity: 0 }}
                                        animate={{ height: 'auto', opacity: 1 }}
                                        exit={{ height: 0, opacity: 0 }}
                                        transition={{ duration: 0.16, ease: 'easeOut' }}
                                      >
                                        {group.items.map((child) => (
                                          <Link key={child.label} href={child.href} className={styles.mobileSubLink} onClick={closeMobileMenu}>
                                            <span className={styles.navEmoji}><child.Icon size={16} strokeWidth={2.2} /></span> {child.label}
                                          </Link>
                                        ))}
                                      </motion.div>
                                    )}
                                  </AnimatePresence>
                                </div>
                              );
                            })
                          ) : (
                            item.children.map((child) => {
                              const isSecretarias = item.label === 'Secretarías';
                              return isSecretarias ? (
                                <Link key={child.label} href={child.href} className={styles.mobileChip} onClick={closeMobileMenu}>
                                  <span className={styles.chipEmoji}><child.Icon size={14} strokeWidth={2.5} /></span>
                                  <span className={styles.chipText}>{child.fullLabel || child.label}</span>
                                </Link>
                              ) : (
                                <Link key={child.label} href={child.href} className={styles.mobileSubLink} onClick={closeMobileMenu}>
                                  <span className={styles.navEmoji}><child.Icon size={16} strokeWidth={2.2} /></span> {child.label}
                                </Link>
                              );
                            })
                          )}
                        </div>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </motion.div>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
      </motion.header>

      <GlobalSearchModal isOpen={searchOpen} onClose={() => setSearchOpen(false)} />
    </>
  );
}
