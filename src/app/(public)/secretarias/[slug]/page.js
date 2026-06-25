import { createClient } from '@/lib/supabase/public';
import { notFound } from 'next/navigation';
import Image from 'next/image';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import MisionVisionSection from '@/components/MisionVisionSection/MisionVisionSection';
import styles from './SecretariaDetail.module.css';

import EstadisticasChartWrapper from '@/components/EstadisticasChart/EstadisticasChartWrapper';



function getYouTubeData(url) {
  if (!url) return { id: null, start: null };
  const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
  const match = url.match(regExp);
  const id = (match && match[2].length === 11) ? match[2] : null;
  
  let start = null;
  const timeMatch = url.match(/[?&](t|start)=(\d+)s?/);
  if (timeMatch) {
    start = timeMatch[2];
  }
  return { id, start };
}

export async function generateStaticParams() {
  const supabase = createClient();
  const { data: secretarias } = await supabase.from('secretarias').select('slug');
  return (secretarias || []).map((sec) => ({
    slug: sec.slug,
  }));
}

// Generar rutas estáticas si es posible, aunque con revalidate es suficiente
export async function generateMetadata({ params }) {
  const supabase = createClient();
  const slug = (await params).slug;
  const { data: secretaria } = await supabase
    .from('secretarias')
    .select('nombre, descripcion')
    .eq('slug', slug)
    .single();

  if (!secretaria) return { title: 'Secretaría no encontrada' };

  return {
    title: `${secretaria.nombre} | GADOR`,
    description: secretaria.descripcion || `Portal oficial de la ${secretaria.nombre}`,
  };
}

