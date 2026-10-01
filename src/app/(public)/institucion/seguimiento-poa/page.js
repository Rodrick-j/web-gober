import React from 'react';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';
import styles from './seguimiento.module.css';
import BudgetDashboard from '@/app/(public)/secretarias/[slug]/BudgetDashboard';

export const revalidate = 60;

export const metadata = {
  title: 'Seguimiento y Evaluación al POA | Institución | GADOR',
  description: 'Seguimiento a la ejecución de la Programación Operativa Anual (POA) del Gobierno Autónomo Departamental de Oruro e informes de evaluación.',
};

export default function SeguimientoPoaPage() {
  return (
    <main className={styles.main}>
      <CenefaCultural />
      <header className={styles.hero}>
        {/* Animated Background Bars */}
        <div className={styles.statBar}></div>
        <div className={styles.statBar}></div>
        <div className={styles.statBar}></div>
        <div className={styles.statBar}></div>
        <div className={styles.statBar}></div>
        <div className={styles.statBar}></div>

        <div className={styles.heroContent}>
          <h1 className={styles.heroTitle}>Seguimiento y Evaluación al POA</h1>
          <p className={styles.heroSub}>
            Vista Interactiva del avance en la ejecución de la Programación Operativa Anual e informes de seguimiento del Gobierno Autónomo Departamental de Oruro.
          </p>
        </div>
      </header>

      <div className={styles.container}>
        <BudgetDashboard />
      </div>
    </main>
  );
}
