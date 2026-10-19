'use client';

import { useCallback, useEffect, useState } from 'react';
import Image from 'next/image';
import { AnimatePresence, motion, useReducedMotion } from 'framer-motion';
import styles from './PopupComunicado.module.css';

const DEFAULT_IMAGE_RATIO = 4 / 5;

export default function PopupComunicado({ config }) {
  const [isVisible, setIsVisible] = useState(false);
  const [imageRatio, setImageRatio] = useState(DEFAULT_IMAGE_RATIO);
  const prefersReducedMotion = useReducedMotion();

  useEffect(() => {
    if (!config?.activo || !config?.imagen_url) {
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
  }, [config]);

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
    };

    document.body.style.overflow = 'hidden';
    window.addEventListener('keydown', handleKeyDown);

    return () => {
      document.body.style.overflow = previousOverflow;
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [handleClose, isVisible]);

  const title = config?.titulo?.trim() || 'Comunicado Oficial';
  const destinationUrl = config?.enlace || config?.imagen_url;
  const actionLabel = config?.enlace ? 'Consultar información' : 'Ver documento completo';
  const formatClass = imageRatio > 1.15
    ? styles.landscape
    : imageRatio < 0.9
      ? styles.portrait
      : styles.square;
  const ContentWrapper = config?.enlace ? 'a' : 'div';
  const wrapperProps = config?.enlace
    ? {
        href: config.enlace,
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

              <div className={styles.documentViewport}>
                <ContentWrapper {...wrapperProps}>
                  <div className={styles.imageWrapper}>
                    <Image
                      src={config.imagen_url}
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
