"use client";

import styles from './MisionVisionSection.module.css';
import { motion } from 'framer-motion';

// SVG Icons
const MissionIcon = () => (
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: 'var(--acento, #8B0000)' }}>
    <circle cx="12" cy="12" r="10"></circle>
    <circle cx="12" cy="12" r="6"></circle>
    <circle cx="12" cy="12" r="2"></circle>
  </svg>
);

const VisionIcon = () => (
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: 'var(--acento, #8B0000)' }}>
    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
    <circle cx="12" cy="12" r="3"></circle>
  </svg>
);

export default function MisionVisionSection({ mision, vision, titleClass, textClass }) {
  return (
    <div className={styles.container}>
      {mision && (
        <InfoCard 
          title="Nuestra Misión" 
          text={mision} 
          Icon={MissionIcon} 
          titleClass={titleClass} 
          textClass={textClass} 
        />
      )}
      {vision && (
        <InfoCard 
          title="Nuestra Visión" 
          text={vision} 
          Icon={VisionIcon} 
          titleClass={titleClass} 
          textClass={textClass} 
        />
      )}
    </div>
  );
}

function InfoCard({ title, text, Icon, titleClass, textClass }) {
  return (
    <motion.div 
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, margin: "-50px" }}
      variants={{
        hidden: { opacity: 0, y: 25 },
        visible: { opacity: 1, y: 0, transition: { duration: 0.5, type: "spring" } }
      }}
      whileHover={{ y: -4, boxShadow: '0 15px 35px rgba(0,0,0,0.08)' }}
      className={styles.card}
    >
      <div className={styles.cardHeader}>
        <div className={styles.iconBox}>
          <Icon />
        </div>
        <h2 className={styles.cardTitle}>
          {title}
        </h2>
      </div>
      <div className={`${styles.cardText} ${textClass || ''}`}>
        {text}
      </div>
    </motion.div>
  );
}
