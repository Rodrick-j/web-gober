'use client';

import { useCallback, useEffect, useMemo, useState } from 'react';
import Image from 'next/image';
import { AnimatePresence, motion, useReducedMotion } from 'framer-motion';
import styles from './PopupComunicado.module.css';

const DEFAULT_IMAGE_RATIO = 4 / 5;
const MAX_COMUNICADOS = 5;
const INTERVALO_MS = 7000;

export default function PopupComunicado({ config }) {
  const [isVisible, setIsVisible] = useState(false);
  const [imageRatio, setImageRatio] = useState(DEFAULT_IMAGE_RATIO);
  const [indice, setIndice] = useState(0);
  const [pausado, setPausado] = useState(false);
  const prefersReducedMotion = useReducedMotion();

  // Lista de comunicados (hasta 5). Si solo existe el formato antiguo, se usa ese único comunicado.
  const lista = useMemo(() => {
    const nuevos = Array.isArray(config?.comunicados)
      ? config.comunicados.filter((c) => c?.imagen_url)
      : [];
    if (nuevos.length) return nuevos.slice(0, MAX_COMUNICADOS);
    return config?.imagen_url ? [{ imagen_url: config.imagen_url, enlace: config.enlace || '' }] : [];
  }, [config]);
  const total = lista.length;
  const actual = lista[Math.min(indice, Math.max(total - 1, 0))];

  useEffect(() => {
    if (!config?.activo || total === 0) {
      return;
    }

    const forceShow = window.location.search.includes('test_popup=1');
    const hasSeenPopup = sessionStorage.getItem('comunicado_visto');
    const hasSeenIntro = sessionStorage.getItem('introSeen');
    const delayTime = hasSeenIntro ? 1000 : 4500;

    if (!hasSeenPopup || forceShow) {
      const timer = window.setTimeout(() => setIsVisible(true), delayTime);
      return () => window.clearTimeout(timer);
    }
  }, [config, total]);

  const irA = useCallback((i) => {
    setImageRatio(DEFAULT_IMAGE_RATIO);
    setIndice(((i % total) + total) % total);
  }, [total]);

  // Carrusel automático (solo con más de un comunicado)
  useEffect(() => {
    if (!isVisible || total < 2 || pausado || prefersReducedMotion) return undefined;
    const timer = window.setInterval(() => irA(indice + 1), INTERVALO_MS);
    return () => window.clearInterval(timer);
  }, [isVisible, total, pausado, prefersReducedMotion, indice, irA]);

  const handleClose = useCallback(() => {
    setIsVisible(false);
    try {
      sessionStorage.setItem('comunicado_visto', 'true');
    } catch {
      // La experiencia sigue funcionando aunque el navegador bloquee el storage.
    }
  }, []);

  useEffect(() => {
    if (!isVisible) return;

    const previousOverflow = document.body.style.overflow;
    const handleKeyDown = (event) => {
      if (event.key === 'Escape') handleClose();
      if (total > 1 && event.key === 'ArrowRight') irA(indice + 1);
      if (total > 1 && event.key === 'ArrowLeft') irA(indice - 1);
    };

    document.body.style.overflow = 'hidden';
    window.addEventListener('keydown', handleKeyDown);

    return () => {
      document.body.style.overflow = previousOverflow;
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [handleClose, isVisible, total, indice, irA]);

  const title = config?.titulo?.trim() || 'Comunicado Oficial';
  const destinationUrl = actual?.enlace || actual?.imagen_url;
  const actionLabel = actual?.enlace ? 'Consultar información' : 'Ver documento completo';
  const formatClass = imageRatio > 1.15
    ? styles.landscape
    : imageRatio < 0.9
      ? styles.portrait
      : styles.square;
  const ContentWrapper = actual?.enlace ? 'a' : 'div';
  const wrapperProps = actual?.enlace
    ? {
        href: actual.enlace,
        target: '_blank',
        rel: 'noopener noreferrer',
        className: `${styles.imageLink} ${styles.imageLinkInteractive}`,
        'aria-label': 'Abrir información relacionada con el comunicado',
      }
    : { className: styles.imageLink };

  const overlayMotion = prefersReducedMotion
    ? { initial: { opacity: 1 }, animate: { opacity: 1 }, exit: { opacity: 0 } }
    : { initial: { opacity: 0 }, animate: { opacity: 1 }, exit: { opacity: 0 } };

  const dialogMotion = prefersReducedMotion
    ? { initial: false, animate: { opacity: 1 }, exit: { opacity: 0 } }
    : {
        initial: { opacity: 0, scale: 0.96, y: 22 },
        animate: { opacity: 1, scale: 1, y: 0 },
        exit: { opacity: 0, scale: 0.98, y: 12 },
      };

  return (
    <AnimatePresence>
      {isVisible && (
        <motion.div
          className={styles.overlay}
          onClick={handleClose}
          {...overlayMotion}
          transition={{ duration: prefersReducedMotion ? 0.08 : 0.24 }}
        >
          <motion.section
            className={`${styles.modalContent} ${formatClass}`}
            onClick={(event) => event.stopPropagation()}
            role="dialog"
            aria-modal="true"
            aria-labelledby="comunicado-title"
            {...dialogMotion}
            transition={
              prefersReducedMotion
                ? { duration: 0.08 }
                : { type: 'spring', stiffness: 340, damping: 30, mass: 0.88 }
            }
          >
            <div className={styles.accentRail} aria-hidden="true" />

            <div className={styles.officialStrip}>
              <span><i aria-hidden="true" /> Portal institucional</span>
              <span>Servicio de información ciudadana</span>
            </div>

            <header className={styles.modalHeader}>
              <div className={styles.brandSignature}>
                <Image
                  src="/imagotipo_gador_2026.png"
                  alt="Gobierno Autónomo Departamental de Oruro"
                  width={1072}
                  height={296}
                  sizes="(max-width: 640px) 138px, 205px"
                />
              </div>

              <span className={styles.headerDivider} aria-hidden="true" />

              <div className={styles.headerCopy}>
                <span>Dirección de Comunicación Social</span>
                <h2 id="comunicado-title">{title}</h2>
              </div>

              <span className={styles.officialBadge}>
                <small>Documento</small>
                <strong>Oficial</strong>
              </span>

              <button
                type="button"
                className={styles.closeButton}
                onClick={handleClose}
                aria-label="Cerrar comunicado"
                autoFocus
              >
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
                  <path d="m6 6 12 12M18 6 6 18" />
                </svg>
              </button>
            </header>

            <div className={styles.documentStage}>
              <div className={styles.documentMeta}>
                <span>
                  <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true">
                    <path d="M6.5 3.5h7l4 4v13h-11z" />
                    <path d="M13.5 3.5v4h4M9.5 12h5M9.5 15.5h5" />
                  </svg>
                  Comunicado institucional
                </span>
                <span>Publicación de interés público</span>
              </div>

              <div
                className={styles.documentViewport}
                onMouseEnter={() => setPausado(true)}
                onMouseLeave={() => setPausado(false)}
              >
                <motion.div
                  key={indice}
                  className={styles.slide}
                  initial={prefersReducedMotion ? false : { opacity: 0, x: 24 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ duration: prefersReducedMotion ? 0 : 0.35, ease: 'easeOut' }}
                >
                <ContentWrapper {...wrapperProps}>
                  <div className={styles.imageWrapper}>
                    <Image
                      src={actual.imagen_url}
                      alt={title}
                      fill
                      sizes="(max-width: 640px) 94vw, 960px"
                      className={styles.comunicadoImage}
                      onLoad={(event) => {
                        const { naturalWidth, naturalHeight } = event.currentTarget;
                        if (naturalWidth && naturalHeight) {
                          setImageRatio(naturalWidth / naturalHeight);
                        }
                      }}
                      priority
                      fetchPriority="high"
                    />
                  </div>
                </ContentWrapper>
                </motion.div>

                {total > 1 && (
                  <>
                    <button type="button" className={`${styles.navArrow} ${styles.navPrev}`} onClick={() => irA(indice - 1)} aria-label="Comunicado anterior">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round"><path d="m15 6-6 6 6 6" /></svg>
                    </button>
                    <button type="button" className={`${styles.navArrow} ${styles.navNext}`} onClick={() => irA(indice + 1)} aria-label="Comunicado siguiente">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round"><path d="m9 6 6 6-6 6" /></svg>
                    </button>
                    <div className={styles.dots} role="tablist" aria-label="Comunicados">
                      {lista.map((_, i) => (
                        <button
                          key={i}
                          type="button"
                          role="tab"
                          aria-selected={i === indice}
                          aria-label={`Comunicado ${i + 1} de ${total}`}
                          className={`${styles.dot} ${i === indice ? styles.dotActive : ''}`}
                          onClick={() => irA(i)}
                        />
                      ))}
                    </div>
                  </>
                )}
              </div>
            </div>

            <footer className={styles.modalFooter}>
              <div className={styles.publisher}>
                <span className={styles.publisherMark} aria-hidden="true">
                  <svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8">
                    <path d="M12 3 19 6v5c0 4.8-2.7 8-7 10-4.3-2-7-5.2-7-10V6z" />
                    <path d="m8.8 12 2.1 2.1 4.5-4.6" />
                  </svg>
                </span>
                <span>
                  <strong>Gobierno Autónomo Departamental de Oruro</strong>
                  <small>Fuente oficial · Comunicación institucional</small>
                </span>
              </div>

              <a
                href={destinationUrl}
                target="_blank"
                rel="noopener noreferrer"
                className={styles.actionButton}
              >
                <span>{actionLabel}</span>
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
                  <path d="M5 12h14M14 7l5 5-5 5" />
                </svg>
              </a>
            </footer>
          </motion.section>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
