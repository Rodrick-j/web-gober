import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import Image from 'next/image';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import NoticiasSearch from './NoticiasSearch';
import styles from './noticias.module.css';

export const metadata = {
  title: 'Sala de Prensa — Gobierno Departamental de Oruro',
  description: 'Últimas noticias y comunicados oficiales de la Gobernación de Oruro.',
};

export default async function NoticiasPortalPage({ searchParams }) {
  const resolvedSearchParams = await searchParams;
  const queryParam = resolvedSearchParams?.q || '';

  // Construir la consulta
  const supabase = await createClient();
  let query = supabase
    .from('noticias')
    .select(`
      id, 
      titulo, 
      resumen, 
      fecha_publicacion, 
      imagen_portada_url,
      categoria,
      es_comunicado_rapido,
      secretarias ( nombre_corto, icono, color_acento )
    `)
    .eq('estado', 'publicado')
    .order('fecha_publicacion', { ascending: false });

  // Si hay término de búsqueda, usar textSearch o ilike
  if (queryParam) {
    query = query.ilike('titulo', `%${queryParam}%`);
  }

  const { data: allNoticias, error } = await query;
  const noticiasSeguras = allNoticias || [];

  // Separar comunicados rápidos de noticias principales
  const comunicados = noticiasSeguras.filter(n => n.es_comunicado_rapido).slice(0, 5);
  let mainNoticias = noticiasSeguras.filter(n => !n.es_comunicado_rapido);

  // Filtrado por categoría
  const categoryParam = resolvedSearchParams?.categoria || 'Todas';
  if (categoryParam !== 'Todas') {
    mainNoticias = mainNoticias.filter(n => n.categoria === categoryParam);
  }

  // Separar noticia destacada solo si no hay búsqueda activa y hay resultados
  const isSearching = !!queryParam || categoryParam !== 'Todas';
  const featured = !isSearching && mainNoticias.length > 0 ? mainNoticias[0] : null;
  const gridNews = featured ? mainNoticias.slice(1) : mainNoticias;

  return (
    <>

      <main className={styles.mainContainer}>
        <div className="container">
          <header className={styles.portalHeader}>
            <div className={styles.headerText}>
              <span className="section-label">Sala de Prensa</span>
              <h1 className={styles.mainTitle}>
                Noticias y Comunicados
              </h1>
              <p className={styles.subtitle}>
                Mantente informado con la actualidad del Gobierno Autónomo Departamental de Oruro.
              </p>
            </div>
            <div className={styles.headerSearch}>
              <NoticiasSearch initialQuery={queryParam} />
            </div>
          </header>

          <div className="divider divider-left" style={{ marginBottom: '1rem' }} />

          {/* Filtros de Categorías */}
          <div className={styles.filtersWrapper}>
            <Link href="/noticias" className={`${styles.filterPill} ${categoryParam === 'Todas' ? styles.active : ''}`}>
              Todas las noticias
            </Link>
            {['Gobernador', 'Salud', 'Obras Públicas', 'Educación', 'Cultura y Turismo', 'Deportes'].map(cat => (
              <Link 
                key={cat}
                href={`/noticias?categoria=${encodeURIComponent(cat)}`} 
                className={`${styles.filterPill} ${categoryParam === cat ? styles.active : ''}`}
              >
                {cat}
              </Link>
            ))}
          </div>

          <div className={styles.layoutGrid}>
            <div className={styles.mainColumn}>

          {/* Estado vacío o sin resultados */}
          {mainNoticias.length === 0 && (
            <div className={styles.emptyState}>
              <div style={{ fontSize: '3rem', marginBottom: '1rem' }}>📰</div>
              <h2>No se encontraron noticias</h2>
              <p>
                {isSearching 
                  ? `No hay resultados para tu búsqueda o filtro actual.` 
                  : "Aún no hay noticias publicadas."}
              </p>
              {isSearching && (
                <Link href="/noticias" className="btn btn-outline" style={{ marginTop: '1rem' }}>
                  Ver todas las noticias
                </Link>
              )}
            </div>
          )}

          {/* Noticia Destacada (solo cuando no se está buscando) */}
          {featured && (
            <Link href={`/noticias/${featured.id}`} className={styles.featuredCard}>
              <div className={styles.featuredImage}>
                {featured.imagen_portada_url ? (
                  <Image 
                    src={featured.imagen_portada_url} 
                    alt={featured.titulo} 
                    fill
                    style={{ objectFit: 'cover' }}
                    sizes="(max-width: 992px) 100vw, 60vw"
                    priority
                    quality={100}
                  />
                ) : (
                  <div className={styles.noImage}>GADOR</div>
                )}
              </div>
              <div className={styles.featuredContent}>
                <div className={styles.cardMeta}>
                  <span className="badge badge-red">{featured.categoria !== 'Todas' ? featured.categoria : (featured.secretarias?.nombre_corto || 'Institucional')}</span>
                  <span className={styles.cardDate}>
                    {new Date(featured.fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'long', year: 'numeric' })}
                  </span>
                </div>
                <h2 className={styles.featuredTitle}>{featured.titulo}</h2>
                <p className={styles.featuredExcerpt}>{featured.resumen}</p>
                <div className={styles.readMore}>
                  Leer artículo completo &rarr;
                </div>
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
                      <Image 
                        src={noticia.imagen_portada_url} 
                        alt={noticia.titulo} 
                        fill
                        className={styles.cardImage} 
                        sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
                        quality={100}
                      />
                    ) : (
                      <div className={styles.cardNoImage}>{noticia.secretarias?.icono || '📰'}</div>
                    )}
                  </div>
                  <div className={styles.cardBody}>
                    <div className={styles.cardMeta}>
                      <span className="badge badge-gray">{noticia.categoria !== 'Todas' ? noticia.categoria : (noticia.secretarias?.nombre_corto || 'Institucional')}</span>
                      <span className={styles.cardDate}>
                        {new Date(noticia.fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'short', year: 'numeric' })}
                      </span>
                    </div>
                    <h3 className={styles.cardTitle}>{noticia.titulo}</h3>
                    <p className={styles.cardExcerpt}>{noticia.resumen}</p>
                  </div>
                </Link>
              ))}
            </div>
          )}
        </div>

            {/* Columna Lateral (Sidebar) */}
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
                        <span className={styles.comunicadoDate}>
                          {new Date(comunicado.fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'short' })}
                        </span>
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

    </>
  );
}
