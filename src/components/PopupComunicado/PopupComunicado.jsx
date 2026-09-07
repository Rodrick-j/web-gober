'use client';

import { useState, useEffect } from 'react';
import Image from 'next/image';
import { motion, AnimatePresence } from 'framer-motion';
import styles from './PopupComunicado.module.css';

export default function PopupComunicado({ config }) {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    // Verificar si el comunicado está activo y tiene imagen
    if (!config?.activo || !config?.imagen_url) {
      return;
    }

    // Comprobar si ya se mostró en esta sesión, a menos que forcemos con ?test_popup=1
    const forceShow = window.location.search.includes('test_popup=1');
    const hasSeenPopup = sessionStorage.getItem('comunicado_visto');
    const hasSeenIntro = sessionStorage.getItem('introSeen');
    
    // Si no ha visto la animación de intro, esperamos a que termine (3500ms + margen).
    // Si ya la vio, solo esperamos 1000ms.
    const delayTime = hasSeenIntro ? 1000 : 4500;
    
    if (!hasSeenPopup || forceShow) {
      // Retraso ajustado para no solaparse con la animación inicial
      const timer = setTimeout(() => {
        setIsVisible(true);
      }, delayTime);
      return () => clearTimeout(timer);
    }
  }, [config]);

  const handleClose = () => {
    setIsVisible(false);
    // Guardar en sessionStorage para que no vuelva a salir hasta que cierre el navegador
    sessionStorage.setItem('comunicado_visto', 'true');
  };

  const ContentWrapper = config?.enlace ? 'a' : 'div';
  const wrapperProps = config?.enlace 
    ? { href: config.enlace, target: "_blank", rel: "noopener noreferrer", className: styles.imageLink } 
    : { className: styles.imageLink };

  return (
    <AnimatePresence>
      {isVisible && (
        <div 
          className={styles.overlay} 
          onClick={handleClose} 
        >
          <motion.div
            className={styles.modalContent}
            onClick={(e) => e.stopPropagation()}
            initial={{ opacity: 0, scale: 0.9, y: 30 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.9, y: 30 }}
            transition={{ type: "spring", stiffness: 300, damping: 25 }}
          >
            <button 
              className={styles.closeButton} 
              onClick={handleClose}
              aria-label="Cerrar comunicado"
            >
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
            </button>
            
            {/* Banner superior más profesional */}
            <div className={styles.modalHeader}>
              <span className={styles.headerIcon}>📢</span>
              Comunicado Oficial
            </div>
            
            <ContentWrapper {...wrapperProps} style={{ ...wrapperProps.style, display: 'block', width: '100%', borderTopLeftRadius: 0, borderTopRightRadius: 0 }}>
              <div className={styles.imageWrapper} style={{ borderTopLeftRadius: 0, borderTopRightRadius: 0 }}>
                <Image
                  src={config.imagen_url}
                  alt="Comunicado Importante"
                  fill
                  sizes="(max-width: 768px) 100vw, 800px"
                  style={{ objectFit: 'contain' }}
                  priority={true}
                  loading="eager"
                  fetchPriority="high"
                />
              </div>
            </ContentWrapper>
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  );
}
