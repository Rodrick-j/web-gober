'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

export default function IntroAnimation({ isSeen }) {
  const [show, setShow] = useState(false);

  const handleClose = () => {
    setShow(false);
    document.body.style.overflow = 'unset';
    // Se elimina la cookie para que SIEMPRE aparezca como pidió el usuario
  };

  useEffect(() => {
    // Se fuerza a que siempre muestre la intro
    setShow(true);
    document.body.style.overflow = 'hidden';
    
    // Animaciones ultra lentas y profesionales, más tiempo de respiración
    const timer = setTimeout(() => {
      handleClose();
    }, 4500);

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
                initial={{ opacity: 0, y: 15, filter: 'blur(10px)' }}
                animate={{ opacity: 0.9, y: 0, filter: 'blur(0px)' }}
                transition={{ duration: 1.8, delay: 0.2, ease: [0.21, 0.47, 0.32, 0.98] }}
              >
                Gobierno Autónomo Departamental de
              </motion.h2>
            </div>
            
            <div style={{ overflow: 'hidden', padding: '10px 0' }}>
              <motion.h1
                className="intro-title-oruro"
                initial={{ opacity: 0, scale: 1.05, filter: 'blur(15px)' }}
                animate={{ opacity: 1, scale: 1, filter: 'blur(0px)' }}
                transition={{ duration: 2.2, delay: 0.6, ease: [0.21, 0.47, 0.32, 0.98] }}
              >
                ORURO
              </motion.h1>
            </div>

            <motion.div
              className="intro-divider"
              initial={{ scaleX: 0, opacity: 0 }}
              animate={{ scaleX: 1, opacity: 1 }}
              transition={{ duration: 1.5, delay: 1.2, ease: "easeInOut" }}
            />

            <div style={{ overflow: 'hidden' }}>
              <motion.img
                src="/images/marca_gobierno_blanco.png"
                alt="Marca Gobierno"
                className="intro-marca-img"
                initial={{ opacity: 0, y: 25, filter: 'blur(8px)' }}
                animate={{ opacity: 1, y: 0, filter: 'blur(0px)' }}
                transition={{ duration: 1.8, delay: 1.5, ease: [0.21, 0.47, 0.32, 0.98] }}
              />
            </div>

            <motion.p
              className="intro-skip-text"
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.5 }}
              transition={{ delay: 2.5, duration: 1.5 }}
            >
              Cargando portal oficial...
            </motion.p>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
