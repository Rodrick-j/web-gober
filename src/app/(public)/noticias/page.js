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
      secretarias ( nombre_corto, icono, color_acento )
    `)
    .eq('estado', 'publicado')
    .order('fecha_publicacion', { ascending: false });

  // Si hay término de búsqueda, usar textSearch o ilike
  if (queryParam) {
    query = query.ilike('titulo', `%${queryParam}%`);
  }

  const { data: noticias, error } = await query;

  // Separar noticia destacada solo si no hay búsqueda activa y hay resultados
  const isSearching = !!queryParam;
  const featured = !isSearching && noticias?.length > 0 ? noticias[0] : null;
  const gridNews = featured ? noticias.slice(1) : (noticias || []);

  return (
    <>

      <main className={styles.mainContainer}>
        <div className="container">
          <header className={styles.portalHeader}>
            <div className={styles.headerText}>
              <span className="section-label">Sala de Prensa</span>
              <h1 className="section-title" style={{ textAlign: 'left', marginBottom: '1rem' }}>
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

          <div className="divider divider-left" style={{ marginBottom: '3rem' }} />

          {/* Estado vacío o sin resultados */}
          {(!noticias || noticias.length === 0) && (
            <div className={styles.emptyState}>
              <div style={{ fontSize: '3rem', marginBottom: '1rem' }}>📰</div>
              <h2>No se encontraron noticias</h2>
              <p>
                {isSearching 
                  ? `No hay resultados para "${queryParam}". Intenta con otros términos.` 
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
                  <span className="badge badge-red">{featured.secretarias?.nombre_corto || 'Institucional'}</span>
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
                      <span className="badge badge-gray">{noticia.secretarias?.nombre_corto || 'Institucional'}</span>
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
      </main>

    </>
  );
}