export default async function SecretariaDetailPage({ params }) {
  const supabase = createClient();
  const slug = (await params).slug;

  const { data: sec, error } = await supabase
    .from('secretarias')
    .select('*')
    .eq('slug', slug)
    .single();

  if (error || !sec) {
    notFound();
  }

  // Override para secretaría de minería
  if (slug === 'mineria-metalurgia-recursos-energeticos') {
    sec.banner_url = '/banner-mineria.png';
  }

  const acento = sec.color_acento || '#8B0000';
  
  const hasSpecificVideo = sec.video_url && sec.video_url.trim() !== '';
  const isDefaultBanner = !sec.banner_url || sec.banner_url === '/secretaria_default_banner.png';
  
  // Si no tiene video específico y usa el banner estático, lo reemplazamos por el video
  const finalVideoUrl = hasSpecificVideo ? sec.video_url : (isDefaultBanner ? '/default_banner_video.mp4' : null);
  
  const hasVideo = finalVideoUrl !== null;
  const isDirectMp4 = hasVideo && finalVideoUrl.toLowerCase().includes('.mp4');
  const ytData = hasVideo && !isDirectMp4 ? getYouTubeData(finalVideoUrl) : { id: null, start: null };
  const youtubeId = ytData.id;
  const youtubeStart = ytData.start ? `&start=${ytData.start}` : '';

  const nombreRaw = sec.nombre || '';
  const prefix = "Secretaría Departamental de";
  let titlePrefix = "";
  let titleSuffix = "";

  if (nombreRaw.toLowerCase().startsWith(prefix.toLowerCase())) {
    titlePrefix = "SECRETARÍA DEPARTAMENTAL DE";
    titleSuffix = nombreRaw.substring(prefix.length).trim().toUpperCase();
  } else {
    titleSuffix = nombreRaw.toUpperCase();
  }

  return (
    <>

      <div style={{ backgroundColor: '#fafafa', minHeight: '100vh', '--acento': acento }}>
      <div className={styles.hero}>
        {isDirectMp4 ? (
          <div className={styles.videoWrapper}>
            <video
              src={finalVideoUrl}
              autoPlay
              muted
              loop
              playsInline
              style={{ width: '100%', height: '100%', objectFit: 'cover' }}
            />
            {/* Texto ORURO para tapar marca de agua de Gemini */}
            <div style={{
              position: 'absolute',
              bottom: '5px',
              right: '20px',
              zIndex: 10,
              color: 'rgba(255,255,255,0.9)',
              fontSize: '1.2rem',
              fontWeight: '900',
              letterSpacing: '5px',
              textShadow: '0 2px 5px rgba(0,0,0,0.8)',
              padding: '10px 25px',
              background: 'rgba(0,0,0,0.6)',
              borderRadius: '8px',
              backdropFilter: 'blur(8px)'
            }}>
              ORURO
            </div>
          </div>
        ) : youtubeId ? (
          <div className={styles.videoWrapper}>
            <iframe
              src={`https://www.youtube.com/embed/${youtubeId}?autoplay=1&mute=1&loop=1&playlist=${youtubeId}&controls=0&showinfo=0&rel=0&modestbranding=1&playsinline=1&iv_load_policy=3&disablekb=1&fs=0${youtubeStart}`}
              frameBorder="0"
              allow="autoplay; encrypted-media"
              allowFullScreen
              className={styles.heroVideo}
            />
            {/* Telón estético (usa el banner si existe) para ocultar la carga de YouTube */}
            <div 
              className={styles.videoCurtain}
              style={sec.banner_url ? { 
                backgroundImage: `url(${sec.banner_url})`, 
                backgroundSize: 'cover', 
                backgroundPosition: 'center' 
              } : { backgroundColor: '#111' }}
            ></div>
          </div>
        ) : (
          <Image 
            src={sec.banner_url || '/secretaria_default_banner.png'} 
            alt={`Banner ${sec.nombre}`} 
            fill
            className={styles.heroImage} 
            style={{ objectFit: 'cover', objectPosition: 'center' }}
            sizes="100vw"
          />
        )}
        <div className={styles.heroOverlay}></div>
        <div className={styles.heroContent}>
          <h1 className={styles.heroTitle}>
            {titlePrefix && <span className={styles.heroTitlePrefix}>{titlePrefix}</span>}
            <span className={styles.heroTitleSuffix}>{titleSuffix}</span>
          </h1>
          <p className={styles.heroSubtitle}>Gobierno Autónomo Departamental de Oruro</p>
        </div>
      </div>

      <div className={styles.mainContainer}>
        {/* Columna Principal (Textos) */}
        <div>
          <div className={styles.contentBlock}>
            {sec.descripcion && (
              <>
                <h2 className={styles.sectionTitle}>Acerca de nosotros</h2>
                <div className={styles.textBody} style={{ fontSize: '1.2rem', color: '#222' }}>
                  {sec.descripcion}
                </div>
              </>
            )}

            <MisionVisionSection 
              mision={sec.mision} 
              vision={sec.vision} 
              titleClass={styles.sectionTitle} 
              textClass={styles.textBody} 
            />

            {!sec.descripcion && !sec.mision && !sec.vision && (
              <p style={{ color: '#888', fontStyle: 'italic', textAlign: 'center', padding: '2rem 0' }}>
                La información detallada de esta secretaría se está actualizando.
              </p>
            )}

            {slug.includes('planificacion') && (
              <div style={{ marginTop: '40px' }}>
                <EstadisticasChartWrapper />
              </div>
            )}
          </div>
        </div>

        {/* Columna Lateral (Sidebar) */}
        <div>
          {/* Tarjeta de Autoridad */}
          <div className={styles.sidebarCard}>
            <div className={styles.sidebarCardHeader}>Autoridad a Cargo</div>
            <div className={styles.sidebarCardBody}>
              <div className={styles.secretarioInfo}>
                {sec.secretario_foto_url ? (
                  <Image 
                    src={sec.secretario_foto_url} 
                    alt={sec.secretario_nombre || 'Autoridad'} 
                    width={300}
                    height={350}
                    className={styles.secretarioFoto} 
                  />
                ) : (
                  <div className={styles.secretarioFotoPlaceholder}>👤</div>
                )}
                <h3 className={styles.secretarioNombre}>
                  {sec.secretario_nombre || 'Por designar'}
                </h3>
                <div className={styles.secretarioCargo}>
                  {sec.secretario_cargo || 'Autoridad Departamental'}
                </div>
                {sec.secretario_bio && (
                  <p className={styles.secretarioBio}>{sec.secretario_bio}</p>
                )}
              </div>
            </div>
          </div>

          {/* Tarjeta de Contacto */}
          <div className={styles.sidebarCard}>
            <div className={styles.sidebarCardHeader}>Atención al Ciudadano</div>
            <div className={styles.sidebarCardBody}>
              {sec.direccion && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>📍</div>
                  <div>
                    <span className={styles.contactoLabel}>Dirección</span>
                    <span className={styles.contactoValor}>{sec.direccion}</span>
                  </div>
                </div>
              )}
              
              {sec.telefono && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>📞</div>
                  <div>
                    <span className={styles.contactoLabel}>Teléfono</span>
                    <span className={styles.contactoValor}>{sec.telefono}</span>
                  </div>
                </div>
              )}

              {sec.email && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>✉️</div>
                  <div>
                    <span className={styles.contactoLabel}>Correo Electrónico</span>
                    <span className={styles.contactoValor}>{sec.email}</span>
                  </div>
                </div>
              )}

              {sec.horario && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>🕒</div>
                  <div>
                    <span className={styles.contactoLabel}>Horarios de Atención</span>
                    <span className={styles.contactoValor}>{sec.horario}</span>
                  </div>
                </div>
              )}

              {!sec.direccion && !sec.telefono && !sec.email && !sec.horario && (
                <p style={{ color: '#888', fontStyle: 'italic', textAlign: 'center', margin: 0 }}>
                  Información de contacto no disponible.
                </p>
              )}
            </div>
          </div>
        </div>
      </div>
      </div>

    </>
  );
}
