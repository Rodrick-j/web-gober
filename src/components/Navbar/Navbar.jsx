'use client';
import { useState, useEffect, useRef, useMemo } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { motion, AnimatePresence } from 'framer-motion';
import { createClient } from '@/lib/supabase/client';
import styles from './Navbar.module.css';

const navItems = [
  { label: 'Inicio', emoji: '🏠', href: '/' },
  {
    label: 'Secretarías',
    emoji: '🏢',
    href: '#',
    children: [], // Se llenará dinámicamente desde la base de datos
  },
  {
    label: 'Gaceta Oficial',
    emoji: '📜',
    href: '#',
    children: [
      { label: 'Leyes Departamentales', emoji: '⚖️', href: '/gaceta/leyes' },
      { label: 'Decretos Departamentales', emoji: '📄', href: '/gaceta/decretos-departamentales' },
      { label: 'Decretos Ejecutivos', emoji: '📝', href: '/gaceta/decretos-ejecutivos' },
      { label: 'Resoluciones Administrativas', emoji: '📌', href: '/gaceta/resoluciones' },
    ],
  },
  {
    label: 'Institución',
    emoji: '🏛️',
    href: '#',
    children: [
      { label: 'El Gobernador', emoji: '👨‍💼', href: '/institucion/gobernador' },
      { label: 'Historia', emoji: '📖', href: '/institucion/historia' },
      { label: 'Organigrama', emoji: '📊', href: '/institucion/organigrama' },
      { label: 'Marco Normativo', emoji: '⚖️', href: '/institucion/marco-normativo' },
    ],
  },
  { label: 'Transparencia', emoji: '🔍', href: '/transparencia' },
  { label: 'Noticias', emoji: '📰', href: '/noticias' },
];

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState(null);
  const [activeMobileAccordion, setActiveMobileAccordion] = useState(null);
  const [secretariasList, setSecretariasList] = useState([]);
  const timeoutRef = useRef(null);
  const supabase = useMemo(() => createClient(), []);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener('scroll', onScroll, { passive: true });
    
    // Fetch Secretarias
    async function fetchSecretarias() {
      const { data } = await supabase
        .from('secretarias')
        .select('nombre_corto, slug, icono')
        .order('orden', { ascending: true });
      if (data) setSecretariasList(data);
    }
    fetchSecretarias();

    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  // Update navItems dynamically with DB secretariats
  const dynamicNavItems = navItems.map(item => {
    if (item.label === 'Secretarías') {
      return {
        ...item,
        children: secretariasList.length > 0 ? secretariasList.map(sec => ({
          label: sec.nombre_corto,
          emoji: sec.icono || '🏛️',
          href: `/secretarias/${sec.slug}`
        })) : [{ label: 'Cargando secretarías...', emoji: '⏳', href: '#' }]
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

  const toggleMobileAccordion = (label) => {
    if (activeMobileAccordion === label) {
      setActiveMobileAccordion(null);
    } else {
      setActiveMobileAccordion(label);
    }
  };

  return (
    <>
      {/* Top Bar */}
      <div className={styles.topBar}>
        <div className={styles.topBarInner}>
          <span>🇧🇴 Bolivia — Departamento de Oruro</span>
          <div className={styles.topBarLinks}>
            <a href="#">Portal Ciudadano</a>
            <a href="#">Transparencia</a>
            <a href="#">Contacto</a>
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
          {/* Logo */}
          <Link href="/" className={styles.logo}>
            <Image
              src="/imagotipo_gador_2026.png"
              alt="Gobierno Autónomo Departamental de Oruro"
              height={80}
              width={260}
              style={{ objectFit: 'contain' }}
              priority
            />
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
                  <span className={styles.navEmoji}>{item.emoji}</span>
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
                      className={styles.dropdown}
                      initial={{ opacity: 0, y: 15, scale: 0.95 }}
                      animate={{ opacity: 1, y: 0, scale: 1 }}
                      exit={{ opacity: 0, y: 15, scale: 0.95 }}
                      transition={{ type: "spring", stiffness: 300, damping: 24 }}
                      onMouseEnter={() => clearTimeout(timeoutRef.current)}
                      onMouseLeave={handleMouseLeave}
                    >
                      {item.children.map((child) => (
                        <Link key={child.label} href={child.href} className={styles.dropdownLink}>
                          <span className={styles.dropdownEmoji}>{child.emoji}</span>
                          {child.label}
                        </Link>
                      ))}
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            ))}
          </nav>

          {/* Search + Mobile Toggle */}
          <div className={styles.navActions}>
            <button className={styles.searchBtn} aria-label="Buscar">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
              </svg>
            </button>
            <button
              className={styles.mobileToggle}
              onClick={() => setMobileOpen(!mobileOpen)}
              aria-label="Menú"
            >
              <span className={`${styles.hamburger} ${mobileOpen ? styles.open : ''}`} />
            </button>
          </div>
        </div>
      </motion.header>

      {/* Mobile Menu */}
      <AnimatePresence>
        {mobileOpen && (
          <motion.div
            className={styles.mobileMenu}
            initial={{ opacity: 0, x: '100%' }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: '100%' }}
            transition={{ type: 'tween', duration: 0.3 }}
          >
            <div className={styles.mobileMenuInner}>
              <button 
                className={styles.closeMobileBtn} 
                onClick={() => setMobileOpen(false)}
                aria-label="Cerrar menú"
              >
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <line x1="18" y1="6" x2="6" y2="18"></line>
                  <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
              </button>

              {dynamicNavItems.map((item, i) => (
                <motion.div
                  key={item.label}
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: i * 0.07 }}
                >
                  {item.children ? (
                    <button
                      className={styles.mobileLink}
                      onClick={() => toggleMobileAccordion(item.label)}
                      style={{ width: '100%', textAlign: 'left', border: 'none', background: 'transparent', display: 'flex', justifyContent: 'space-between', alignItems: 'center', cursor: 'pointer' }}
                    >
                      <span><span className={styles.navEmoji}>{item.emoji}</span> {item.label}</span>
                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ transform: activeMobileAccordion === item.label ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.3s' }}>
                        <path d="M6 9l6 6 6-6" />
                      </svg>
                    </button>
                  ) : (
                    <Link
                      href={item.href}
                      className={styles.mobileLink}
                      onClick={() => setMobileOpen(false)}
                    >
                      <span className={styles.navEmoji}>{item.emoji}</span> {item.label}
                    </Link>
                  )}

                  <AnimatePresence>
                    {item.children && activeMobileAccordion === item.label && (
                      <motion.div
                        className={styles.mobileSub}
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        transition={{ duration: 0.3 }}
                        style={{ overflow: 'hidden' }}
                      >
                        <div style={{ paddingTop: '0.5rem', paddingBottom: '0.5rem' }}>
                          {item.children.map((child) => (
                            <Link key={child.label} href={child.href} className={styles.mobileSubLink} onClick={() => setMobileOpen(false)}>
                              <span className={styles.navEmoji}>{child.emoji}</span> {child.label}
                            </Link>
                          ))}
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
    </>
  );
}
