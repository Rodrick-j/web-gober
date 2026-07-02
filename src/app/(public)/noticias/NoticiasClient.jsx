"use client";

import { useState, useEffect, useCallback } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { createClient } from '@/lib/supabase/public';
import styles from './noticias.module.css';

const CATEGORIES = ['Todas', 'Gobernador', 'Salud', 'Obras Públicas', 'Educación', 'Cultura y Turismo', 'Deportes'];

function formatFecha(fechaStr, opts = { day: 'numeric', month: 'long', year: 'numeric' }) {
  if (!fechaStr) return '';
  const dateOnly = fechaStr.split('T')[0];
  return new Date(dateOnly + 'T00:00:00').toLocaleDateString('es-ES', opts);
}

export default function NoticiasClient() {
  const [allNoticias, setAllNoticias] = useState([]);
  const [comunicados, setComunicados] = useState([]);
  const [query, setQuery] = useState('');
  const [category, setCategory] = useState('Todas');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const supabase = createClient();
    supabase
      .from('noticias')
      .select(`id, titulo, resumen, fecha_publicacion, imagen_portada_url, categoria, es_comunicado_rapido, secretarias ( nombre_corto, icono, color_acento )`)
      .eq('estado', 'publicado')
      .order('fecha_publicacion', { ascending: false })
      .then(({ data }) => {
        const noticias = data || [];
        setComunicados(noticias.filter(n => n.es_comunicado_rapido).slice(0, 5));
        setAllNoticias(noticias.filter(n => !n.es_comunicado_rapido));
        setLoading(false);
      });
  }, []);

  const filtered = allNoticias.filter(n => {
    const matchQuery = !query || n.titulo?.toLowerCase().includes(query.toLowerCase()) || n.resumen?.toLowerCase().includes(query.toLowerCase());
    const matchCat = category === 'Todas' || n.categoria === category;
    return matchQuery && matchCat;
  });

  const isSearching = !!query || category !== 'Todas';
  const featured = !isSearching && filtered.length > 0 ? filtered[0] : null;
  const gridNews = featured ? filtered.slice(1) : filtered;

  return (
    <main className={styles.mainContainer}>
      <div className="container">
        <header className={styles.portalHeader}>
          <div className={styles.headerText}>
            <span className="section-label">Sala de Prensa</span>
            <h1 className={styles.mainTitle}>Noticias y Comunicados</h1>
            <p className={styles.subtitle}>
              Mantente informado con la actualidad del Gobierno Autónomo Departamental de Oruro.
            </p>
          </div>
          <div className={styles.headerSearch}>
            <input
              type="text"
              placeholder="Buscar noticias..."
              value={query}
              onChange={e => setQuery(e.target.value)}
              style={{
                width: '100%',
                padding: '0.75rem 1rem',
                border: '1px solid #ddd',
                borderRadius: '8px',
                fontSize: '1rem',
              }}
            />
          </div>
        </header>

        <div className="divider divider-left" style={{ marginBottom: '1rem' }} />

        {/* Filtros de Categorías */}
        <div className={styles.filtersWrapper}>
          {CATEGORIES.map(cat => (
            <button
              key={cat}
              onClick={() => setCategory(cat)}
              className={`${styles.filterPill} ${category === cat ? styles.active : ''}`}
            >
              {cat === 'Todas' ? 'Todas las noticias' : cat}
            </button>
          ))}
        </div>

        <div className={styles.layoutGrid}>
          <div className={styles.mainColumn}>
            {loading && (
              <div style={{ textAlign: 'center', padding: '3rem', color: '#888' }}>Cargando noticias...</div>
            )}

            {!loading && filtered.length === 0 && (
              <div className={styles.emptyState}>
                <div style={{ fontSize: '3rem', marginBottom: '1rem' }}>📰</div>
                <h2>No se encontraron noticias</h2>
                <p>{isSearching ? 'No hay resultados para tu búsqueda o filtro actual.' : 'Aún no hay noticias publicadas.'}</p>
                {isSearching && (
                  <button onClick={() => { setQuery(''); setCategory('Todas'); }} className="btn btn-outline" style={{ marginTop: '1rem' }}>
                    Ver todas las noticias
                  </button>
                )}
              </div>
            )}

            {/* Noticia Destacada */}
            {featured && (
              <Link href={`/noticias/${featured.id}`} className={styles.featuredCard}>
                <div className={styles.featuredImage}>
                  {featured.imagen_portada_url ? (
                    <Image src={featured.imagen_portada_url} alt={featured.titulo} fill style={{ objectFit: 'cover' }} sizes="(max-width: 992px) 100vw, 60vw" priority quality={100} />
                  ) : (
                    <div className={styles.noImage}>GADOR</div>
                  )}
                </div>
                <div className={styles.featuredContent}>
                  <div className={styles.cardMeta}>
                    <span className="badge badge-red">{featured.categoria !== 'Todas' ? featured.categoria : (featured.secretarias?.nombre_corto || 'Institucional')}</span>
                    <span className={styles.cardDate}>{formatFecha(featured.fecha_publicacion)}</span>
                  </div>
                  <h2 className={styles.featuredTitle}>{featured.titulo}</h2>
                  <p className={styles.featuredExcerpt}>{featured.resumen}</p>
                  <div className={styles.readMore}>Leer artículo completo &rarr;</div>
                </div>
              </Link>
            )}

            {/* Grilla de Noticias */}
            {gridNews.length > 0 && (
              <div className={styles.newsGrid}>
                {gridNews.map((noticia) => (
                  <Link href={`/noticias/${noticia.id}`} key={noticia.id} className={`${styles.newsCard} card`}>
                    <div className={styles.cardImageWrapper}>
                      {noticia.imagen_portada_url ? (
                        <Image src={noticia.imagen_portada_url} alt={noticia.titulo} fill className={styles.cardImage} sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw" quality={100} />
                      ) : (
                        <div className={styles.cardNoImage}>{noticia.secretarias?.icono || '📰'}</div>
                      )}
                    </div>
                    <div className={styles.cardBody}>
                      <div className={styles.cardMeta}>
                        <span className="badge badge-gray">{noticia.categoria !== 'Todas' ? noticia.categoria : (noticia.secretarias?.nombre_corto || 'Institucional')}</span>
                        <span className={styles.cardDate}>{formatFecha(noticia.fecha_publicacion, { day: 'numeric', month: 'short', year: 'numeric' })}</span>
                      </div>
                      <h3 className={styles.cardTitle}>{noticia.titulo}</h3>
                      <p className={styles.cardExcerpt}>{noticia.resumen}</p>
                      
                      <div className={styles.cardAction}>
                        <span>Ver noticia</span>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                          <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            )}
          </div>

          {/* Sidebar */}
          <aside className={styles.sidebar}>
            <div className={styles.sidebarWidget}>
              <h3 className={styles.widgetTitle}>
                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 24 24" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"></path></svg>
                Comunicados Oficiales
              </h3>
              <div className={styles.comunicadoList}>
                {comunicados.length > 0 ? (
                  comunicados.map((comunicado) => (
                    <Link href={`/noticias/${comunicado.id}`} key={comunicado.id} className={styles.comunicadoItem}>
                      <span className={styles.comunicadoDate}>{formatFecha(comunicado.fecha_publicacion, { day: 'numeric', month: 'short' })}</span>
                      <h4 className={styles.comunicadoTitle}>{comunicado.titulo}</h4>
                    </Link>
                  ))
                ) : (
                  <p style={{ color: 'var(--color-text-muted)', fontSize: '0.9rem' }}>No hay avisos recientes.</p>
                )}
              </div>
            </div>
          </aside>
        </div>

        {/* Banner de Newsletter */}
        <div className={styles.newsletterBanner}>
          <div className={styles.newsletterText}>
            <h3>Mantente Informado</h3>
            <p>Recibe los comunicados urgentes y noticias más importantes directamente en tu correo electrónico o WhatsApp.</p>
          </div>
          <form className={styles.newsletterForm} action="/noticias">
            <input type="email" placeholder="Tu correo o número celular..." required />
            <button type="submit">Suscribirme</button>
          </form>
        </div>
      </div>
    </main>
  );
}
