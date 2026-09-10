import styles from './ContenidoBloque.module.css';

/**
 * Renderiza un bloque de `contenido_institucional` (título + cuerpo HTML + archivo opcional).
 * El cuerpo se guarda como HTML desde el editor enriquecido del panel admin.
 */
export default function ContenidoBloque({ titulo, cuerpo, archivoUrl, archivoLabel = 'Descargar documento', mostrarTitulo = true }) {
  const tieneCuerpo = Boolean(cuerpo && cuerpo.replace(/<[^>]*>/g, '').trim().length > 0);

  return (
    <div className={styles.bloque}>
      {mostrarTitulo && titulo && <h2 className={styles.titulo}>{titulo}</h2>}
      {tieneCuerpo ? (
        <div className={styles.prosa} dangerouslySetInnerHTML={{ __html: cuerpo }} />
      ) : (
        <p className={styles.vacio}>Contenido en actualización.</p>
      )}
      {archivoUrl && (
        <a className={styles.descarga} href={archivoUrl} target="_blank" rel="noopener noreferrer">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
            <polyline points="7 10 12 15 17 10" />
            <line x1="12" y1="15" x2="12" y2="3" />
          </svg>
          {archivoLabel}
        </a>
      )}
    </div>
  );
}
