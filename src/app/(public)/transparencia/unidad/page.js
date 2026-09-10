import React from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/public';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import ContenidoBloque from '@/components/ContenidoInstitucional/ContenidoBloque';
import styles from './unidad.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Unidad de Transparencia y Lucha Contra la Corrupción | GADOR',
  description: 'Información de la Unidad de Transparencia y Lucha Contra la Corrupción (UTLCC) del Gobierno Autónomo Departamental de Oruro, conforme a la Ley N° 974.',
};

export default async function UnidadTransparenciaPage() {
  let unidad = null;
  let encargado = null;
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('contenido_institucional')
      .select('clave, titulo, cuerpo, archivo_url')
      .in('clave', ['unidad_transparencia', 'encargado_mensajes']);
    (data || []).forEach((r) => {
      if (r.clave === 'unidad_transparencia') unidad = r;
      if (r.clave === 'encargado_mensajes') encargado = r;
    });
  } catch {
    /* fallback: se muestran textos por defecto abajo */
  }

  return (
    <main className={styles.main}>
      <AnimatedBackground />

      <div className={styles.heroBanner}>
        <Link href="/transparencia" className={styles.btnVolver}>← Volver a Transparencia</Link>
        <h1 className={styles.heroTitle}>Unidad de Transparencia y Lucha Contra la Corrupción</h1>
      </div>

      <div className={styles.container} style={{ display: 'grid', gap: '1.5rem', paddingBottom: '4rem' }}>
        <ContenidoBloque
          titulo={unidad?.titulo || 'Unidad de Transparencia y Lucha Contra la Corrupción'}
          cuerpo={
            unidad?.cuerpo ||
            '<p>La Unidad de Transparencia y Lucha Contra la Corrupción (UTLCC), en el marco de la <strong>Ley N° 974</strong>, es responsable de gestionar las denuncias por presuntos actos de corrupción, promover la ética y la transparencia institucional, coordinar la Rendición Pública de Cuentas y asegurar el acceso a la información pública.</p>'
          }
          archivoUrl={unidad?.archivo_url}
        />

        <ContenidoBloque
          titulo={encargado?.titulo || 'Atención a la Ciudadanía'}
          cuerpo={
            encargado?.cuerpo ||
            '<p>Para consultas, denuncias o solicitudes de información puede comunicarse con la Unidad de Transparencia a través de los canales oficiales publicados en la sección de contacto del portal.</p>'
          }
        />
      </div>
    </main>
  );
}
