'use client';

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { CloudSun, X } from 'lucide-react';
import ClimaWidget from '@/components/ClimaWidget/ClimaWidget';
import styles from './ScrollToTop.module.css';

export default function ScrollToTop() {
  const [isVisible, setIsVisible] = useState(false);
  const [isClimaOpen, setIsClimaOpen] = useState(false);

  useEffect(() => {
    const toggleVisibility = () => {
      if (window.scrollY > 350) {
        setIsVisible(true);
      } else {
        setIsVisible(false);
      }
    };

    window.addEventListener('scroll', toggleVisibility, { passive: true });
    // Verificación inicial
    toggleVisibility();

    return () => window.removeEventListener('scroll', toggleVisibility);
  }, []);

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    });
  };

  return (
    <div className={styles.floatingContainer}>
      <motion.button
        type="button"
        onClick={() => setIsClimaOpen(true)}
        className={styles.weatherBtn}
        aria-label="Clima en tiempo real"
        whileHover={{ scale: 1.12 }}
        whileTap={{ scale: 0.92 }}
        initial={{ opacity: 0, scale: 0.3 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.35, type: 'spring', stiffness: 260, damping: 20 }}
      >
        <CloudSun size={24} className={styles.icon} strokeWidth={2.5} />
        <span className={styles.tooltip}>Clima Oruro</span>
      </motion.button>

      <AnimatePresence>
        {isVisible && (
          <motion.button
            type="button"
            onClick={scrollToTop}
            className={styles.scrollBtn}
            aria-label="Volver arriba"
            initial={{ opacity: 0, scale: 0.3, y: 30 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.3, y: 30 }}
            transition={{ duration: 0.35, type: 'spring', stiffness: 260, damping: 20 }}
            whileHover={{ scale: 1.12 }}
            whileTap={{ scale: 0.92 }}
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2.8"
              strokeLinecap="round"
              strokeLinejoin="round"
              className={styles.arrowIcon}
            >
              <path d="m18 15-6-6-6 6" />
            </svg>
            <span className={styles.tooltip}>Volver arriba</span>
          </motion.button>
        )}
      </AnimatePresence>

      <AnimatePresence>
        {isClimaOpen && (
          <motion.div 
            className={styles.climaModalOverlay} 
            onClick={() => setIsClimaOpen(false)}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
          >
            <motion.div 
              className={styles.climaModalContent}
              onClick={(e) => e.stopPropagation()}
              initial={{ opacity: 0, y: 50, scale: 0.9 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: 50, scale: 0.9 }}
              transition={{ type: 'spring', damping: 25, stiffness: 300 }}
            >
              <button 
                className={styles.closeClimaBtn}
                onClick={() => setIsClimaOpen(false)}
              >
                <X size={24} />
              </button>
              <ClimaWidget />
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
