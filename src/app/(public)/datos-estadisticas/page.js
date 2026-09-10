import React from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/public';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import styles from './datos.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Datos y Estadísticas | GADOR',
  description: 'Información cuantitativa y estadística de la gestión del Gobierno Autónomo Departamental de Oruro, por secretaría departamental.',
};

export default async function DatosEstadisticasPage() {
  let grupos = [];
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('estadisticas_secretarias')
      .select('id, titulo, valor, unidad, icono, descripcion, periodo, orden, secretarias(nombre_corto, nombre)')
      .eq('es_publico', true)
      .order('orden', { ascending: true });

    const map = new Map();
    (data || []).forEach((r) => {
      const key = r.secretarias?.nombre_corto || r.secretarias?.nombre || 'Gobernación';
      if (!map.has(key)) map.set(key, []);
      map.get(key).push(r);
    });
    grupos = Array.from(map.entries());
  } catch {
    grupos = [];
  }

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <header className={styles.hero}>
        <h1 className={styles.heroTitle}>Datos y Estadísticas</h1>
        <p className={styles.heroSub}>
          Indicadores cuantitativos de la gestión del Gobierno Autónomo Departamental de Oruro.
        </p>
      </header>

      <div className={styles.container}>
        <div className={styles.note}>
          Para datos financieros y de ejecución presupuestaria consulte el{' '}
          <Link href="/institucion/seguimiento-poa">Seguimiento al POA</Link>; para información normativa y de gestión,
          la sección <Link href="/institucion/historia-institucion">Institución</Link>.
        </div>

        {grupos.length === 0 ? (
          <div className={styles.empty}>La información estadística se encuentra en actualización.</div>
        ) : (
          grupos.map(([nombre, items]) => (
            <section key={nombre} className={styles.section}>
              <h2 className={styles.sectionTitle}>{nombre}</h2>
              <div className={styles.kpiGrid}>
                {items.map((k) => (
                  <div key={k.id} className={styles.kpi}>
                    {k.icono && <div className={styles.kpiIcon}>{k.icono}</div>}
                    <div className={styles.kpiValue}>{k.valor}{k.unidad ? ` ${k.unidad}` : ''}</div>
                    <div className={styles.kpiLabel}>{k.titulo}</div>
                    {(k.descripcion || k.periodo) && (
                      <div className={styles.kpiSub}>{k.descripcion || ''}{k.descripcion && k.periodo ? ' · ' : ''}{k.periodo || ''}</div>
                    )}
                  </div>
                ))}
              </div>
            </section>
          ))
        )}
      </div>
    </main>
  );
}
