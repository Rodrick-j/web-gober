"use client";

import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import Link from 'next/link';
import Image from 'next/image';
import { Activity, BarChart3, PieChart, TrendingUp, Shield, ChevronRight } from 'lucide-react';
import './home.css';

const secretariasData = [
  { id: 'planificacion',     name: 'Secretaría de Planificación',        image: '/images/secretarias/planificacion.jpg',         desc: 'Ejecución presupuestaria, avances de POA y proyectos de inversión.',         stats: { main: '87%',   label: 'Ejecución POA' },        link: true },
  { id: 'desarrollo',        name: 'Secretaría de Desarrollo Productivo', image: '/images/secretarias/desarrollo_productivo.png',  desc: 'Rendimiento agrícola, ganadero y emprendimientos productivos.',              stats: { main: '+12%',  label: 'Crecimiento Agrícola' }, link: false },
  { id: 'desarrollo-social', name: 'Secretaría de Desarrollo Social',     image: '/images/secretarias/LOGO DE DESARROLO SOCIAL.png',      desc: 'Programas de asistencia social, bonos y atención a sectores vulnerables.',    stats: { main: '50k+',  label: 'Beneficiarios' },         link: false },
  { id: 'obras',             name: 'Secretaría de Obras Públicas',        image: '/images/secretarias/LOGO DE OBRAS PUBLICAS.png',         desc: 'Kilómetros asfaltados, avance de obras e infraestructura vial.',              stats: { main: '150km', label: 'Nuevas Vías' },           link: false },
  { id: 'medio-ambiente',    name: 'Secretaría de Medio Ambiente',        image: '/images/secretarias/LOGO DE MEDIO AMBIENTE.png',         desc: 'Calidad ambiental, forestación y proyectos hídricos.',                         stats: { main: '300k',  label: 'Árboles Plantados' },    link: false },
  { id: 'mineria',           name: 'Secretaría de Minería',               image: '/images/secretarias/LOGO DE MINERIA.png',                desc: 'Regalías mineras, volumen de exportación y cooperativas.',                    stats: { main: '$45M',  label: 'Regalías Mensual' },      link: false },
  { id: 'cultura',           name: 'Secretaría de Cultura y Turismo',     image: '/images/secretarias/LOGO DE CULTURA Y TURISMO.png',        desc: 'Hitos culturales, turismo departamental y conservación de patrimonio.',      stats: { main: '+25%',   label: 'Turismo Anual' },    link: false },
  { id: 'finanzas',          name: 'Secretaría de Administración y Finanzas', image: '/images/secretarias/LOGO DE FINANZAS.png',         desc: 'Recaudación departamental, flujo de caja y finanzas públicas.',                stats: { main: '$120M', label: 'Recaudación Anual' },    link: false },
  { id: 'juridicos',         name: 'Secretaría de Asuntos Jurídicos',     image: '/images/secretarias/LOGO DE ASUNTOS JURIDICOS.png',            desc: 'Procesos legales, contratos y representación institucional.',            stats: { main: '98%',  label: 'Casos Resueltos' },    link: false },
  { id: 'general',           name: 'Secretaría General',                  image: '/images/secretarias/LOGO DE SECRETARIA GENERAL.png',            desc: 'Coordinación institucional, decretos y gestión administrativa.',            stats: { main: '100%',  label: 'Gestión Documental' },    link: false },
];

const AnimatedBars = () => {
  const [bars, setBars] = useState([]);
  useEffect(() => {
    setBars(Array.from({ length: 22 }).map((_, i) => ({
      id: i,
      h: Math.random() * 75 + 20,
      left: `${(i / 22) * 100}%`,
      delay: Math.random() * 2,
      dur: Math.random() * 1.5 + 1.2,
    })));
  }, []);
  return (
    <div className="anim-bars-container">
      {bars.map(b => (
        <motion.div key={b.id} className="anim-bar" style={{ left: b.left }}
          animate={{ height: [`0%`, `${b.h}%`, `${b.h * 0.3}%`, `${b.h}%`] }}
          transition={{ duration: b.dur, delay: b.delay, repeat: Infinity, ease: 'easeInOut' }}
        />
      ))}
    </div>
  );
};

