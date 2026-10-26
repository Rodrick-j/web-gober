import React from 'react';
import Link from 'next/link';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import styles from './contrataciones.module.css';

export const metadata = {
  title: 'Contrataciones y Convocatorias | GADOR',
  description: 'Contratación menor y contratación directa de bienes y servicios del Gobierno Autónomo Departamental de Oruro.',
};

export default function ContratacionesPage() {
  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <header className={styles.hero}>
        <h1 className={styles.heroTitle}>Contrataciones y Convocatorias</h1>
        <p className={styles.heroSub}>
          Contratación menor y contratación directa de bienes y servicios.
        </p>
      </header>

      <div className={styles.container}>
        
        {/* Módulos Especiales (Avisos) */}
        <div className={styles.modalidadesGrid}>
          <Link href="/contrataciones/menor" className={styles.modalidadCard}>
            <div className={styles.modalidadImg} style={{backgroundImage: "url('/contrataciones/img-menor.jpg')"}}>
              <h3 className={styles.modalidadTitleBanner}>Ver Contratación Menor</h3>
            </div>
          </Link>
          <Link href="/contrataciones/directa" className={styles.modalidadCard}>
            <div className={styles.modalidadImg} style={{backgroundImage: "url('/contrataciones/img-directa.jpg')"}}>
              <h3 className={styles.modalidadTitleBanner}>Ver Contratación Directa</h3>
            </div>
          </Link>
        </div>
      </div>
    </main>
  );
}
