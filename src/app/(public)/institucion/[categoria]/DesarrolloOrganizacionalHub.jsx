import Link from 'next/link';
import { ArrowRight, FileText, GitBranch, Scale } from 'lucide-react';
import { DESARROLLO_ORGANIZACIONAL_SECCIONES } from '@/data/desarrolloOrganizacional';
import styles from './DesarrolloOrganizacionalHub.module.css';

const ICONOS = {
  'reglamentos-vigentes': Scale,
  'manual-funciones': FileText,
  'flujos-procesos': GitBranch,
};

export default function DesarrolloOrganizacionalHub() {
  return (
    <section className={styles.section} aria-labelledby="secciones-desarrollo">
      <div className={styles.heading}>
        <span className={styles.eyebrow}>Documentación institucional</span>
        <h2 id="secciones-desarrollo">Seleccione una sección</h2>
        <p>Acceda a los documentos oficiales de Desarrollo Organizacional.</p>
      </div>

      <div className={styles.grid}>
        {Object.entries(DESARROLLO_ORGANIZACIONAL_SECCIONES).map(([slug, seccion]) => {
          const Icon = ICONOS[slug];

          return (
            <Link
              key={slug}
              href={`/institucion/desarrollo-organizacional/${slug}`}
              className={styles.card}
            >
              <div className={`${styles.visual} ${styles[slug]}`}>
                <Icon aria-hidden="true" strokeWidth={1.5} />
                <span>{seccion.icono}</span>
              </div>
              <div className={styles.content}>
                <h3>{seccion.titulo}</h3>
                <p>{seccion.descripcion}</p>
                <span className={styles.cta}>
                  Ver documentos <ArrowRight size={18} aria-hidden="true" />
                </span>
              </div>
            </Link>
          );
        })}
      </div>
    </section>
  );
}
