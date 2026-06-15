'use client';
import { motion } from 'framer-motion';
import styles from './BreakingNews.module.css';

export default function BreakingNews({ config }) {
  const headlines = config?.mensajes?.length > 0 ? config.mensajes : [
    '🔴 NO HAY NOTICIAS CONFIGURADAS ACTUALMENTE'
  ];
  
  const velocidad = config?.velocidad_segundos || 60;
  const repeated = [...headlines, ...headlines];

  return (
    <div className={styles.ticker} role="marquee" aria-label="Últimas noticias">
      <div className={styles.tickerLabel}>
        <span className={styles.dot} />
        EN VIVO
      </div>
      <div className={styles.tickerTrack}>
        <motion.div
          className={styles.tickerContent}
          animate={{ x: ['0%', '-50%'] }}
          transition={{
            x: { repeat: Infinity, duration: velocidad, ease: 'linear' },
          }}
        >
          {repeated.map((item, i) => (
            <span key={i} className={styles.tickerItem}>
              {item}
              <span className={styles.separator}>•</span>
            </span>
          ))}
        </motion.div>
      </div>
    </div>
  );
}
