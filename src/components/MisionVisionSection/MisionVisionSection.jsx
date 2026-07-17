"use client";

import styles from './MisionVisionSection.module.css';
import { motion } from 'framer-motion';

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

const cardVariants = {
  hidden: { opacity: 0, y: 32 },
  visible: (i) => ({
    opacity: 1,
    y: 0,
    transition: { duration: 0.55, delay: i * 0.15, type: 'spring', stiffness: 80 }
  })
};

export default function MisionVisionSection({ mision, vision, titleClass, textClass }) {
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
          whileHover={{ y: -5, transition: { duration: 0.2 } }}
        >
          <div className={styles.cardGlow} />
          <div className={styles.cardInner}>
            <div className={styles.iconWrap}>
              <div className={styles.iconCircle}>
                <MissionIcon />
              </div>
              <div className={styles.iconLabel}>MISIÓN</div>
            </div>
            <div className={styles.divider} />
            <h2 className={`${styles.cardTitle} ${titleClass || ''}`}>
              Nuestra Misión
            </h2>
            <p className={`${styles.cardText} ${textClass || ''}`}>
              {mision}
            </p>
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
          whileHover={{ y: -5, transition: { duration: 0.2 } }}
        >
          <div className={styles.cardGlow} />
          <div className={styles.cardInner}>
            <div className={styles.iconWrap}>
              <div className={`${styles.iconCircle} ${styles.iconCircleBlue}`}>
                <VisionIcon />
              </div>
              <div className={`${styles.iconLabel} ${styles.iconLabelBlue}`}>VISIÓN</div>
            </div>
            <div className={styles.divider} />
            <h2 className={`${styles.cardTitle} ${titleClass || ''}`}>
              Nuestra Visión
            </h2>
            <p className={`${styles.cardText} ${textClass || ''}`}>
              {vision}
            </p>
          </div>
          <div className={`${styles.cardAccent} ${styles.cardAccentBlue}`} />
        </motion.div>
      )}
    </div>
  );
}
