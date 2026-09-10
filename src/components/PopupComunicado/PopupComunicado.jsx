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
    // Verificar si el comunicado está activo y tiene imagen.
    if (!config?.activo || !config?.imagen_url) {
      return;
    }

    // Mostrar nuevamente con ?test_popup=1 aunque ya se haya visto en esta sesión.
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
  const actionLabel = config?.enlace ? 'Más información' : 'Ver imagen completa';
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
        initial: { opacity: 0, scale: 0.94, y: 28 },
        animate: { opacity: 1, scale: 1, y: 0 },
        exit: { opacity: 0, scale: 0.97, y: 16 },
      };

  return (
    <AnimatePresence>
      {isVisible && (
        <motion.div
          className={styles.overlay}
          onClick={handleClose}
          {...overlayMotion}
          transition={{ duration: prefersReducedMotion ? 0.08 : 0.28 }}
        >
          <motion.section
            className={`${styles.modalContent} ${formatClass}`}
            style={{ '--document-ratio': imageRatio }}
            onClick={(event) => event.stopPropagation()}
            role="dialog"
            aria-modal="true"
            aria-labelledby="comunicado-title"
            {...dialogMotion}
            transition={
              prefersReducedMotion
                ? { duration: 0.08 }
                : { type: 'spring', stiffness: 320, damping: 28, mass: 0.85 }
            }
          >
            <div className={styles.accentRail} aria-hidden="true" />

            <header className={styles.modalHeader}>
              <div className={styles.headerIcon} aria-hidden="true">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M4 13.4V9.7c0-.7.5-1.2 1.2-1.2h2.1l7.1-3.7c.8-.4 1.8.2 1.8 1.1v11.3c0 .9-1 1.5-1.8 1.1l-7.1-3.7H5.2c-.7 0-1.2-.5-1.2-1.2Z" fill="currentColor" />
                  <path d="m7.5 14.7 1.1 4.1c.1.5.6.8 1.1.8h.8c.7 0 1.2-.7.9-1.4l-1.3-2.1" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round" />
                  <path d="M19 8.2c.8.9 1.2 2 1.2 3.2 0 1.3-.4 2.4-1.2 3.3" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" />
                </svg>
              </div>

              <div className={styles.headerCopy}>
                <span>Información institucional</span>
                <h2 id="comunicado-title">{title}</h2>
              </div>

              <span className={styles.officialBadge}>
                <span aria-hidden="true" />
                Oficial
              </span>

              <button
                className={styles.closeButton}
                onClick={handleClose}
                aria-label="Cerrar comunicado"
                autoFocus
              >
                <svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round">
                  <path d="m6 6 12 12M18 6 6 18" />
                </svg>
              </button>
            </header>

            <div className={styles.documentStage}>
              <span className={styles.cornerTop} aria-hidden="true" />
              <span className={styles.cornerBottom} aria-hidden="true" />

              <ContentWrapper {...wrapperProps}>
                <div className={styles.imageWrapper}>
                  <Image
                    src={config.imagen_url}
                    alt={title}
                    fill
                    sizes="(max-width: 640px) 92vw, 900px"
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

                {config?.enlace && (
                  <span className={styles.imageHint}>
                    Abrir comunicado
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M7 17 17 7M7 7h10v10" />
                    </svg>
                  </span>
                )}
              </ContentWrapper>
            </div>

            <footer className={styles.modalFooter}>
              <div className={styles.publisher}>
                <span className={styles.publisherMark} aria-hidden="true">G</span>
                <span>
                  <strong>Gobierno Autónomo Departamental de Oruro</strong>
                  <small><i aria-hidden="true" /> Publicación institucional verificada</small>
                </span>
              </div>

              <a
                href={destinationUrl}
                target="_blank"
                rel="noopener noreferrer"
                className={styles.actionButton}
              >
                <span>{actionLabel}</span>
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                  <path d="M7 17 17 7M7 7h10v10" />
                </svg>
              </a>
            </footer>
          </motion.section>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
