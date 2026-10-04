'use client';

import { useEffect, useState } from 'react';
import Image from 'next/image';
import Link from 'next/link';
import styles from './HeroSlider.module.css';

const quickLinks = [
  {
    href: '/contrataciones',
    title: 'Contrataciones',
    description: 'Convocatorias, TdR y procesos vigentes.',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true">
        <path d="M6 3h9l3 3v15H6z" />
        <path d="M15 3v4h4M9 12h6M9 16h6" />
      </svg>
    ),
  },
  {
    href: '/publicaciones',
    title: 'Publicaciones',
    description: 'Informes y contenido institucional.',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true">
        <path d="M5 4h14v16H5z" />
        <path d="M8 8h8M8 12h8M8 16h5" />
      </svg>
    ),
  },
  {
    href: '/gaceta/leyes',
    title: 'Gaceta oficial',
    description: 'Normativa y documentos oficiales.',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true">
        <path d="M4 5.5A2.5 2.5 0 0 1 6.5 3H20v16H6.5A2.5 2.5 0 0 0 4 21.5v-16Z" />
        <path d="M4 19a2.5 2.5 0 0 1 2.5-2.5H20M8 7h8M8 11h8" />
      </svg>
    ),
  },
];

function formatDate(value) {
  if (!value) return 'Reciente';

  return new Intl.DateTimeFormat('es-BO', {
    day: 'numeric',
    month: 'short',
  }).format(new Date(`${String(value).split('T')[0]}T00:00:00`));
}

export default function ComunicadosPanel({ comunicado, comunicados = [] }) {
  const [isOpen, setIsOpen] = useState(false);
  const featuredComunicado = comunicado?.activo && comunicado?.imagen_url ? comunicado : null;

  useEffect(() => {
    if (!isOpen) return undefined;

    const previousOverflow = document.body.style.overflow;
    const closeOnEscape = (event) => {
      if (event.key === 'Escape') setIsOpen(false);
    };

    document.body.style.overflow = 'hidden';
    window.addEventListener('keydown', closeOnEscape);

    return () => {
      document.body.style.overflow = previousOverflow;
      window.removeEventListener('keydown', closeOnEscape);
    };
  }, [isOpen]);

  return (
    <>
      <button
        type="button"
        className={styles.comunicadosTrigger}
        onClick={() => setIsOpen(true)}
        aria-haspopup="dialog"
        aria-expanded={isOpen}
        aria-controls="panel-comunicados"
      >
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" aria-hidden="true">
          <path d="M4 13.5V9.8c0-.7.5-1.3 1.3-1.3h2l7.1-3.7c.8-.4 1.8.2 1.8 1.1v11.5c0 .9-1 1.5-1.8 1.1l-7.1-3.7h-2A1.3 1.3 0 0 1 4 16.5Z" />
          <path d="m7.4 14.7 1.2 4.2c.1.4.5.7 1 .7h.9c.7 0 1.2-.7.8-1.4L10 16.1" />
          <path d="M18.8 8.1c.9 1 1.3 2.1 1.3 3.4 0 1.2-.4 2.4-1.3 3.4" />
        </svg>
        <span>Comunicados</span>
      </button>

      {isOpen && (
        <div className={styles.comunicadosBackdrop} onClick={() => setIsOpen(false)}>
          <aside
            id="panel-comunicados"
            className={styles.comunicadosDialog}
            role="dialog"
            aria-modal="true"
            aria-labelledby="comunicados-title"
            onClick={(event) => event.stopPropagation()}
          >
            <header className={styles.comunicadosHeader}>
              <div>
                <span>Gobierno de Unidad</span>
                <h2 id="comunicados-title">Comunicados oficiales</h2>
              </div>
              <button type="button" className={styles.comunicadosClose} onClick={() => setIsOpen(false)} aria-label="Cerrar comunicados">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.1" aria-hidden="true">
                  <path d="m6 6 12 12M18 6 6 18" />
                </svg>
              </button>
            </header>

            <div className={styles.comunicadosBody}>
              {featuredComunicado && (
                <a
                  href={featuredComunicado.enlace || featuredComunicado.imagen_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className={styles.featuredComunicado}
                >
                  <div className={styles.featuredComunicadoImage}>
                    <Image
                      src={featuredComunicado.imagen_url}
                      alt={featuredComunicado.titulo || 'Comunicado oficial destacado'}
                      fill
                      sizes="(max-width: 640px) 88vw, 430px"
                    />
                  </div>
                  <span className={styles.featuredComunicadoCopy}>
                    <small>Comunicado destacado</small>
                    <strong>{featuredComunicado.titulo || 'Ver comunicado oficial'}</strong>
                    <em>Ver imagen completa</em>
                  </span>
                </a>
              )}

              {comunicados.length > 0 && (
                <section className={styles.comunicadosSection} aria-labelledby="otros-comunicados">
                  <div className={styles.comunicadosSectionTitle}>
                    <span id="otros-comunicados">Más comunicados</span>
                    <Link href="/noticias" onClick={() => setIsOpen(false)}>Ver todos</Link>
                  </div>
                  <div className={styles.comunicadosGrid}>
                    {comunicados.map((item) => (
                      <Link href={`/noticias/${item.id}`} key={item.id} className={styles.comunicadoCard} onClick={() => setIsOpen(false)}>
                        <div className={styles.comunicadoCardImage}>
                          {item.imagen_portada_url ? (
                            <Image src={item.imagen_portada_url} alt={item.titulo || 'Comunicado institucional'} fill sizes="(max-width: 640px) 42vw, 200px" />
                          ) : (
                            <span aria-hidden="true">GADOR</span>
                          )}
                        </div>
                        <div>
                          <small>{formatDate(item.fecha_publicacion)}</small>
                          <strong>{item.titulo || 'Comunicado institucional'}</strong>
                        </div>
                      </Link>
                    ))}
                  </div>
                </section>
              )}

              <section className={styles.comunicadosSection} aria-labelledby="accesos-institucionales">
                <div className={styles.comunicadosSectionTitle}>
                  <span id="accesos-institucionales">Información institucional</span>
                </div>
                <div className={styles.comunicadosLinks}>
                  {quickLinks.map((link) => (
                    <Link href={link.href} key={link.href} className={styles.comunicadoQuickLink} onClick={() => setIsOpen(false)}>
                      <span className={styles.comunicadoQuickIcon}>{link.icon}</span>
                      <span>
                        <strong>{link.title}</strong>
                        <small>{link.description}</small>
                      </span>
                      <svg className={styles.comunicadoQuickArrow} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
                        <path d="M5 12h14M13 6l6 6-6 6" />
                      </svg>
                    </Link>
                  ))}
                </div>
              </section>
            </div>
          </aside>
        </div>
      )}
    </>
  );
}
