import Link from 'next/link';
import styles from './TransparencyHero.module.css';

export default function TransparencyHero({
  title,
  description,
  eyebrow = 'Portal de Transparencia',
  showBack = true,
}) {
  return (
    <section className={styles.hero} aria-labelledby="transparency-page-title">
      <div className={styles.pattern} aria-hidden="true" />
      <div className={styles.glow} aria-hidden="true" />
      <div className={styles.inner}>
        {showBack && (
          <Link href="/transparencia" className={styles.backLink}>
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
              <path d="m15 18-6-6 6-6" />
            </svg>
            Volver a Transparencia
          </Link>
        )}
        <p className={styles.eyebrow}>
          <span aria-hidden="true" />
          {eyebrow}
        </p>
        <h1 id="transparency-page-title" className={styles.title}>{title}</h1>
        {description && <p className={styles.description}>{description}</p>}
      </div>
    </section>
  );
}
