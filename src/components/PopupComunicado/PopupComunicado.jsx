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
        <div className={styles.overlay} onClick={handleClose}>
          <motion.div
            className={styles.popupContainer}
            onClick={(e) => e.stopPropagation()} // Evitar que clic adentro cierre el modal
            initial={{ opacity: 0, scale: 0.8, y: 50 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.8, y: 50 }}
            transition={{ duration: 0.3, ease: "easeOut" }}
          >
            <button 
              className={styles.closeButton} 
              onClick={handleClose}
              aria-label="Cerrar comunicado"
            >
              ✕
            </button>
            
            <ContentWrapper {...wrapperProps}>
              <div className={styles.imageWrapper}>
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
