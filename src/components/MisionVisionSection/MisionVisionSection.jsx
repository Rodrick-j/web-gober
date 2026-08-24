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
  const [activeTab, setActiveTab] = useState(mision ? 'mision' : 'vision');

  if (!mision && !vision) return null;

  return (
    <div className={styles.tabsContainer}>
      <div className={styles.tabButtons}>
        {mision && (
          <button 
            className={`${styles.tabBtn} ${activeTab === 'mision' ? styles.tabBtnActiveMision : ''}`}
            onClick={() => setActiveTab('mision')}
          >
            <MissionIcon />
            <span>MISIÓN</span>
          </button>
        )}
        {vision && (
          <button 
            className={`${styles.tabBtn} ${activeTab === 'vision' ? styles.tabBtnActiveVision : ''}`}
            onClick={() => setActiveTab('vision')}
          >
            <VisionIcon />
            <span>VISIÓN</span>
          </button>
        )}
      </div>

      <div className={styles.tabContentArea}>
        <AnimatePresence mode="wait">
          {activeTab === 'mision' && mision && (
            <motion.div
              key="mision"
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.3 }}
              className={`${styles.tabPanel} ${styles.tabPanelMision}`}
            >
              <p className={`${styles.cardText} ${textClass || ''}`}>
                {mision}
              </p>
            </motion.div>
          )}
          {activeTab === 'vision' && vision && (
            <motion.div
              key="vision"
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.3 }}
              className={`${styles.tabPanel} ${styles.tabPanelVision}`}
            >
              <p className={`${styles.cardText} ${textClass || ''}`}>
                {vision}
              </p>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
}
