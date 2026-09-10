'use client';

import { useState, useMemo } from 'react';
import styles from './publicaciones.module.css';

const TIPOS = [
  { id: 'todas', label: 'Todas', icon: '📚' },
  { id: 'publicacion', label: 'Publicaciones', icon: '📄' },
  { id: 'boletin', label: 'Boletines', icon: '🗞️' },
  { id: 'revista', label: 'Revistas', icon: '📕' },
  { id: 'articulo', label: 'Artículos', icon: '✍️' },
  { id: 'investigacion', label: 'Investigación', icon: '🔬' },
  { id: 'campania', label: 'Campañas y Actividades', icon: '📣' },
];
const iconOf = (t) => TIPOS.find((x) => x.id === t)?.icon || '📄';
const labelOf = (t) => TIPOS.find((x) => x.id === t)?.label || t;

function fmtFecha(v) {
  if (!v) return '';
  return new Date(String(v).split('T')[0] + 'T00:00:00').toLocaleDateString('es-BO', {
    day: 'numeric', month: 'long', year: 'numeric',
  });
}

export default function PublicacionesClient({ publicaciones = [] }) {
  const [tab, setTab] = useState('todas');

  const disponibles = useMemo(() => {
    const set = new Set(publicaciones.map((p) => p.tipo));
    return TIPOS.filter((t) => t.id === 'todas' || set.has(t.id));
  }, [publicaciones]);

  const lista = tab === 'todas' ? publicaciones : publicaciones.filter((p) => p.tipo === tab);

  return (
    <>
      <div className={styles.tabs}>
        {disponibles.map((t) => (
          <button
            key={t.id}
            className={`${styles.tab} ${tab === t.id ? styles.tabActive : ''}`}
            onClick={() => setTab(t.id)}
          >
            {t.icon} {t.label}
          </button>
        ))}
      </div>

      {lista.length === 0 ? (
        <div className={styles.empty}>Aún no hay contenido publicado en esta sección.</div>
      ) : (
        <div className={styles.grid}>
          {lista.map((p) => {
            const link = p.archivo_url || p.enlace_externo;
            return (
              <article key={p.id} className={styles.card}>
                {p.imagen_url ? (
                  <img className={styles.cardImg} src={p.imagen_url} alt={p.titulo} loading="lazy" />
                ) : (
                  <div className={styles.cardImgPlaceholder}>{iconOf(p.tipo)}</div>
                )}
                <div className={styles.cardBody}>
                  <span className={styles.cardTag}>{labelOf(p.tipo)}</span>
                  <h3 className={styles.cardTitle}>{p.titulo}</h3>
                  {p.fecha && <span className={styles.cardDate}>{fmtFecha(p.fecha)}{p.autor ? ` · ${p.autor}` : ''}</span>}
                  {p.descripcion && <p className={styles.cardDesc}>{p.descripcion}</p>}
                  {link && (
                    <a className={styles.cardBtn} href={link} target="_blank" rel="noopener noreferrer">
                      {p.archivo_url ? '⬇ Descargar' : '↗ Ver contenido'}
                    </a>
                  )}
                </div>
              </article>
            );
          })}
        </div>
      )}
    </>
  );
}
