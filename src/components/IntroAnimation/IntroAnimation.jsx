'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

export default function IntroAnimation({ isSeen }) {
  const [show, setShow] = useState(true);
  const [isClient, setIsClient] = useState(false);

  const handleClose = () => {
    setShow(false);
    document.body.style.overflow = 'unset';
  };

  useEffect(() => {
    setIsClient(true);
    if (sessionStorage.getItem('intro-seen-v5')) {
      setShow(false);
      return;
    }
    sessionStorage.setItem('intro-seen-v5', 'true');
    document.body.style.overflow = 'hidden';

    // Auto close after 3.2 seconds
    const timer = setTimeout(() => handleClose(), 3200);

    return () => {
      clearTimeout(timer);
      document.body.style.overflow = 'unset';
    };
  }, []);

  const oruroText = 'ORURO'.split('');
  const exitEase = { duration: 0.9, ease: [0.22, 1, 0.36, 1] };

  // Durante SSR, mostramos una pantalla oscura para ocultar la página.
  // Así evitamos que la página se vea por un segundo antes de que inicie la intro.
  if (!isClient) {
    return (
      <div 
        className="intro-container" 
        style={{ background: 'radial-gradient(circle at center, #1a0505 0%, #000000 100%)' }} 
      />
    );
  }

  return (
    <AnimatePresence>
      {show && (
        <motion.div
          className="intro-container"
          onClick={handleClose}
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, scale: 1.05, filter: 'blur(10px)', transition: exitEase }}
        >
          {/* Pattern Background Overlay */}
          <div className="intro-pattern-overlay" />

          {/* Ambient Crimson Glow */}
          <motion.div
            className="intro-ambient-glow-crimson"
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 2, ease: "easeOut" }}
          />

          {/* Top Logo */}
          <motion.div
            className="intro-top-logo-container"
            initial={{ opacity: 0, y: -30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 1, delay: 0.2, ease: 'easeOut' }}
          >
            <img
              src="/imagotipo_gador_2026.png"
              alt="Gobernación de Oruro 2026"
              className="intro-top-logo"
            />
          </motion.div>

          <div className="intro-content">
            <motion.h2
              className="intro-gov-text"
              initial={{ opacity: 0, y: -10, letterSpacing: '0.4em' }}
              animate={{ opacity: 1, y: 0, letterSpacing: '0.25em' }}
              transition={{ duration: 1, delay: 0.1, ease: 'easeOut' }}
            >
              Gobierno Autónomo Departamental de
            </motion.h2>

            <div className="intro-title-wrapper">
              {oruroText.map((letter, index) => (
                <motion.span
                  key={index}
                  className="intro-title-letter"
                  initial={{ opacity: 0, y: 40, filter: 'blur(8px)' }}
                  animate={{ opacity: 1, y: 0, filter: 'blur(0px)' }}
                  transition={{
                    duration: 0.8,
                    delay: 0.3 + index * 0.1,
                    ease: [0.16, 1, 0.3, 1],
                  }}
                >
                  {letter}
                </motion.span>
              ))}
            </div>

            <motion.div
              className="intro-divider-container"
              initial={{ scaleX: 0, opacity: 0 }}
              animate={{ scaleX: 1, opacity: 1 }}
              transition={{ duration: 1, delay: 0.9, ease: 'easeInOut' }}
            >
              <div className="intro-divider-core" />
            </motion.div>

            <motion.div
              className="intro-logo-container"
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ duration: 1, delay: 1.2, ease: 'easeOut' }}
            >
              <img
                src="/images/marca_gobierno_blanco.png"
                alt="Gobernación de Oruro"
                className="intro-logo"
              />
            </motion.div>
            
            <motion.div
              className="intro-skip-hint"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 1.5, duration: 1 }}
            >
              Toca para saltar
            </motion.div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}

