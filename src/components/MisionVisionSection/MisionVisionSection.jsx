"use client";

import { useState } from 'react';
import styles from './MisionVisionSection.module.css';
import { motion, AnimatePresence } from 'framer-motion';

const MissionIcon = () => (
  <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
    <circle cx="12" cy="12" r="10"/>
    <circle cx="12" cy="12" r="6"/>
    <circle cx="12" cy="12" r="2"/>
  </svg>
);

const VisionIcon = () => (
  <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
    <circle cx="12" cy="12" r="3"/>
  </svg>
);

const ChevronIcon = () => (
  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <polyline points="6 9 12 15 18 9"></polyline>
  </svg>
);

const cardVariants = {
  hidden: { opacity: 0, y: 32 },
  visible: (i) => ({
    opacity: 1,
    y: 0,
    transition: { duration: 0.55, delay: i * 0.15, type: 'spring', stiffness: 80 }
  })
};

export default function MisionVisionSection({ mision, vision, titleClass, textClass }) {
  const [openSection, setOpenSection] = useState(mision ? 'mision' : 'vision');

  if (!mision && !vision) return null;

  return (
    <div className={styles.container}>
      {mision && (
        <motion.div
          className={`${styles.card} ${styles.misionCard}`}
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, margin: '-40px' }}
          custom={0}
          variants={cardVariants}
        >
          <div className={styles.cardGlow} />
          <div className={styles.cardInner}>
            <button 
              className={styles.iconWrap}
              onClick={() => setOpenSection(openSection === 'mision' ? null : 'mision')}
              style={{ width: '100%', border: 'none', background: 'transparent', padding: 0, cursor: 'pointer' }}
            >
              <div className={styles.iconCircle}>
                <MissionIcon />
              </div>
              <div className={styles.iconLabel}>MISIÓN</div>
              <div style={{
                marginLeft: 'auto',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '32px',
                height: '32px',
                borderRadius: '50%',
                background: 'rgba(139,0,0,0.05)',
                color: '#8B0000',
                transition: 'transform 0.3s ease',
                transform: openSection === 'mision' ? 'rotate(180deg)' : 'rotate(0deg)'
              }}>
                <ChevronIcon />
              </div>
            </button>
            
            <AnimatePresence>
              {openSection === 'mision' && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  style={{ overflow: 'hidden' }}
                >
                  <div className={styles.divider} style={{ margin: '1.25rem 0 1rem' }} />
                  <p className={`${styles.cardText} ${textClass || ''}`}>
                    {mision}
                  </p>
                </motion.div>
              )}
            </AnimatePresence>
          </div>
          <div className={styles.cardAccent} />
        </motion.div>
      )}

      {vision && (
        <motion.div
          className={`${styles.card} ${styles.visionCard}`}
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, margin: '-40px' }}
          custom={1}
          variants={cardVariants}
        >
          <div className={styles.cardGlow} />
          <div className={styles.cardInner}>
            <button 
              className={styles.iconWrap}
              onClick={() => setOpenSection(openSection === 'vision' ? null : 'vision')}
              style={{ width: '100%', border: 'none', background: 'transparent', padding: 0, cursor: 'pointer' }}
            >
              <div className={`${styles.iconCircle} ${styles.iconCircleBlue}`}>
                <VisionIcon />
              </div>
              <div className={`${styles.iconLabel} ${styles.iconLabelBlue}`}>VISIÓN</div>
              <div style={{
                marginLeft: 'auto',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '32px',
                height: '32px',
                borderRadius: '50%',
                background: 'rgba(30,64,175,0.05)',
                color: '#1e40af',
                transition: 'transform 0.3s ease',
                transform: openSection === 'vision' ? 'rotate(180deg)' : 'rotate(0deg)'
              }}>
                <ChevronIcon />
              </div>
            </button>
            
            <AnimatePresence>
              {openSection === 'vision' && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  style={{ overflow: 'hidden' }}
                >
                  <div className={styles.divider} style={{ margin: '1.25rem 0 1rem' }} />
                  <p className={`${styles.cardText} ${textClass || ''}`}>
                    {vision}
                  </p>
                </motion.div>
              )}
            </AnimatePresence>
          </div>
          <div className={`${styles.cardAccent} ${styles.cardAccentBlue}`} />
        </motion.div>
      )}
    </div>
  );
}
