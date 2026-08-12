import React from 'react';
import Link from 'next/link';
import styles from './page.module.css';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';

export const metadata = {
  title: 'Auditoria Interna | GADOR',
  description: 'Auditoria Interna del Gobierno Autónomo Departamental de Oruro',
};

export default function AuditoriaPage() {
  const auditoria = [
    { title: 'AUDITORIA INTERNA G.A.D.O.R.', image: '/secretaria_default_banner.png', link: '/transparencia/auditoria_gador' },
    { title: 'AUDITORIA INTERNA S.E.D.C.A.M.', image: '/secretaria_default_banner.png', link: '/transparencia/auditoria_sedcam' },
    { title: 'AUDITORIA INTERNA S.E.D.E.G.E.S.', image: '/secretaria_default_banner.png', link: '/transparencia/auditoria_sedeges' },
    { title: 'AUDITORIA INTERNA S.E.D.E.S.', image: '/secretaria_default_banner.png', link: '/transparencia/auditoria_sedes' },
  ];

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <div className={styles.heroBanner}>
        <div className={styles.heroOverlay}></div>
        <div className={styles.heroContent}>
          <h1 className={styles.heroTitle}>AUDITORÍA INTERNA</h1>
        </div>
      </div>

      <div className={styles.container}>
        <section className={styles.section} id="auditoria">
          <h2 className={styles.sectionTitle}>NUESTRAS AUDITORÍAS</h2>
          <div className={styles.auditoriaGrid}>
            {auditoria.map((item, idx) => (
              <Link href={item.link} key={idx} className={styles.auditoriaCard}>
                <div className={styles.auditoriaIconWrapper}>
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className={styles.auditIconSVG}>
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                    <circle cx="11.5" cy="14.5" r="2.5"></circle>
                    <line x1="13.27" y1="16.27" x2="16" y2="19"></line>
                  </svg>
                </div>
                <div className={styles.auditoriaContent}>
                  <h3 className={styles.auditoriaTitle}>{item.title}</h3>
                  <p className={styles.auditoriaSubtitle}>Acceder a los informes y documentos oficiales</p>
                </div>
                <div className={styles.auditoriaArrow}>
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                    <polyline points="12 5 19 12 12 19"></polyline>
                  </svg>
                </div>
              </Link>
            ))}
          </div>
        </section>
      </div>
    </main>
  );
}
