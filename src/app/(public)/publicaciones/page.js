import React from 'react';
import { createClient } from '@/lib/supabase/public';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import PublicacionesClient from './PublicacionesClient';
import styles from './publicaciones.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Publicaciones | GADOR',
  description: 'Publicaciones, boletines, revistas, artículos, trabajos de investigación y campañas del Gobierno Autónomo Departamental de Oruro.',
};

export default async function PublicacionesPage() {
  let publicaciones = [];
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('publicaciones')
      .select('id, tipo, titulo, descripcion, archivo_url, imagen_url, enlace_externo, fecha, autor, es_destacada')
      .eq('activo', true)
      .order('es_destacada', { ascending: false })
      .order('fecha', { ascending: false });
    publicaciones = data || [];
  } catch {
    publicaciones = [];
  }

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <header className={styles.hero}>
        <h1 className={styles.heroTitle}>Publicaciones</h1>
        <p className={styles.heroSub}>
          Boletines, revistas, artículos, trabajos de investigación y campañas institucionales
          del Gobierno Autónomo Departamental de Oruro.
        </p>
      </header>
      <div className={styles.container}>
        <PublicacionesClient publicaciones={publicaciones} />
      </div>
    </main>
  );
}
