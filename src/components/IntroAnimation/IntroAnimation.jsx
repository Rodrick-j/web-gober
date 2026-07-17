'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

/* ─────────────────────────────────────────────────────
   Genera N copias de un motivo para llenar una franja
───────────────────────────────────────────────────── */
function MotivoStrip({ src, alt, count = 14, className }) {
  return (
    <div className={className}>
      {Array.from({ length: count }).map((_, i) => (
        // eslint-disable-next-line @next/next/no-img-element
        <img key={i} src={src} alt={alt} className="motivo-img" draggable={false} />
      ))}
    </div>
  );
}

export default function IntroAnimation({ isSeen }) {
  const [show, setShow]         = useState(false);
  const [progress, setProgress] = useState(0);

  const handleClose = () => {
    setShow(false);
    document.body.style.overflow = 'unset';
  };

  useEffect(() => {
    if (sessionStorage.getItem('intro-seen')) {
      setShow(false);
      return;
    }
    sessionStorage.setItem('intro-seen', 'true');
    setShow(true);
    document.body.style.overflow = 'hidden';

    const progressInterval = setInterval(() => {
      setProgress(prev => {
        if (prev >= 100) { clearInterval(progressInterval); return 100; }
        return prev + 2;
      });
    }, 50);

    const timer = setTimeout(() => handleClose(), 4800);

    return () => {
      clearTimeout(timer);
      clearInterval(progressInterval);
      document.body.style.overflow = 'unset';
    };
  }, [isSeen]);

  const oruroText = 'ORURO'.split('');
  const exitEase  = { duration: 1.1, ease: [0.22, 1, 0.36, 1] };

  // Alternamos motivo_10 y motivo_11 en las franjas
  const M10 = '/motivos/motivo_10.png';
  const M11 = '/motivos/motivo_11.png';

  return (
    <AnimatePresence>
      {show && (
        <motion.div
          className="intro-container"
          onClick={handleClose}
          title="Haz clic para saltar"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, scale: 1.05, filter: 'blur(5px)', transition: exitEase }}
        >
          {/* Gradiente de ambiente carmesí */}
          <motion.div
            className="intro-overlay"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 2 }}
          />

          {/* Textura de puntos */}
          <div className="intro-texture" />

          {/* ── Halo central resplandeciente ── */}
          <div className="intro-center-glow" />

          {/* ── Anillos giratorios ── */}
          <div className="intro-ring-1" />
          <div className="intro-ring-2" />

          {/* ── Ondas radiales pulsantes ── */}
          <div className="intro-wave intro-wave-1" />
          <div className="intro-wave intro-wave-2" />
          <div className="intro-wave intro-wave-3" />

          {/* ── Barrido de luz ── */}
          <div className="intro-scan-beam" />

          {/* ── Líneas shimmer diagonales ── */}
          <div className="intro-shimmer" />

          {/* ═══ MARCO DE MOTIVOS ═══ */}
          <motion.div
            className="intro-motivos-frame"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 1.8, ease: 'easeOut' }}
          >
            {/* Franja superior — motivo_10 */}
            <MotivoStrip src={M10} alt="Motivo cultural Oruro" count={16} className="motivo-strip-top" />
            {/* Franja inferior — motivo_10 (invertida via CSS) */}
            <MotivoStrip src={M10} alt="Motivo cultural Oruro" count={16} className="motivo-strip-bottom" />
            {/* Franja izquierda — motivo_11 (sin solapar esquinas) */}
            <MotivoStrip src={M11} alt="Motivo cultural Oruro" count={12} className="motivo-strip-left" />
            {/* Franja derecha — motivo_11 (sin solapar esquinas) */}
            <MotivoStrip src={M11} alt="Motivo cultural Oruro" count={12} className="motivo-strip-right" />
          </motion.div>

          {/* Orbes de luz ambiental */}
          <motion.div
            className="intro-orb orb-1"
            animate={{ scale:[1,1.18,1], opacity:[.7,1,.7] }}
            transition={{ duration:7, repeat:Infinity, ease:'easeInOut' }}
          />
          <motion.div
            className="intro-orb orb-2"
            animate={{ scale:[1,1.22,1], opacity:[.5,.85,.5] }}
            transition={{ duration:9, repeat:Infinity, ease:'easeInOut', delay:1.5 }}
          />
          <motion.div
            className="intro-orb orb-3"
            animate={{ y:[0,-18,0], opacity:[.5,.9,.5] }}
            transition={{ duration:6, repeat:Infinity, ease:'easeInOut', delay:.8 }}
          />

          {/* Partículas doradas */}
          <div className="intro-particles">
            {[...Array(8)].map((_, i) => <div key={i} className="particle" />)}
          </div>

          {/* ═══ CONTENIDO CENTRAL ═══ */}
          <div className="intro-content">

            {/* "Gobierno Autónomo Departamental de" */}
            <div className="intro-text-wrapper">
              <motion.h2
                className="intro-gov-text"
                initial={{ opacity:0, y:-8, letterSpacing:'0.5em' }}
                animate={{ opacity:1, y:0,  letterSpacing:'0.30em' }}
                transition={{ duration:1.4, delay:.2, ease:'easeOut' }}
              >
                Gobierno Autónomo Departamental de
              </motion.h2>
            </div>

            {/* O-R-U-R-O */}
            <div className="intro-title-wrapper">
              {oruroText.map((letter, index) => (
                <motion.span
                  key={index}
                  className="intro-title-letter"
                  initial={{ opacity:0, y:55, filter:'blur(10px)' }}
                  animate={{ opacity:1, y:0,  filter:'blur(0px)' }}
                  transition={{
                    duration: 1.0,
                    delay: 0.5 + index * 0.13,
                    ease: [0.16, 1, 0.3, 1],
                  }}
                >
                  {letter}
                </motion.span>
              ))}
            </div>

            {/* Divisor dorado */}
            <motion.div
              className="intro-divider-container"
              initial={{ scaleX:0, opacity:0 }}
              animate={{ scaleX:1, opacity:1 }}
              transition={{ duration:1.2, delay:1.35, ease:'easeInOut' }}
              style={{ transformOrigin:'center' }}
            >
              <div className="intro-divider-glow" />
              <div className="intro-divider-core" />
            </motion.div>

            {/* Logo / Marca */}
            <div className="intro-img-wrapper">
              <motion.img
                src="/images/marca_gobierno_blanco.png"
                alt="Marca Gobierno Autónomo Departamental de Oruro"
                className="intro-marca-img"
                initial={{ opacity:0, scale:.9, filter:'blur(8px)' }}
                animate={{ opacity:1, scale:1,  filter:'blur(0px)' }}
                transition={{ duration:1.4, delay:1.7, ease:'easeOut' }}
              />
            </div>

            {/* Barra de progreso */}
            <motion.div
              className="intro-loading-section"
              initial={{ opacity:0, y:14 }}
              animate={{ opacity:1, y:0 }}
              transition={{ delay:2.3, duration:.9, ease:'easeOut' }}
            >
              <div className="intro-progress-bar">
                <div className="intro-progress-fill" style={{ width:`${progress}%` }} />
              </div>
              <motion.p
                className="intro-skip-text"
                animate={{ opacity:[.3,.7,.3] }}
                transition={{ duration:2.5, repeat:Infinity, ease:'easeInOut' }}
              >
                <span className="intro-percent">{progress}%</span>
                Iniciando portal oficial
              </motion.p>
            </motion.div>
          </div>

          {/* Badge "toca para saltar" */}
          <motion.div
            className="intro-skip-hint"
            initial={{ opacity:0, y:8 }}
            animate={{ opacity:1, y:0 }}
            transition={{ delay:2.9, duration:.7 }}
          >
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M5 15l7-7 7 7"/>
            </svg>
            Toca para saltar
          </motion.div>

        </motion.div>
      )}
    </AnimatePresence>
  );
}
