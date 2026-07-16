'use client';

import { useRef } from 'react';
import Link from 'next/link';
import ScrollReveal from '@/components/ScrollReveal/ScrollReveal';
import { 
  FileText, 
  ClipboardList, 
  Eye, 
  Building2, 
  Compass, 
  PhoneCall, 
  ArrowRight 
} from 'lucide-react';
import styles from './QuickAccess.module.css';

const services = [
  { 
    id: 'gaceta', 
    Icon: FileText, 
    title: 'Gaceta Oficial', 
    desc: 'Leyes, Decretos y Resoluciones del Departamento.', 
    href: '/gaceta', 
    color: '#9c0720', 
    rgb: '156,7,32' 
  },
  { 
    id: 'tramites', 
    Icon: ClipboardList, 
    title: 'Trámites en Línea', 
    desc: 'Gestiona tus trámites administrativos sin salir de casa.', 
    href: '/tramites', 
    color: '#0369a1', 
    rgb: '3,105,161' 
  },
  { 
    id: 'transparencia', 
    Icon: Eye, 
    title: 'Transparencia', 
    desc: 'Presupuestos oficiales y rendición de cuentas públicas.', 
    href: '/transparencia', 
    color: '#047857', 
    rgb: '4,120,87' 
  },
  { 
    id: 'secretarias', 
    Icon: Building2, 
    title: 'Secretarías', 
    desc: 'Conoce nuestras secretarías y áreas de gestión.', 
    href: '/secretarias', 
    color: '#7c3aed', 
    rgb: '124,58,237' 
  },
  { 
    id: 'cultura', 
    Icon: Compass, 
    title: 'Cultura y Turismo', 
    desc: 'Patrimonio histórico, festividades y turismo regional.', 
    href: '/secretarias/cultura-turismo', 
    color: '#b45309', 
    rgb: '180,83,9' 
  },
  { 
    id: 'contacto', 
    Icon: PhoneCall, 
    title: 'Contacto Oficial', 
    desc: 'Comunícate directamente con nuestras oficinas centrales.', 
    href: '/contacto', 
    color: '#0284c7', 
    rgb: '2,132,199' 
  },
];

/* Individual card with mouse-tracking shine effect */
function ShineCard({ service }) {
  const cardRef = useRef(null);
  const { Icon } = service;

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

      {/* Styled Icon wrapper */}
      <div
        className={styles.iconWrap}
        style={{ 
          background: `rgba(${service.rgb}, 0.08)`, 
          color: service.color,
          borderColor: `rgba(${service.rgb}, 0.15)`
        }}
      >
        <Icon size={24} strokeWidth={2.2} className={styles.icon} />
      </div>

      <div className={styles.cardContent}>
        <h3 className={styles.cardTitle}>{service.title}</h3>
        <p className={styles.cardDesc}>{service.desc}</p>
      </div>

      {/* Slide-in arrow indicator */}
      <div className={styles.arrow} style={{ color: service.color }}>
        <ArrowRight size={18} strokeWidth={2.5} />
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
        <ScrollReveal direction="up" wrapChildren stagger={0.07} className={styles.grid}>
          {services.map((service) => (
            <ShineCard key={service.id} service={service} />
          ))}
        </ScrollReveal>

      </div>
    </section>
  );
}
