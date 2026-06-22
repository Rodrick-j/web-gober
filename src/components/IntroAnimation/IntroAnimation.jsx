'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

export default function IntroAnimation({ isSeen }) {
  // Inicializar estado usando el prop que viene del servidor (evita hydration mismatch)
  const [show, setShow] = useState(!isSeen);

  useEffect(() => {
    // Si ya se vio en el servidor, no hacemos nada más
    if (isSeen) {
      document.body.style.overflow = 'unset';
      return;
    }

    // Si no se ha visto, configuramos el temporizador y el cookie para la próxima visita
    document.body.style.overflow = 'hidden';
    
    // Aumentamos a 4500ms (4.5s) para el efecto épico completo
    const timer = setTimeout(() => {
      setShow(false);
      document.body.style.overflow = 'unset';
      // Guardar cookie que expira en 1 día
      document.cookie = "introSeen=1; path=/; max-age=86400; samesite=lax";
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
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, scale: 1.05, filter: 'blur(15px)' }}
          transition={{ duration: 1.2, ease: [0.76, 0, 0.24, 1] }}
        >
          {/* Fondo de Video (Descomentar cuando subas el archivo oruro-intro.mp4 a la carpeta public)
          <video 
            autoPlay 
            loop 
            muted 
            playsInline
            className="intro-video-bg"
            poster="/escudo_oruro.jpg"
          >
            <source src="/oruro-intro.mp4" type="video/mp4" />
          </video>
          */}
          
          {/* Overlay Rojo Carmesí con degradado */}
          <div className="intro-overlay"></div>

          {/* Líneas Geométricas Animadas (Textura de Complementariedad) */}
          <div className="svg-container">
            <svg viewBox="0 0 100 100" preserveAspectRatio="none" className="geometric-lines">
              {/* Marco exterior dorado */}
              <motion.path
                d="M 5 5 L 95 5 L 95 95 L 5 95 Z"
                fill="transparent"
                stroke="#ffb843"
                strokeWidth="0.1"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 0.4 }}
                transition={{ duration: 3, ease: "easeInOut" }}
              />
              {/* Marco interior blanco */}
              <motion.path
                d="M 15 15 L 85 15 L 85 85 L 15 85 Z"
                fill="transparent"
                stroke="#ffffff"
                strokeWidth="0.05"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 0.2 }}
                transition={{ duration: 2.5, delay: 0.5, ease: "easeInOut" }}
              />
              {/* Patrones de Textura de Complementariedad (Esquinas) */}
              <motion.path
                d="M 10 20 L 20 20 L 20 10 M 90 20 L 80 20 L 80 10 M 10 80 L 20 80 L 20 90 M 90 80 L 80 80 L 80 90"
                fill="transparent"
                stroke="#ffb843"
                strokeWidth="0.2"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 0.6 }}
                transition={{ duration: 2, delay: 1, ease: "easeOut" }}
              />
            </svg>
          </div>

          <div className="intro-content">
            <div style={{ overflow: 'hidden' }}>
              <motion.h2
                className="intro-gov-text"
                initial={{ y: "100%", opacity: 0, letterSpacing: "0px" }}
                animate={{ y: 0, opacity: 1, letterSpacing: "8px" }}
                transition={{ duration: 1.5, delay: 0.5, ease: [0.33, 1, 0.68, 1] }}
              >
                Gobierno Autónomo Departamental de
              </motion.h2>
            </div>
            
            <div style={{ overflow: 'hidden', padding: '10px 0' }}>
              <motion.h1
                className="intro-title-oruro"
                initial={{ y: "100%", opacity: 0, filter: 'blur(20px)', scale: 1.1 }}
                animate={{ y: 0, opacity: 1, filter: 'blur(0px)', scale: 1 }}
                transition={{ duration: 1.8, delay: 1.2, ease: [0.33, 1, 0.68, 1] }}
              >
                ORURO
              </motion.h1>
            </div>

            <motion.div
              className="intro-divider"
              initial={{ scaleX: 0, opacity: 0 }}
              animate={{ scaleX: 1, opacity: 1 }}
              transition={{ duration: 1.5, delay: 2, ease: "easeInOut" }}
            />

            <div style={{ overflow: 'hidden' }}>
              <motion.img
                src="/images/marca_gobierno_blanco.png"
                alt="Marca Gobierno"
                className="intro-marca-img"
                initial={{ opacity: 0, y: 50 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 1.2, delay: 2.5, type: "spring" }}
              />
            </div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
