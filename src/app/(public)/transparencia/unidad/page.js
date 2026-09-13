import { createClient } from '@/lib/supabase/public';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import ContenidoBloque from '@/components/ContenidoInstitucional/ContenidoBloque';
import TransparencyHero from '@/components/TransparencyHero/TransparencyHero';
import styles from './unidad.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Unidad de Transparencia y Lucha Contra la Corrupción | GADOR',
  description: 'Información de la Unidad de Transparencia y Lucha Contra la Corrupción del Gobierno Autónomo Departamental de Oruro, conforme a la Ley N.º 974.',
};

const CheckIcon = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
    <circle cx="12" cy="12" r="9" />
    <path d="m8.5 12 2.2 2.2 4.8-5" />
  </svg>
);

export default async function UnidadTransparenciaPage() {
  let unidad = null;
  let encargado = null;
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('contenido_institucional')
      .select('clave, titulo, cuerpo, archivo_url')
      .in('clave', ['unidad_transparencia', 'encargado_mensajes']);
    (data || []).forEach((row) => {
      if (row.clave === 'unidad_transparencia') unidad = row;
      if (row.clave === 'encargado_mensajes') encargado = row;
    });
  } catch {
    // Se muestran los contenidos institucionales de respaldo.
  }

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <TransparencyHero
        eyebrow="Integridad institucional"
        title="Unidad de Transparencia y Lucha Contra la Corrupción"
        description="Promovemos una gestión pública íntegra, abierta y cercana a la ciudadanía orureña."
      />

      <div className={styles.container}>
        <section className={styles.infoStrip} aria-label="Principios de atención">
          <div><CheckIcon /><span><strong>Marco normativo</strong><small>Ley N.º 974</small></span></div>
          <div><CheckIcon /><span><strong>Atención ciudadana</strong><small>Orientación y seguimiento</small></span></div>
          <div><CheckIcon /><span><strong>Gestión transparente</strong><small>Prevención y control</small></span></div>
        </section>

        <div className={styles.contentStack}>
          <ContenidoBloque
            titulo={unidad?.titulo || 'Unidad de Transparencia y Lucha Contra la Corrupción'}
            cuerpo={
              unidad?.cuerpo ||
              '<p>La Unidad de Transparencia y Lucha Contra la Corrupción (UTLCC), en el marco de la <strong>Ley N.º 974</strong>, es responsable de gestionar las denuncias por presuntos actos de corrupción, promover la ética y la transparencia institucional, coordinar la Rendición Pública de Cuentas y asegurar el acceso a la información pública.</p>'
            }
            archivoUrl={unidad?.archivo_url}
            archivoLabel="Consultar documento oficial"
          />

          <ContenidoBloque
            titulo={encargado?.titulo || 'Atención a la Ciudadanía'}
            cuerpo={
              encargado?.cuerpo ||
              '<p>Para consultas, denuncias o solicitudes de información puede comunicarse con la Unidad de Transparencia a través de los canales oficiales publicados en la sección de contacto del portal.</p>'
            }
          />
        </div>
      </div>
    </main>
  );
}
