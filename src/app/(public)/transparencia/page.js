import React from 'react';
import Link from 'next/link';
import styles from './page.module.css';

export const metadata = {
  title: 'Transparencia | GADOR',
  description: 'Portal de Transparencia del Gobierno Autónomo Departamental de Oruro',
};

export default function TransparenciaPage() {
  const luchaCorrupcion = [
    { title: 'RENDICION DE CUENTAS', image: '/secretaria_default_banner.png', link: '#' },
    { title: 'ACTIVIDADES', image: '/secretaria_default_banner.png', link: '#' },
    { title: 'FORMULARIO DE RECLAMOS Y SUGERENCIAS', image: '/secretaria_default_banner.png', link: '#' },
  ];

  const auditoria = [
    { title: 'AUDITORIA INTERNA G.A.D.O.R.', image: '/secretaria_default_banner.png', link: '#' },
    { title: 'AUDITORIA INTERNA S.E.D.C.A.M.', image: '/secretaria_default_banner.png', link: '#' },
    { title: 'AUDITORIA INTERNA S.E.D.E.G.E.S.', image: '/secretaria_default_banner.png', link: '#' },
    { title: 'AUDITORIA INTERNA S.E.D.E.S.', image: '/secretaria_default_banner.png', link: '#' },
  ];

  return (
    <main className={styles.main}>
      <div className={styles.heroBanner}>
        <div className={styles.heroOverlay}></div>
        <div className={styles.heroContent}>
          <h1 className={styles.heroTitle}>TRANSPARENCIA INSTITUCIONAL</h1>
        </div>
      </div>

      <div className={styles.container}>
        <section className={styles.section} id="lucha">
          <h2 className={styles.sectionTitle}>LUCHA CONTRA LA CORRUPCIÓN</h2>
          <div className={styles.grid3}>
            {luchaCorrupcion.map((item, idx) => (
              <div key={idx} className={styles.card}>
                <div className={styles.cardHeader}></div>
                <div className={styles.cardBody}>
                  <h3 className={styles.cardTitle}>{item.title}</h3>
                  <div className={styles.imageWrapper}>
                    {/* Using an img tag since we don't have the specific assets yet */}
                    <img src={item.image} alt={item.title} className={styles.cardImage} />
                  </div>
                  <Link href={item.link} className={styles.btnVer}>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={styles.icon}>
                      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                      <polyline points="14 2 14 8 20 8"></polyline>
                      <line x1="16" y1="13" x2="8" y2="13"></line>
                      <line x1="16" y1="17" x2="8" y2="17"></line>
                      <polyline points="10 9 9 9 8 9"></polyline>
                    </svg>
                    VER
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </section>

        <section className={styles.section} id="auditoria">
          <h2 className={styles.sectionTitle}>AUDITORIA INTERNA</h2>
          <div className={styles.grid3}>
            {auditoria.map((item, idx) => (
              <div key={idx} className={styles.card}>
                <div className={styles.cardHeader}></div>
                <div className={styles.cardBody}>
                  <h3 className={styles.cardTitle}>{item.title}</h3>
                  <div className={styles.imageWrapper}>
                    <img src={item.image} alt={item.title} className={styles.cardImage} />
                  </div>
                  <Link href={item.link} className={styles.btnVer}>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={styles.icon}>
                      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                      <polyline points="14 2 14 8 20 8"></polyline>
                      <line x1="16" y1="13" x2="8" y2="13"></line>
                      <line x1="16" y1="17" x2="8" y2="17"></line>
                      <polyline points="10 9 9 9 8 9"></polyline>
                    </svg>
                    VER
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </section>
      </div>
    </main>
  );
}
