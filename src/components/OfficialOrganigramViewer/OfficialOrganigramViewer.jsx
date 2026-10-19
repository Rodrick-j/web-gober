'use client';

import { useMemo, useRef, useState } from 'react';
import Image from 'next/image';
import { AnimatePresence, motion, useReducedMotion } from 'framer-motion';
import styles from './OfficialOrganigramViewer.module.css';

const OFFICIAL_VIEWS = [
  {
    id: 'general',
    label: 'Vista general',
    eyebrow: 'Síntesis institucional',
    title: 'Organigrama General GADOR',
    description: 'Vista consolidada de la máxima autoridad ejecutiva, unidades de apoyo, secretarías y servicios departamentales.',
    src: '/organigrama-oficial-nuevo.png',
    width: 1491,
    height: 1055,
    download: '/organigrama-oficial-nuevo.png',
    source: 'Lámina institucional del Gobierno Autónomo Departamental de Oruro',
  },
  {
    id: 'executive',
    label: 'Órgano Ejecutivo',
    eyebrow: 'Anexo oficial · Ley Departamental N.º 295',
    title: 'Estructura del Órgano Ejecutivo',
    description: 'Jerarquía del Gobernador, Secretaría General, secretarías departamentales, direcciones, unidades y servicios.',
    src: '/organigrama/anexo-organo-ejecutivo.webp',
    width: 2016,
    height: 1224,
    download: '/organigrama/anexo-organo-ejecutivo.webp',
    source: 'Anexo 2 · Organigrama institucional oficial',
  },
  {
    id: 'assembly',
    label: 'Asamblea Legislativa',
    eyebrow: 'Anexo oficial · Ley Departamental N.º 295',
    title: 'Asamblea Legislativa Departamental',
    description: 'Estructura jerárquica del pleno, presidencia, comisiones, Oficialía Mayor y unidades de apoyo legislativo.',
    src: '/organigrama/anexo-asamblea-legislativa.webp',
    width: 2016,
    height: 1226,
    download: '/organigrama/anexo-asamblea-legislativa.webp',
    source: 'Anexo 1 · Asamblea Legislativa Departamental de Oruro',
  },
];

const MIN_ZOOM = 0.75;
const MAX_ZOOM = 1.75;
const ZOOM_STEP = 0.25;

