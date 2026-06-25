'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

export default function IntroAnimation({ isSeen }) {
  const [show, setShow] = useState(false);

  const handleClose = () => {
    setShow(false);
    document.body.style.overflow = 'unset';
    document.cookie = "introSeen=1; path=/; max-age=86400; samesite=lax";
  };

  useEffect(() => {
    const seen = isSeen !== undefined ? isSeen : document.cookie.includes('introSeen=1');
    if (seen) {
      document.body.style.overflow = 'unset';
      return;
    }

    setShow(true);
    document.body.style.overflow = 'hidden';
    
    // Increased slightly for a more majestic, unhurried feel
    const timer = setTimeout(() => {
      handleClose();
    }, 2800);

    return () => {
      clearTimeout(timer);
      document.body.style.overflow = 'unset';
    };
  }, [isSeen]);

  return (
    <AnimatePresence>
      {show && (
        <motion.div
          className="intro-container"
          onClick={handleClose}
          style={{ cursor: 'pointer' }}
          title="Haz clic para saltar la introducción"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, filter: 'blur(20px)', transition: { duration: 1.2, ease: "easeInOut" } }}
        >
          {/* Fondo elegante con viñeta profunda */}
          <div className="intro-overlay"></div>
          
          {/* Textura sutil institucional */}
          <div className="intro-texture"></div>

          <div className="intro-content">
            <div style={{ overflow: 'hidden' }}>
              <motion.h2
                className="intro-gov-text"
                initial={{ y: "20px", opacity: 0, letterSpacing: "2px" }}
                animate={{ y: 0, opacity: 1, letterSpacing: "8px" }}
                transition={{ duration: 1.2, delay: 0.3, ease: [0.25, 1, 0.5, 1] }}
              >
                Gobierno Autónomo Departamental de
              </motion.h2>
            </div>
            
            <div style={{ overflow: 'hidden', padding: '5px 0' }}>
              <motion.h1
                className="intro-title-oruro"
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ duration: 1.5, delay: 0.5, ease: "easeOut" }}
              >
                ORURO
              </motion.h1>
            </div>

            <motion.div
              className="intro-divider"
              initial={{ scaleX: 0, opacity: 0 }}
              animate={{ scaleX: 1, opacity: 1 }}
              transition={{ duration: 1.2, delay: 0.8, ease: "easeInOut" }}
            />

            <div style={{ overflow: 'hidden' }}>
              <motion.img
                src="/images/marca_gobierno_blanco.png"
                alt="Marca Gobierno"
                className="intro-marca-img"
                initial={{ opacity: 0, y: 15, filter: 'blur(5px)' }}
                animate={{ opacity: 1, y: 0, filter: 'blur(0px)' }}
                transition={{ duration: 1.2, delay: 1.1, ease: "easeOut" }}
              />
            </div>

            <motion.p
              className="intro-skip-text"
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.5 }}
              transition={{ delay: 1.8, duration: 1 }}
            >
              Cargando portal oficial...
            </motion.p>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
