'use client';
import { useRef, useEffect, useState } from 'react';
import { motion, useScroll, useTransform } from 'framer-motion';
import styles from './Hero.module.css';

/* ── Stats data ──────────────────────────────────────── */
const stats = [
  { raw: '21',   label: 'Provincias',       suffix: '' },
  { raw: '35',   label: 'Municipios',       suffix: '' },
  { raw: '500K+',label: 'Ciudadanos',       suffix: '' },
  { raw: '198',  label: 'Años de Historia', suffix: '' },
];

/* ── Framer variants ─────────────────────────────────── */
const containerVariants = {
  hidden: {},
  visible: { transition: { staggerChildren: 0.12 } },
};
const itemVariants = {
  hidden:   { opacity: 0, y: 30 },
  visible:  { opacity: 1, y: 0, transition: { duration: 0.65, ease: [0.22, 1, 0.36, 1] } },
};

/* ── Count-up hook (sin GSAP, usando IntersectionObserver + RAF) ── */
function useCountUp(end, duration = 2200) {
  const [count, setCount] = useState('0');
  const ref = useRef(null);
  const hasAnimated = useRef(false);

  useEffect(() => {
    const numericEnd = parseFloat(String(end).replace(/[^0-9.]/g, ''));
    const hasK = String(end).includes('K');
    const hasPlus = String(end).includes('+');

    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && !hasAnimated.current) {
          hasAnimated.current = true;
          const startTime = performance.now();

          const tick = (now) => {
            const elapsed = now - startTime;
            const progress = Math.min(elapsed / duration, 1);
            // ease out cubic
            const eased = 1 - Math.pow(1 - progress, 3);
            const current = Math.round(eased * numericEnd);
            const formatted = hasK
              ? `${current}K${hasPlus ? '+' : ''}`
              : `${current}${hasPlus ? '+' : ''}`;
            setCount(formatted);
            if (progress < 1) requestAnimationFrame(tick);
          };

          requestAnimationFrame(tick);
          observer.disconnect();
        }
      },
      { threshold: 0.5 }
    );

    if (ref.current) observer.observe(ref.current);
    return () => observer.disconnect();
  }, [end, duration]);

  return { ref, count };
}

/* ── Animated stat number ────────────────────────────── */
function StatNumber({ raw, label }) {
  const { ref, count } = useCountUp(raw, 2200);
  return (
    <div ref={ref} className={styles.statItem}>
      <div className={styles.statValue}>{count}</div>
      <div className={styles.statLabel}>{label}</div>
    </div>
  );
}

/* ── Main Hero ───────────────────────────────────────── */
export default function Hero() {
  const heroRef = useRef(null);

  // Parallax CSS-scroll suave usando framer-motion (sin GSAP)
  const { scrollYProgress } = useScroll({
    target: heroRef,
    offset: ['start start', 'end start'],
  });
  const bgY = useTransform(scrollYProgress, [0, 1], ['0%', '30%']);

  return (
    <section ref={heroRef} className={styles.hero} id="inicio">

      {/* Background con parallax vía framer-motion */}
      <motion.div className={styles.heroBg} style={{ y: bgY }}>
        <div className={styles.bgGradient} />
        <div className={styles.bgPattern} />
        <div className={`${styles.orb} ${styles.orb1}`} />
        <div className={`${styles.orb} ${styles.orb2}`} />
        <div className={`${styles.orb} ${styles.orb3}`} />
      </motion.div>

      {/* Hero Content */}
      <div className={styles.heroContent}>
        <motion.div
          className={styles.heroText}
          variants={containerVariants}
          initial="hidden"
          animate="visible"
        >
          <motion.div variants={itemVariants}>
            <span className={styles.heroBadge}>
              <span className={styles.badgeDot} />
              Portal Oficial del Estado Plurinacional
            </span>
          </motion.div>

          <motion.h1 className={styles.heroTitle} variants={itemVariants}>
            Gobierno Autónomo
            <br />
            <span className={styles.heroTitleAccent}>Departamental</span>
            <br />
            de <span className={styles.heroTitleHighlight}>Oruro</span>
          </motion.h1>

          <motion.p className={styles.heroSubtitle} variants={itemVariants}>
            Trabajando por el desarrollo integral, la transparencia y el bienestar
            de todos los ciudadanos del Departamento de Oruro.
          </motion.p>

          <motion.div className={styles.heroActions} variants={itemVariants}>
            <a href="/noticias" className="btn btn-primary" id="hero-noticias-btn">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/>
                <path d="M18 14h-8M15 18h-5M10 6h8v4h-8V6Z"/>
              </svg>
              Ver Noticias
            </a>
            <a href="/gaceta" className="btn btn-outline"
              style={{ borderColor: 'rgba(255,255,255,0.5)', color: '#fff' }}
              id="hero-gaceta-btn"
            >
              Gaceta Oficial
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M5 12h14M12 5l7 7-7 7"/>
              </svg>
            </a>
          </motion.div>
        </motion.div>

        {/* Hero Image Card */}
        <motion.div
          className={styles.heroImageCard}
          initial={{ opacity: 0, x: 60, scale: 0.95 }}
          animate={{ opacity: 1, x: 0, scale: 1 }}
          transition={{ duration: 0.8, delay: 0.3, ease: [0.22, 1, 0.36, 1] }}
        >
          <div className={styles.imageCardInner}>
            <div className={styles.imageCardBg} />
            {/* Shine sweep effect */}
            <div className={styles.shineSweep} />
            <div className={styles.imageCardContent}>
              <div className={styles.carnavalIcon}>🎭</div>
              <h3 className={styles.imageCardTitle}>Carnaval de Oruro</h3>
              <p className={styles.imageCardText}>Patrimonio Cultural Inmaterial de la Humanidad — UNESCO</p>
              <div className={styles.imageCardBadge}>
                <span>🌍 UNESCO 2001</span>
              </div>
            </div>
            {/* Floating cards */}
            <motion.div
              className={`${styles.floatCard} ${styles.floatCard1}`}
              animate={{ y: [0, -8, 0] }}
              transition={{ repeat: Infinity, duration: 3, ease: 'easeInOut' }}
            >
              <span className={styles.floatIcon}>📋</span>
              <div>
                <div className={styles.floatTitle}>Trámites Online</div>
                <div className={styles.floatSub}>Disponible 24/7</div>
              </div>
            </motion.div>
            <motion.div
              className={`${styles.floatCard} ${styles.floatCard2}`}
              animate={{ y: [0, 8, 0] }}
              transition={{ repeat: Infinity, duration: 3.5, ease: 'easeInOut', delay: 0.5 }}
            >
              <span className={styles.floatIcon}>📰</span>
              <div>
                <div className={styles.floatTitle}>Últimas Noticias</div>
                <div className={styles.floatSub}>Actualización diaria</div>
              </div>
            </motion.div>
          </div>
        </motion.div>
      </div>

      {/* Stats Bar — count-up con IntersectionObserver puro */}
      <motion.div
        className={styles.statsBar}
        initial={{ opacity: 0, y: 30 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.8, duration: 0.6 }}
      >
        {stats.map((stat) => (
          <StatNumber key={stat.label} raw={stat.raw} label={stat.label} />
        ))}
      </motion.div>
    </section>
  );
}