export default function Home() {
  return (
    <div className="root-wrapper">

      {/* ── NAVBAR ── */}
      <nav className="top-navbar">
        <div className="navbar-inner">
          <div className="navbar-brand">
            <Image src="/marca_gobierno.png" alt="GADOR" width={150} height={48} style={{ objectFit: 'contain', height: 'auto' }} />
            <div className="navbar-sep" />
            <div className="navbar-texts">
              <span className="navbar-title">Portal Estadístico Departamental</span>
              <span className="navbar-sub">Gobierno Autónomo Departamental de Oruro</span>
            </div>
          </div>
          <div className="navbar-right">
            <div className="nav-info-pill">
              <span className="nav-dot" />
              <span>Sistema Activo</span>
            </div>
          </div>
        </div>
        <div className="navbar-strip" />
      </nav>

      {/* ── HERO BANNER ── */}
      <section className="hero-section">
        {/* PC / Tablet: banner horizontal */}
        <Image src="/images/hero_banner.png" alt="Banner Estadísticas Oruro"
          fill priority style={{ objectFit: 'cover', objectPosition: 'center top' }}
          className="hero-img hero-img--desktop"
        />
        {/* Mobile: imagen vertical */}
        <Image src="/images/hero_mobile.jpg" alt="Estadísticas Oruro"
          fill priority style={{ objectFit: 'cover', objectPosition: 'top' }}
          className="hero-img hero-img--mobile"
        />
        {/* Overlay oscuro tenue solo en desktop para resaltar animaciones */}
        <div className="hero-overlay" />
        <AnimatedBars />

        {/* Panel info — aparece y desaparece en loop */}
        <motion.div className="hero-info-panel"
          initial={{ opacity: 0, y: 30, scale: 0.96 }}
          animate={{
            opacity:  [0, 1, 1, 1, 0],
            y:        [30, 0, 0, 0, -10],
            scale:    [0.96, 1, 1, 1, 0.97],
          }}
          transition={{ duration: 6, delay: 0.5, repeat: Infinity, repeatDelay: 3, ease: 'easeInOut' }}
        >
          <div className="hero-panel-badge"><BarChart3 size={12} /> SISTEMA ESTADÍSTICO OFICIAL</div>
          <p className="hero-panel-text">
            Datos oficiales de planificación, ejecución presupuestaria e indicadores sociales de las 10 secretarías del departamento.
          </p>
          <div className="hero-panel-stats">
            <div className="hps-item"><span className="hps-val">10</span><span className="hps-lbl">Secretarías</span></div>
            <div className="hps-div" />
            <div className="hps-item"><span className="hps-val">35</span><span className="hps-lbl">Municipios</span></div>
            <div className="hps-div" />
            <div className="hps-item"><span className="hps-val">2026</span><span className="hps-lbl">Gestión</span></div>
          </div>
        </motion.div>
      </section>

      {/* ── GRID DE SECRETARÍAS ── */}
      <section className="grid-section">
        <motion.div className="grid-section-header"
          initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }} transition={{ duration: 0.5 }}
        >
          <div className="gsh-left relative overflow-hidden p-4 rounded-xl">
            {/* Animaciones estadísticas de fondo */}
            <div className="absolute inset-0 pointer-events-none opacity-10">
              <motion.div className="absolute font-black text-6xl text-[#9c0720]" animate={{ x: [0, 100, 0], y: [0, -20, 0] }} transition={{ duration: 10, repeat: Infinity }} style={{ top: '-10%', left: '10%' }}>📈</motion.div>
              <motion.div className="absolute font-black text-6xl text-[#9c0720]" animate={{ x: [0, -80, 0], y: [0, 30, 0] }} transition={{ duration: 12, repeat: Infinity }} style={{ bottom: '-10%', right: '20%' }}>📊</motion.div>
              <motion.div className="absolute font-black text-4xl text-[#9c0720]" animate={{ scale: [1, 1.5, 1], opacity: [0.5, 1, 0.5] }} transition={{ duration: 5, repeat: Infinity }} style={{ top: '20%', right: '5%' }}>87%</motion.div>
            </div>
            <span className="gsh-accent relative z-10" />
            <div className="relative z-10">
              <h2 className="gsh-title" style={{ background: 'linear-gradient(90deg, #9c0720, #e60000)', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent', display: 'inline-block' }}>Tableros por Secretaría</h2>
              <p className="gsh-sub">Seleccione un área estratégica para acceder a los informes y ejecución de POAs</p>
            </div>
          </div>
          <div className="gsh-badge"><Shield size={14} /> Sistema Institucional</div>
        </motion.div>

        <div className="cards-grid">
          {secretariasData.map((sec, i) => (
            <motion.div key={sec.id} className="sec-card"
              initial={{ opacity: 0, y: 25 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: '-40px' }}
              transition={{ duration: 0.45, delay: i * 0.04 }}
              whileHover={{ y: -8, transition: { duration: 0.2 } }}
            >
              <div className="card-img-wrap">
                <Image src={sec.image} alt={sec.name} fill style={{ objectFit: 'cover' }} className="card-img" />
                <div className="card-img-overlay" />
              </div>

              <div className="card-stat-badge">
                <span className="csb-val">{sec.stats.main}</span>
                <span className="csb-lbl">{sec.stats.label}</span>
              </div>

              <div className="card-body">
                <h3 className="card-title">{sec.name}</h3>
                <p className="card-desc">{sec.desc}</p>
                {sec.link ? (
                  <Link href="/planificacion" className="card-btn card-btn--active">
                    Acceder al Tablero <ChevronRight size={16} />
                  </Link>
                ) : (
                  <button className="card-btn">Acceder al Tablero <ChevronRight size={16} /></button>
                )}
              </div>
            </motion.div>
          ))}
        </div>
      </section>

      {/* ── FOOTER ── */}
      <footer className="site-footer">
        <div className="footer-inner">
          <Image src="/marca_gobierno.png" alt="GADOR" width={120} height={38} style={{ objectFit: 'contain', height: 'auto', opacity: 0.7 }} />
          <p>© 2026 Gobierno Autónomo Departamental de Oruro · Todos los derechos reservados</p>
        </div>
      </footer>
    </div>
  );
}
