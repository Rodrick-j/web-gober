import React from 'react';
import Link from 'next/link';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import SolicitudForm from './SolicitudForm';
import styles from './page.module.css';

export const metadata = {
  title: 'Solicitud de Información Pública | Transparencia | GADOR',
  description: 'Formulario en línea para solicitar acceso a información pública del Gobierno Autónomo Departamental de Oruro, bajo los principios de transparencia y rendición de cuentas.',
};

export default function SolicitudInformacionPage() {
  return (
    <main className={styles.main}>
      <AnimatedBackground />

      <div className={styles.heroBanner}>
        <Link href="/transparencia" className={styles.btnVolver}>← Volver a Transparencia</Link>
        <h1 className={styles.heroTitle}>Solicitud de Información Pública</h1>
      </div>

      <div className={styles.container}>
        <p className={styles.intro}>
          A través de este formulario cualquier persona puede solicitar de manera formal el
          acceso a información pública en poder del Gobierno Autónomo Departamental de Oruro,
          bajo los principios de <strong>transparencia</strong>, <strong>acceso a la información</strong> y
          <strong> rendición de cuentas</strong>. Los campos marcados con <span style={{ color: '#8B0000' }}>*</span> son obligatorios.
        </p>

        <SolicitudForm />
      </div>
    </main>
  );
}
