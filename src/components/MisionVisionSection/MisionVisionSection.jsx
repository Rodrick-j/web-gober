"use client";

import { motion } from 'framer-motion';

// SVG Icons
const MissionIcon = () => (
  <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: 'var(--acento, #8B0000)' }}>
    <circle cx="12" cy="12" r="10"></circle>
    <circle cx="12" cy="12" r="6"></circle>
    <circle cx="12" cy="12" r="2"></circle>
  </svg>
);

const VisionIcon = () => (
  <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: 'var(--acento, #8B0000)' }}>
    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
    <circle cx="12" cy="12" r="3"></circle>
  </svg>
);

export default function MisionVisionSection({ mision, vision, titleClass, textClass }) {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '2rem', margin: '3rem 0' }}>
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
        hidden: { opacity: 0, y: 30 },
        visible: { opacity: 1, y: 0, transition: { duration: 0.6, type: "spring" } }
      }}
      whileHover={{ y: -5, boxShadow: '0 20px 40px rgba(0,0,0,0.08)' }}
      style={{
        background: '#ffffff',
        padding: '2.5rem',
        borderRadius: '16px',
        boxShadow: '0 10px 30px rgba(0,0,0,0.04)',
        border: '1px solid rgba(0,0,0,0.03)',
        borderLeft: '5px solid var(--acento, #8B0000)',
        display: 'flex',
        flexDirection: 'column',
        gap: '1.25rem',
        transition: 'box-shadow 0.3s ease'
      }}
    >
      <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
        <div style={{ background: 'rgba(139, 0, 0, 0.05)', padding: '1rem', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Icon />
        </div>
        <h2 className={titleClass} style={{ margin: 0, padding: 0, fontSize: '1.5rem', color: '#1a1a2e', fontWeight: 'bold' }}>
          {title}
        </h2>
      </div>
      <div className={textClass} style={{ 
        whiteSpace: 'pre-wrap', 
        color: '#475569', 
        fontSize: '1.05rem', 
        lineHeight: '1.7',
      }}>
        {text}
      </div>
    </motion.div>
  );
}
