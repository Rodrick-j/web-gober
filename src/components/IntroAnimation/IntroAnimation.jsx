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
    // Comprobar cookie en el cliente si no viene del prop del servidor
    const seen = isSeen !== undefined ? isSeen : document.cookie.includes('introSeen=1');
    if (seen) {
      document.body.style.overflow = 'unset';
      return;
    }

    setShow(true);
    document.body.style.overflow = 'hidden';
    
    // Reducido a 1600ms para carga ultrarrápida
    const timer = setTimeout(() => {
      handleClose();
    }, 1600);

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
          exit={{ opacity: 0, scale: 1.05, filter: 'blur(15px)' }}
          transition={{ duration: 0.8, ease: [0.76, 0, 0.24, 1] }}
        >
          <div className="intro-overlay"></div>

          <div className="svg-container">
            <svg viewBox="0 0 100 100" preserveAspectRatio="none" className="geometric-lines">
              <motion.path
                d="M 5 5 L 95 5 L 95 95 L 5 95 Z"
                fill="transparent"
                stroke="#ffb843"
                strokeWidth="0.1"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 0.4 }}
                transition={{ duration: 1.2, ease: "easeInOut" }}
              />
              <motion.path
                d="M 15 15 L 85 15 L 85 85 L 15 85 Z"
                fill="transparent"
                stroke="#ffffff"
                strokeWidth="0.05"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 0.2 }}
                transition={{ duration: 1.0, delay: 0.2, ease: "easeInOut" }}
              />
              <motion.path
                d="M 10 20 L 20 20 L 20 10 M 90 20 L 80 20 L 80 10 M 10 80 L 20 80 L 20 90 M 90 80 L 80 80 L 80 90"
                fill="transparent"
                stroke="#ffb843"
                strokeWidth="0.2"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 0.6 }}
                transition={{ duration: 0.8, delay: 0.3, ease: "easeOut" }}
              />
            </svg>
          </div>

          <div className="intro-content">
            <div style={{ overflow: 'hidden' }}>
              <motion.h2
                className="intro-gov-text"
                initial={{ y: "100%", opacity: 0, letterSpacing: "0px" }}
                animate={{ y: 0, opacity: 1, letterSpacing: "6px" }}
                transition={{ duration: 0.7, delay: 0.2, ease: [0.33, 1, 0.68, 1] }}
              >
                Gobierno Autónomo Departamental de
              </motion.h2>
            </div>
            
            <div style={{ overflow: 'hidden', padding: '10px 0' }}>
              <motion.h1
                className="intro-title-oruro"
                initial={{ y: "100%", opacity: 0, filter: 'blur(10px)', scale: 1.05 }}
                animate={{ y: 0, opacity: 1, filter: 'blur(0px)', scale: 1 }}
                transition={{ duration: 0.8, delay: 0.4, ease: [0.33, 1, 0.68, 1] }}
              >
                ORURO
              </motion.h1>
            </div>

            <motion.div
              className="intro-divider"
              initial={{ scaleX: 0, opacity: 0 }}
              animate={{ scaleX: 1, opacity: 1 }}
              transition={{ duration: 0.6, delay: 0.7, ease: "easeInOut" }}
            />

            <div style={{ overflow: 'hidden' }}>
              <motion.img
                src="/images/marca_gobierno_blanco.png"
                alt="Marca Gobierno"
                className="intro-marca-img"
                initial={{ opacity: 0, y: 30 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6, delay: 0.9, type: "spring" }}
              />
            </div>

            <motion.p
              style={{ color: 'rgba(255,255,255,0.6)', fontSize: '0.75rem', marginTop: '1.5rem', letterSpacing: '2px', textTransform: 'uppercase' }}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 1.0 }}
            >
              [ Clic para entrar ]
            </motion.p>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
