import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import ShareButtons from './ShareButtons';
import styles from './noticia-detail.module.css';

export async function generateMetadata({ params }) {
  const { id } = await params;
  const supabase = await createClient();
  
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

export default async function NoticiaDetailPage({ params }) {
  const { id } = await params;
  const supabase = await createClient();

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

  // Parse Date
  const fechaStr = new Date(noticia.fecha_publicacion).toLocaleDateString('es-ES', {
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
                  style={{
                    fontSize: '1.0625rem',
                    lineHeight: '1.85',
                    color: 'var(--color-text)',
                    textAlign: 'justify',
                    wordBreak: 'normal',
                    overflowWrap: 'break-word',
                    hyphens: 'none',
                    WebkitHyphens: 'none',
                    width: '100%',
                    maxWidth: '100%',
                    display: 'block',
                  }}
                  dangerouslySetInnerHTML={{ __html: noticia.contenido }}
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
                            width={80}
                            height={80}
                            className={styles.relatedImage} 
                            quality={100}
                          />
                        ) : (
                          <div className={styles.relatedImage} style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '2rem', opacity: 0.5 }}>
                            📰
                          </div>
                        )}
                        <div className={styles.relatedContent}>
                          <h4 className={styles.relatedTitle}>{rel.titulo}</h4>
                          <span className={styles.relatedDate}>
                            {new Date(rel.fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'short' })}
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
