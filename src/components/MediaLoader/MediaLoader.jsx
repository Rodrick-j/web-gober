import styles from './MediaLoader.module.css';

const LABELS = {
  image: 'Preparando imagen',
  video: 'Preparando video',
  embed: 'Conectando contenido',
};

function LoaderIcon({ kind }) {
  if (kind === 'video') {
    return (
      <svg viewBox="0 0 48 48" aria-hidden="true">
        <circle cx="24" cy="24" r="20" />
        <path d="m20 16 13 8-13 8Z" />
      </svg>
    );
  }

  if (kind === 'embed') {
    return (
      <svg viewBox="0 0 48 48" aria-hidden="true">
        <circle cx="24" cy="24" r="19" />
        <path d="M5 24h38M24 5c6 6 9 12 9 19s-3 13-9 19c-6-6-9-12-9-19S18 11 24 5Z" />
      </svg>
    );
  }

  return (
    <svg viewBox="0 0 48 48" aria-hidden="true">
      <rect x="5" y="7" width="38" height="34" rx="6" />
      <circle cx="17" cy="18" r="4" />
      <path d="m9 36 10-10 7 7 5-5 8 8" />
    </svg>
  );
}

export default function MediaLoader({ active = true, kind = 'image', label, className = '', showLabel = true }) {
  return (
    <div
      className={`${styles.loader} ${styles[kind]} ${active ? '' : styles.complete} ${className}`}
      role="status"
      aria-live="polite"
      aria-hidden={!active}
    >
      <span className={styles.shimmer} aria-hidden="true" />
      <span className={styles.visual}>
        <span className={styles.ring} aria-hidden="true" />
        <LoaderIcon kind={kind} />
      </span>
      {showLabel && <span className={styles.label}>{label || LABELS[kind]}</span>}
    </div>
  );
}
