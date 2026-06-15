'use client';
import { useRef } from 'react';
import Link from 'next/link';
import ScrollReveal from '@/components/ScrollReveal/ScrollReveal';
import styles from './QuickAccess.module.css';

const services = [
  { id: 'gaceta',         icon: '📜', title: 'Gaceta Oficial',       desc: 'Leyes, Decretos y Resoluciones',               href: '/gaceta',                       color: '#8B0000', rgb: '139,0,0'    },
  { id: 'tramites',       icon: '📋', title: 'Trámites en Línea',    desc: 'Gestiona tus trámites sin salir de casa',       href: '/tramites',                     color: '#1D4ED8', rgb: '29,78,216'  },
  { id: 'transparencia',  icon: '🔍', title: 'Transparencia',        desc: 'Presupuestos y rendición de cuentas',           href: '/transparencia',                color: '#047857', rgb: '4,120,87'   },
  { id: 'secretarias',    icon: '🏛️', title: 'Secretarías',          desc: 'Conoce nuestras secretarías departamentales',   href: '/secretarias',                  color: '#7C3AED', rgb: '124,58,237' },
  { id: 'cultura',        icon: '🎭', title: 'Cultura y Turismo',    desc: 'Patrimonio, eventos y atracciones de Oruro',    href: '/secretarias/cultura-turismo',  color: '#B45309', rgb: '180,83,9'   },
  { id: 'contacto',       icon: '📞', title: 'Contacto',             desc: 'Comunícate con las autoridades departamentales',href: '/contacto',                     color: '#0369A1', rgb: '3,105,161'  },
];

/* Individual card with mouse-tracking shine effect (Aceternity-style) */
function ShineCard({ service }) {
  const cardRef = useRef(null);

  const handleMouseMove = (e) => {
    const card = cardRef.current;
    if (!card) return;
    const rect = card.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    card.style.setProperty('--mx', `${x}px`);
    card.style.setProperty('--my', `${y}px`);
  };

  const handleMouseLeave = () => {
    const card = cardRef.current;
    if (!card) return;
    card.style.setProperty('--mx', `-999px`);
    card.style.setProperty('--my', `-999px`);
  };

  return (
    <Link
      ref={cardRef}
      href={service.href}
      className={styles.card}
      id={`service-${service.id}`}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      style={{ '--accent-rgb': service.rgb }}
    >
      {/* Radial shine follows the cursor */}
      <div className={styles.cardShine} />

      <div
        className={styles.iconWrap}
        style={{ background: `${service.color}18`, color: service.color }}
      >
        <span className={styles.icon}>{service.icon}</span>
      </div>

      <div className={styles.cardContent}>
        <h3 className={styles.cardTitle}>{service.title}</h3>
        <p className={styles.cardDesc}>{service.desc}</p>
      </div>

      <div className={styles.arrow} style={{ color: service.color }}>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
          <path d="M5 12h14M12 5l7 7-7 7"/>
        </svg>
      </div>
    </Link>
  );
}

export default function QuickAccess() {
  return (
    <section className={`section section-alt ${styles.quickAccess}`} id="servicios">
      <div className="container">

        {/* Section header — revealed from below */}
        <ScrollReveal direction="up" className="section-header">
          <span className="section-label">Servicios Ciudadanos</span>
          <h2 className="section-title">Accesos Rápidos</h2>
          <div className="divider" />
          <p className="section-subtitle">
            Todo lo que necesitas del Gobierno Departamental, en un solo lugar.
          </p>
        </ScrollReveal>

        {/* Grid — children staggered */}
        <ScrollReveal direction="up" wrapChildren stagger={0.09} className={styles.grid}>
          {services.map((service) => (
            <ShineCard key={service.id} service={service} />
          ))}
        </ScrollReveal>

      </div>
    </section>
  );
}
