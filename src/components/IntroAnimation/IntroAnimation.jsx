'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

export default function IntroAnimation({ isSeen }) {
  const [show, setShow] = useState(false);
  const [progress, setProgress] = useState(0);

  const handleClose = () => {
    setShow(false);
    document.body.style.overflow = 'unset';
  };

  useEffect(() => {
    setShow(true);
    document.body.style.overflow = 'hidden';
    
    // Simulate loading progress
    const progressInterval = setInterval(() => {
      setProgress(prev => {
        if (prev >= 100) {
          clearInterval(progressInterval);
          return 100;
        }
        return prev + 2;
      });
    }, 50);

    const timer = setTimeout(() => {
      handleClose();
    }, 4500);

    return () => {
      clearTimeout(timer);
      clearInterval(progressInterval);
      document.body.style.overflow = 'unset';
    };
  }, [isSeen]);

  const oruroText = "ORURO".split("");

  return (
    <AnimatePresence>
      {show && (
        <motion.div
          className="intro-container"
          onClick={handleClose}
          title="Haz clic para saltar la introducción"
          initial={{ opacity: 1 }}
          exit={{ 
            opacity: 0, 
            scale: 1.1,
            filter: 'blur(20px)', 
            transition: { duration: 1.2, ease: [0.22, 1, 0.36, 1] } 
          }}
        >
          {/* Animated Background Gradients */}
          <motion.div 
            className="intro-overlay"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 2 }}
          />
          
          <div className="intro-texture" />

          {/* Floating light orbs */}
          <motion.div 
            className="intro-orb orb-1"
            animate={{ 
              y: [0, -40, 0],
              opacity: [0.3, 0.6, 0.3],
              scale: [1, 1.2, 1]
            }}
            transition={{ duration: 6, repeat: Infinity, ease: "easeInOut" }}
          />
          <motion.div 
            className="intro-orb orb-2"
            animate={{ 
              y: [0, 40, 0],
              opacity: [0.2, 0.5, 0.2],
              scale: [1, 1.5, 1]
            }}
            transition={{ duration: 8, repeat: Infinity, ease: "easeInOut", delay: 1 }}
          />

          <div className="intro-content">
            <div className="intro-text-wrapper">
              <motion.h2
                className="intro-gov-text"
                initial={{ opacity: 0, y: -20, filter: 'blur(10px)' }}
                animate={{ opacity: 1, y: 0, filter: 'blur(0px)' }}
                transition={{ duration: 1.5, delay: 0.3, ease: "easeOut" }}
              >
                Gobierno Autónomo Departamental de
              </motion.h2>
            </div>
            
            <div className="intro-title-wrapper">
              {oruroText.map((letter, index) => (
                <motion.span
                  key={index}
                  className="intro-title-letter"
                  initial={{ opacity: 0, y: 40, rotateX: -90, filter: 'blur(10px)' }}
                  animate={{ opacity: 1, y: 0, rotateX: 0, filter: 'blur(0px)' }}
                  transition={{ 
                    duration: 1.2, 
                    delay: 0.6 + (index * 0.15), 
                    type: "spring", 
                    stiffness: 70, 
                    damping: 20 
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
              transition={{ duration: 1.5, delay: 1.5, ease: "easeInOut" }}
            >
              <div className="intro-divider-glow" />
              <div className="intro-divider-core" />
            </motion.div>

            <div className="intro-img-wrapper">
              <motion.img
                src="/images/marca_gobierno_blanco.png"
                alt="Marca Gobierno"
                className="intro-marca-img"
                initial={{ opacity: 0, scale: 0.9, filter: 'blur(15px)' }}
                animate={{ opacity: 1, scale: 1, filter: 'blur(0px)' }}
                transition={{ duration: 1.8, delay: 1.8, ease: "easeOut" }}
              />
            </div>

            {/* Loading Indicator */}
            <motion.div 
              className="intro-loading-section"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 2.2, duration: 1 }}
            >
              <div className="intro-progress-bar">
                <motion.div 
                  className="intro-progress-fill"
                  style={{ width: `${progress}%` }}
                />
              </div>
              <motion.p
                className="intro-skip-text"
                animate={{ opacity: [0.4, 1, 0.4] }}
                transition={{ duration: 2, repeat: Infinity, ease: "easeInOut" }}
              >
                Iniciando portal oficial • {progress}%
              </motion.p>
            </motion.div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
