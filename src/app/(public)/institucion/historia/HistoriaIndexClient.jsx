'use client';

import React, { useState } from 'react';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import styles from './historia.module.css';
import { municipios } from './municipiosData';
import Link from 'next/link';

const ChakanaIcon = ({ className }) => (
  <svg viewBox="0 0 100 100" className={className} fill="currentColor">
    <rect x="40" y="0" width="20" height="100" />
    <rect x="0" y="40" width="100" height="20" />
    <rect x="25" y="15" width="50" height="70" />
    <rect x="15" y="25" width="70" height="50" />
    <circle cx="50" cy="50" r="8" fill="rgba(255,255,255,0.2)" />
  </svg>
);

export default function HistoriaIndexClient() {
  const [search, setSearch] = useState('');

  const filtered = municipios.filter(m =>
    m.nombre.toLowerCase().includes(search.toLowerCase()) ||
    m.provincia.toLowerCase().includes(search.toLowerCase())
  );

  const capital = municipios.find(m => m.esCapital);

  return (
    <div className={styles.page}>
      <AnimatedBackground />

      {/* === HERO === */}
      <div className={styles.hero}>
        <div className={styles.heroBg} />
        <ChakanaIcon className={styles.heroChakana} />
        <ChakanaIcon className={styles.heroChakana2} />

        <div className={styles.heroContent}>
          <nav className={styles.heroBreadcrumb}>
            <a href="/">Inicio</a><span>›</span>
            <a href="/institucion">Institución</a><span>›</span>
            <span style={{ color: 'rgba(255,255,255,0.9)' }}>Historia</span>
          </nav>

          <div className={styles.heroBadge}>
            <span className={styles.heroBadgeDot} />
            Departamento de Oruro · Bolivia
          </div>

          <div className={styles.heroTop}>
            <div>
              <h1 className={styles.heroTitle}>Municipios de Oruro</h1>
              <p className={styles.heroSubtitle}>
                Explora los {municipios.length} municipios del Departamento de Oruro: historia, geografía, gobierno y datos oficiales.
              </p>
            </div>

            <div className={styles.heroStats}>
              <div className={styles.heroStat}>
                <span className={styles.heroStatValue}>{municipios.length}</span>
                <span className={styles.heroStatLabel}>Municipios</span>
              </div>
              <div className={styles.heroStat}>
                <span className={styles.heroStatValue}>10</span>
                <span className={styles.heroStatLabel}>Provincias</span>
              </div>
              <div className={styles.heroStat}>
                <span className={styles.heroStatValue}>UTC-4</span>
                <span className={styles.heroStatLabel}>Zona horaria</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* === MAIN CONTENT === */}
      <div className={styles.tabsWrapper}>

        {/* CAPITAL DESTACADA */}
        {capital && (
          <Link href={`/institucion/historia/${capital.slug}`} className={styles.capitalCard}>
            <div className={styles.capitalCardLeft}>
              <span className={styles.capitalBadge}>⭐ Capital del Departamento</span>
              <h2 className={styles.capitalTitle}>{capital.nombre}</h2>
              <p className={styles.capitalDesc}>{capital.descripcion}</p>
              <div className={styles.capitalStats}>
                <span>{capital.altitud.toLocaleString()} m altitud</span>
                <span>·</span>
                <span>{capital.poblacion} hab.</span>
                <span>·</span>
                <span>Prov. {capital.provincia}</span>
              </div>
            </div>
            <div className={styles.capitalCardRight}>
              <span className={styles.capitalArrow}>→</span>
            </div>
          </Link>
        )}

        {/* BUSCADOR */}
        <div className={styles.searchBox}>
          <span className={styles.searchIcon}>🔍</span>
          <input
            type="text"
            placeholder="Buscar municipio o provincia..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            className={styles.searchInput}
          />
          {search && (
            <button onClick={() => setSearch('')} className={styles.searchClear}>✕</button>
          )}
        </div>

        {/* GRID DE MUNICIPIOS */}
        <div className={styles.municipiosGrid}>
          {filtered.filter(m => !m.esCapital).map((m) => (
            <Link key={m.slug} href={`/institucion/historia/${m.slug}`} className={styles.municipioCard}>
              <div className={styles.municipioCardTop}>
                <span className={styles.municipioCardIcon}>🏘️</span>
                <span className={styles.municipioProv}>{m.provincia}</span>
              </div>
              <h3 className={styles.municipioNombre}>{m.nombre}</h3>
              <p className={styles.municipioGentilicio}>{m.gentilicio}</p>
              <div className={styles.municipioStats}>
                {m.altitud && <span>🏔️ {m.altitud.toLocaleString()} m</span>}
                {m.poblacion !== 'N/D' && <span>👥 {m.poblacion}</span>}
              </div>
              <div className={styles.municipioArrow}>Ver más →</div>
            </Link>
          ))}
        </div>

        {filtered.length === 0 && (
          <div className={styles.noResults}>
            <span>🔍</span>
            <p>No se encontró &quot;{search}&quot;</p>
          </div>
        )}

      </div>
    </div>
  );
}
