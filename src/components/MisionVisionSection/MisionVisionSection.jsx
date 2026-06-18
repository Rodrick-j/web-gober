"use client";

import { motion } from 'framer-motion';

// SVG Icons
const MissionIcon = () => (
  <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: 'var(--acento, #8B0000)' }}>
    <circle cx="12" cy="12" r="10"></circle>
    <circle cx="12" cy="12" r="6"></circle>
    <circle cx="12" cy="12" r="2"></circle>
  </svg>
);

const VisionIcon = () => (
  <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: 'var(--acento, #8B0000)' }}>
    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
    <circle cx="12" cy="12" r="3"></circle>
  </svg>
);

export default function MisionVisionSection({ mision, vision, titleClass, textClass }) {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '3rem', margin: '3rem 0' }}>
      {mision && (
        <FlipCard 
          title="Nuestra Misión" 
          text={mision} 
          Icon={MissionIcon} 
          titleClass={titleClass} 
          textClass={textClass} 
        />
      )}
      {vision && (
        <FlipCard 
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

function FlipCard({ title, text, Icon, titleClass, textClass }) {
  return (
    <motion.div 
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, margin: "-50px" }}
      variants={{
        hidden: { opacity: 0, y: 50 },
        visible: { opacity: 1, y: 0, transition: { duration: 0.6, type: "spring" } }
      }}
      className="flip-card-container"
      style={{
        perspective: '1000px',
        width: '100%',
        minHeight: '250px'
      }}
    >
      <motion.div
        className="flip-card-inner"
        initial={false}
        whileHover={{ rotateY: 180 }}
        style={{
          display: 'grid',
          width: '100%',
          transformStyle: 'preserve-3d',
          transition: 'transform 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275)'
        }}
      >
        {/* FRONT FACE */}
        <div 
          style={{
            gridArea: '1 / 1',
            backfaceVisibility: 'hidden',
            background: 'linear-gradient(135deg, #fff 0%, #f9f9f9 100%)',
            padding: '3rem',
            borderRadius: '20px',
            boxShadow: '0 15px 35px rgba(0,0,0,0.1)',
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            border: '1px solid rgba(0,0,0,0.05)',
            borderBottom: '5px solid var(--acento, #8B0000)'
          }}
        >
          <motion.div
            initial={{ scale: 0.8, opacity: 0 }}
            whileInView={{ scale: 1, opacity: 1 }}
            transition={{ delay: 0.2, type: 'spring' }}
            viewport={{ once: true }}
            style={{ marginBottom: '1.5rem', transform: 'scale(1.5)' }}
          >
            <Icon />
          </motion.div>
          <h2 className={titleClass} style={{ margin: 0, border: 'none', padding: 0, fontSize: '2rem' }}>
            {title}
          </h2>
          <p style={{ marginTop: '1rem', color: '#888', fontStyle: 'italic' }}>Pasa el cursor (o toca) para voltear</p>
        </div>

        {/* BACK FACE */}
        <div 
          style={{
            gridArea: '1 / 1',
            backfaceVisibility: 'hidden',
            transform: 'rotateY(180deg)',
            background: 'var(--acento, #8B0000)',
            color: '#fff',
            padding: '3rem',
            borderRadius: '20px',
            boxShadow: '0 15px 35px rgba(0,0,0,0.2)',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            alignItems: 'center',
            textAlign: 'center'
          }}
        >
          <div className={textClass} style={{ 
            whiteSpace: 'pre-wrap', 
            color: '#fff', 
            fontSize: '1.15rem', 
            lineHeight: '1.8',
            textShadow: '0 2px 4px rgba(0,0,0,0.2)' 
          }}>
            {text}
          </div>
        </div>
      </motion.div>
    </motion.div>
  );
}
