'use client';

import React, { useState, useEffect } from 'react';
import Image from 'next/image';
import { motion, AnimatePresence } from 'framer-motion';
import './IntroAnimation.css';

export default function IntroAnimation() {
  const [show, setShow] = useState(true);

  useEffect(() => {
    // Disable scrolling while intro is playing
    document.body.style.overflow = 'hidden';
    
    // Hide intro after 3.5 seconds
    const timer = setTimeout(() => {
      setShow(false);
      document.body.style.overflow = 'unset';
    }, 3500);

    return () => {
      clearTimeout(timer);
      document.body.style.overflow = 'unset';
    };
  }, []);

  return (
    <AnimatePresence>
      {show && (
        <motion.div
          className="intro-container"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, scale: 1.1, filter: 'blur(10px)' }}
          transition={{ duration: 0.8, ease: [0.76, 0, 0.24, 1] }}
        >
          <div className="intro-content">
            <motion.div
              initial={{ scale: 0.5, opacity: 0, rotate: -15 }}
              animate={{ scale: 1, opacity: 1, rotate: 0 }}
              transition={{ duration: 1, ease: "easeOut", type: "spring", stiffness: 100 }}
            >
              <Image 
                src="/escudo_oruro.jpg" 
                alt="Escudo de Oruro" 
                className="intro-logo"
                width={200}
                height={200}
                priority
                style={{ objectFit: 'contain' }}
              />
            </motion.div>
            
            <div style={{ overflow: 'hidden' }}>
              <motion.h1
                className="intro-title"
                initial={{ y: "100%", opacity: 0 }}
                animate={{ y: 0, opacity: 1 }}
                transition={{ duration: 0.8, delay: 0.4, ease: [0.33, 1, 0.68, 1] }}
              >
                Gobernación de
              </motion.h1>
            </div>
            
            <div style={{ overflow: 'hidden', padding: '10px 0' }}>
              <motion.h1
                className="intro-title title-futuristic-glow"
                initial={{ y: "100%", opacity: 0, filter: 'blur(10px)' }}
                animate={{ y: 0, opacity: 1, filter: 'blur(0px)' }}
                transition={{ duration: 1, delay: 0.6, ease: [0.33, 1, 0.68, 1] }}
              >
                ORURO
              </motion.h1>
            </div>

            <motion.p
              className="intro-subtitle"
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 1.2, delay: 1, type: "spring" }}
            >
              Gobierno Autónomo Departamental
            </motion.p>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
