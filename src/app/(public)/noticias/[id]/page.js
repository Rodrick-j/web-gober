import { createClient } from '@/lib/supabase/public';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import ShareButtons from './ShareButtons';
import styles from './noticia-detail.module.css';

export async function generateStaticParams() {
  const supabase = createClient();
  const { data: noticias } = await supabase.from('noticias').select('id');
  return (noticias || []).map((noticia) => ({
    id: noticia.id.toString(),
  }));
}

export async function generateMetadata({ params }) {
  const { id } = await params;
  const supabase = createClient();
  
  const { data: noticia } = await supabase
    .from('noticias')
    .select('titulo, resumen, imagen_portada_url')
    .eq('id', id)
    .single();

  if (!noticia) {
    return { title: 'Noticia no encontrada' };
  }

  return {
    title: `${noticia.titulo} — GADOR`,
    description: noticia.resumen,
    openGraph: {
      title: noticia.titulo,
      description: noticia.resumen,
      images: noticia.imagen_portada_url ? [noticia.imagen_portada_url] : [],
    },
  };
}

function sanitizeHtml(html) {
  if (!html) return '';
  let cleaned = html
    .replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, '')
    .replace(/\b(on[a-z]+)\s*=\s*(?:['"][^'"]*['"]|[^\s>]+)/gi, '')
    .replace(/href\s*=\s*(?:['"]\s*(?:javascript|data):[^'"]*['"]|[^\s>]+)/gi, 'href="#"')
    .replace(/&nbsp;/g, ' ')
    .replace(/(background(-color)?|color)\s*:[^;"]+;?/gi, '')
    // Eliminar párrafos vacíos o con solo saltos/espacios que crean grandes huecos blancos
    .replace(/<p>\s*(?:<br\s*\/?>|\s*)*<\/p>/gi, '')
    // Si hay múltiples saltos <br> seguidos, dejarlos como máximo un salto o párrafo
    .replace(/(?:<br\s*\/?>\s*){3,}/gi, '<br><br>');

  // Si el texto no tiene etiquetas HTML de bloque, convertir saltos de línea \n en párrafos limpios
  if (!/<(?:p|div|br|ul|ol|table|h[1-6])/i.test(cleaned)) {
    cleaned = cleaned
      .split(/\r?\n\r?\n+/)
      .filter(Boolean)
      .map(p => `<p>${p.trim()}</p>`)
      .join('');
  }
  return cleaned;
}

function formatFecha(fechaStr, opts = { day: 'numeric', month: 'long', year: 'numeric' }) {
  if (!fechaStr) return '';
  const dateOnly = fechaStr.split('T')[0];
  return new Date(dateOnly + 'T00:00:00').toLocaleDateString('es-ES', opts);
}

export default async function NoticiaDetailPage({ params }) {
  const { id } = await params;
  const supabase = createClient();

  // Obtener la noticia principal
  const { data: noticia, error } = await supabase
    .from('noticias')
    .select(`
      *,
      secretarias ( 
        nombre,
        nombre_corto, 
        icono,
        secretario_nombre,
        secretario_cargo,
        secretario_foto_url
      )
    `)
    .eq('id', id)
    .eq('estado', 'publicado')
    .single();

  if (error || !noticia) {
    notFound();
  }

  // Obtener 3 noticias relacionadas (últimas publicadas que no sean esta)
  const { data: relacionadas } = await supabase
    .from('noticias')
    .select('id, titulo, fecha_publicacion, imagen_portada_url')
    .eq('estado', 'publicado')
    .neq('id', id)
    .order('fecha_publicacion', { ascending: false })
    .limit(3);

  const fechaStr = formatFecha(noticia.fecha_publicacion, {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    year: 'numeric'
  });

  return (
    <>

      
      <main className={styles.articlePage}>
        {/* Hero Section */}
        <section className={styles.heroSection}>
          {noticia.imagen_portada_url && (
            <div className={styles.heroBlurredBg} style={{ backgroundImage: `url(${noticia.imagen_portada_url})` }}></div>
          )}
          {noticia.imagen_portada_url ? (
            <Image 
              src={noticia.imagen_portada_url} 
              alt={noticia.titulo} 
              fill
              className={styles.heroImage} 
              sizes="100vw"
              priority
              quality={100}
            />
          ) : (
            <div className={styles.heroImage} style={{ background: 'var(--color-surface-2)', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '5rem', opacity: 0.5 }}>
              {noticia.secretarias?.icono || '📰'}
            </div>
          )}
          <div className={styles.heroOverlay}></div>
          
          <div className="container" style={{ zIndex: 3, width: '100%' }}>
            <div className={styles.heroContent}>
              <div className={styles.heroMeta}>
                <span className="badge badge-red">{noticia.secretarias?.nombre_corto || 'Institucional'}</span>
                <span className={styles.heroDate}>{fechaStr}</span>
              </div>
              <h1 className={styles.heroTitle}>{noticia.titulo}</h1>
              {noticia.resumen && (
                <p className={styles.heroSubtitle}>{noticia.resumen}</p>
              )}
            </div>
          </div>
        </section>

        {/* Content Section */}
        <section className="container">
          <div className={styles.articleLayout}>
            
            <article className={styles.mainContent} style={{ minWidth: 0, width: '100%', overflow: 'hidden' }}>
              <div
                className="rich-text-content"
                style={{
                  background: '#fff',
                  borderRadius: '16px',
                  padding: '2rem 2.5rem',
                  boxShadow: '0 4px 20px rgba(0,0,0,0.06)',
                  border: '1px solid #E5E7EB',
                  boxSizing: 'border-box',
                  width: '100%',
                  overflow: 'hidden',
                }}
              >
                <div
                  className={styles.richTextContent}
                  style={{
                    fontSize: '1.0625rem',
                    lineHeight: '1.45',
                    color: 'var(--color-text)',
                    width: '100%',
                    maxWidth: '100%',
                    display: 'block',
                  }}
                  dangerouslySetInnerHTML={{ __html: sanitizeHtml(noticia.contenido) }}
                />
              </div>
            </article>

            <aside className={styles.sidebar}>
              {/* Autoridad Widget */}
              {noticia.secretarias && (
                <div className={styles.sidebarWidget}>
                  <h3 className={styles.widgetTitle}>Publicado por</h3>
                  <div className={styles.authorityCard}>
                    <div className={styles.authorityImage}>
                      {noticia.secretarias.secretario_foto_url ? (
                        <Image 
                          src={noticia.secretarias.secretario_foto_url} 
                          alt={noticia.secretarias.secretario_nombre || 'Autoridad'} 
                          width={70}
                          height={70}
                          style={{ objectFit: 'cover' }}
                          quality={100}
                        />
                      ) : (
                        <div className={styles.authorityPlaceholder}>
                          {noticia.secretarias.icono || '👤'}
                        </div>
                      )}
                    </div>
                    <div className={styles.authorityInfo}>
                      <h4 className={styles.authorityName}>
                        {noticia.secretarias.secretario_nombre || 'Autoridad no designada'}
                      </h4>
                      <p className={styles.authorityRole}>
                        {noticia.secretarias.secretario_cargo || 'Secretario/a Departamental'}
                      </p>
                      <p className={styles.authorityDept}>
                        {noticia.secretarias.nombre || noticia.secretarias.nombre_corto || 'Secretaría General'}
                      </p>
                    </div>
                  </div>
                </div>
              )}

              <div className={styles.sidebarWidget}>
                <h3 className={styles.widgetTitle}>Compartir Noticia</h3>
                <ShareButtons title={noticia.titulo} />
              </div>

              {(noticia.enlace_facebook || noticia.enlace_twitter || noticia.enlace_instagram || noticia.enlace_tiktok) && (
                <div className={styles.sidebarWidget}>
                  <h3 className={styles.widgetTitle}>Ver en Redes Sociales</h3>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '0.8rem' }}>
                    {noticia.enlace_facebook && (
                      <a href={noticia.enlace_facebook} target="_blank" rel="noopener noreferrer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#1877F2', fontWeight: 600, textDecoration: 'none', padding: '0.5rem 0.8rem', background: '#F0F2F5', borderRadius: '8px' }}>
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.469h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.469h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                        Ver en Facebook
                      </a>
                    )}
                    {noticia.enlace_twitter && (
                      <a href={noticia.enlace_twitter} target="_blank" rel="noopener noreferrer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#000', fontWeight: 600, textDecoration: 'none', padding: '0.5rem 0.8rem', background: '#E5E7EB', borderRadius: '8px' }}>
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z"/></svg>
                        Ver en X (Twitter)
                      </a>
                    )}
                    {noticia.enlace_instagram && (
                      <a href={noticia.enlace_instagram} target="_blank" rel="noopener noreferrer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#E1306C', fontWeight: 600, textDecoration: 'none', padding: '0.5rem 0.8rem', background: '#FCE4EC', borderRadius: '8px' }}>
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/></svg>
                        Ver en Instagram
                      </a>
                    )}
                    {noticia.enlace_tiktok && (
                      <a href={noticia.enlace_tiktok} target="_blank" rel="noopener noreferrer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#000', fontWeight: 600, textDecoration: 'none', padding: '0.5rem 0.8rem', background: '#FCE4EC', borderRadius: '8px' }}>
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.04.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.35-4.2-.97-.57-.26-1.1-.59-1.62-.93-.01 2.92.01 5.84-.02 8.75-.08 1.4-.54 2.79-1.35 3.94-1.31 1.92-3.58 3.17-5.91 3.21-1.43.08-2.86-.31-4.08-1.03-2.02-1.19-3.44-3.37-3.65-5.71-.02-.5-.03-1-.01-1.49.18-1.9 1.12-3.72 2.58-4.96 1.66-1.44 3.98-2.13 6.15-1.72.02 1.48-.04 2.96-.04 4.44-.99-.32-2.15-.23-3.02.37-.63.41-1.11 1.04-1.36 1.75-.21.51-.15 1.07-.14 1.61.24 1.64 1.82 3.02 3.5 2.87 1.12-.01 2.19-.66 2.77-1.61.19-.33.4-.67.41-1.06.1-1.79.06-3.57.07-5.36.01-4.03-.01-8.05.02-12.07z"/></svg>
                        Ver en TikTok
                      </a>
                    )}
                  </div>
                </div>
              )}

              {relacionadas && relacionadas.length > 0 && (
                <div className={styles.sidebarWidget}>
                  <h3 className={styles.widgetTitle}>Últimas Noticias</h3>
                  <div className={styles.relatedNewsList}>
                    {relacionadas.map((rel) => (
                      <Link href={`/noticias/${rel.id}`} key={rel.id} className={styles.relatedCard}>
                        {rel.imagen_portada_url ? (
                          <Image 
                            src={rel.imagen_portada_url} 
                            alt={rel.titulo} 
                            width={300}
                            height={160}
                            className={styles.relatedImage} 
                            quality={100}
                          />
                        ) : (
                          <div className={styles.relatedImage} style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '3rem', opacity: 0.5 }}>
                            📰
                          </div>
                        )}
                        <div className={styles.relatedContent}>
                          <h4 className={styles.relatedTitle}>{rel.titulo}</h4>
                          <span className={styles.relatedDate}>
                            {formatFecha(rel.fecha_publicacion, { day: 'numeric', month: 'short' })}
                          </span>
                        </div>
                      </Link>
                    ))}
                  </div>
                </div>
              )}
            </aside>

          </div>
        </section>
      </main>


    </>
  );
}