export default function OfficialOrganigramViewer() {
  const [activeViewId, setActiveViewId] = useState('general');
  const [zoom, setZoom] = useState(1);
  const viewerPanelRef = useRef(null);
  const viewportRef = useRef(null);
  const prefersReducedMotion = useReducedMotion();

  const activeView = useMemo(
    () => OFFICIAL_VIEWS.find((view) => view.id === activeViewId) || OFFICIAL_VIEWS[0],
    [activeViewId]
  );

  const selectView = (viewId) => {
    setActiveViewId(viewId);
    setZoom(1);
    viewportRef.current?.scrollTo({ top: 0, left: 0, behavior: prefersReducedMotion ? 'auto' : 'smooth' });
  };

  const changeZoom = (amount) => {
    setZoom((current) => Math.min(MAX_ZOOM, Math.max(MIN_ZOOM, current + amount)));
  };

  const toggleFullscreen = async () => {
    if (!document.fullscreenEnabled || !viewerPanelRef.current) return;

    if (document.fullscreenElement) {
      await document.exitFullscreen();
      return;
    }

    await viewerPanelRef.current.requestFullscreen();
  };

  return (
    <motion.section
      className={styles.viewerPanel}
      ref={viewerPanelRef}
      initial={{ opacity: 0, y: 18 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: prefersReducedMotion ? 0.08 : 0.55 }}
      aria-labelledby="official-organigram-title"
    >
      <div className={styles.topAccent} aria-hidden="true" />

      <header className={styles.viewerHeader}>
        <div className={styles.headingBlock}>
          <span className={styles.officialSeal} aria-hidden="true">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.7">
              <path d="M12 3 19 6v5c0 4.8-2.7 8-7 10-4.3-2-7-5.2-7-10V6z" />
              <path d="m8.7 12.1 2.1 2.1 4.7-4.8" />
            </svg>
          </span>
          <div>
            <span className={styles.kicker}>Documentación institucional oficial</span>
            <h2 id="official-organigram-title">Estructura Organizacional GADOR</h2>
            <p>Consulta el organigrama por nivel jerárquico sin recorrer una lámina interminable.</p>
          </div>
        </div>

        <span className={styles.lawBadge}>
          <small>Base normativa</small>
          <strong>Ley Departamental N.º 295</strong>
        </span>
      </header>

      <nav className={styles.viewTabs} role="tablist" aria-label="Vistas del organigrama institucional">
        {OFFICIAL_VIEWS.map((view, index) => (
          <button
            key={view.id}
            type="button"
            role="tab"
            aria-selected={activeView.id === view.id}
            aria-controls="organigram-viewer"
            className={`${styles.viewTab} ${activeView.id === view.id ? styles.viewTabActive : ''}`}
            onClick={() => selectView(view.id)}
          >
            <span>{String(index + 1).padStart(2, '0')}</span>
            {view.label}
          </button>
        ))}
      </nav>

      <div className={styles.documentBar}>
        <div className={styles.documentIdentity}>
          <span>{activeView.eyebrow}</span>
          <strong>{activeView.title}</strong>
          <p>{activeView.description}</p>
        </div>

        <div className={styles.viewerControls} aria-label="Controles del visor">
          <button type="button" onClick={() => changeZoom(-ZOOM_STEP)} disabled={zoom <= MIN_ZOOM} aria-label="Alejar organigrama">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M5 12h14" /></svg>
          </button>
          <span className={styles.zoomValue}>{Math.round(zoom * 100)}%</span>
          <button type="button" onClick={() => changeZoom(ZOOM_STEP)} disabled={zoom >= MAX_ZOOM} aria-label="Acercar organigrama">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 5v14M5 12h14" /></svg>
          </button>
          <button type="button" onClick={() => setZoom(1)} aria-label="Restablecer zoom">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 9V4h5M20 15v5h-5M5 5l5 5M19 19l-5-5" /></svg>
          </button>
          <button type="button" onClick={toggleFullscreen} aria-label="Ver organigrama en pantalla completa">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 3H3v5M16 3h5v5M8 21H3v-5M16 21h5v-5" /></svg>
          </button>
        </div>
      </div>

      <div className={styles.viewport} id="organigram-viewer" ref={viewportRef} role="tabpanel">
        <AnimatePresence mode="wait">
          <motion.div
            key={activeView.id}
            className={styles.imageCanvas}
            style={{ width: `${zoom * 100}%` }}
            initial={prefersReducedMotion ? false : { opacity: 0, scale: 0.985 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: prefersReducedMotion ? 0.05 : 0.24 }}
          >
            <Image
              src={activeView.src}
              alt={`${activeView.title} del Gobierno Autónomo Departamental de Oruro`}
              width={activeView.width}
              height={activeView.height}
              sizes="(max-width: 768px) 100vw, 1280px"
              className={styles.organigramImage}
            />
          </motion.div>
        </AnimatePresence>
      </div>

      <footer className={styles.viewerFooter}>
        <div className={styles.sourceNote}>
          <span aria-hidden="true" />
          <p><strong>Fuente:</strong> {activeView.source}</p>
        </div>

        <div className={styles.downloadActions}>
          <a href={activeView.download} download>
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3v12m0 0 4-4m-4 4-4-4M5 20h14" /></svg>
            Descargar lámina
          </a>
          <a href="/organigrama/ley-295-organigrama-institucional-gador.pdf" target="_blank" rel="noopener noreferrer" className={styles.primaryAction}>
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6 3h8l4 4v14H6zM14 3v5h4M9 13h6M9 17h4" /></svg>
            Abrir PDF oficial
          </a>
        </div>
      </footer>
    </motion.section>
  );
}
