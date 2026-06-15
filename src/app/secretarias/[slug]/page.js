import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import Image from 'next/image';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import styles from './SecretariaDetail.module.css';

export const revalidate = 0; // Mostrar cambios instantáneos (sin caché)

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

// Generar rutas estáticas si es posible, aunque con revalidate es suficiente
export async function generateMetadata({ params }) {
  const supabase = await createClient();
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
  const supabase = await createClient();
  const slug = (await params).slug;

  const { data: sec, error } = await supabase
    .from('secretarias')
    .select('*')
    .eq('slug', slug)
    .single();

  if (error || !sec) {
    notFound();
  }

  const acento = sec.color_acento || '#8B0000';
  const hasVideo = sec.video_url && sec.video_url.trim() !== '';
  const isDirectMp4 = hasVideo && sec.video_url.toLowerCase().includes('.mp4');
  const ytData = hasVideo && !isDirectMp4 ? getYouTubeData(sec.video_url) : { id: null, start: null };
  const youtubeId = ytData.id;
  const youtubeStart = ytData.start ? `&start=${ytData.start}` : '';

  return (
    <>
      <Navbar />
      <div style={{ backgroundColor: '#fafafa', minHeight: '100vh', '--acento': acento }}>
      <div className={styles.hero}>
        {isDirectMp4 ? (
          <div className={styles.videoWrapper}>
            <video
              src={sec.video_url}
              autoPlay
              muted
              loop
              playsInline
              style={{ width: '100%', height: '100%', objectFit: 'cover' }}
            />
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
        ) : sec.banner_url ? (
          <Image 
            src={sec.banner_url} 
            alt={`Banner ${sec.nombre}`} 
            fill
            className={styles.heroImage} 
            sizes="100vw"
          />
        ) : (
          <div className={styles.heroImage} style={{ background: `linear-gradient(45deg, #8b0000, #111)` }}></div>
        )}
        <div className={styles.heroOverlay}></div>
        <div className={styles.heroContent}>
          <div className={styles.iconCircle} style={{ color: acento }}>
            {sec.icono}
          </div>
          <h1 className={styles.heroTitle}>{sec.nombre}</h1>
          <p style={{ fontSize: '1.2rem', opacity: 0.9 }}>Gobierno Autónomo Departamental de Oruro</p>
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

            {sec.mision && (
              <>
                <h2 className={styles.sectionTitle}>Nuestra Misión</h2>
                <div className={styles.textBody} style={{ whiteSpace: 'pre-wrap' }}>
                  {sec.mision}
                </div>
              </>
            )}

            {sec.vision && (
              <>
                <h2 className={styles.sectionTitle}>Nuestra Visión</h2>
                <div className={styles.textBody} style={{ whiteSpace: 'pre-wrap' }}>
                  {sec.vision}
                </div>
              </>
            )}

            {!sec.descripcion && !sec.mision && !sec.vision && (
              <p style={{ color: '#888', fontStyle: 'italic', textAlign: 'center', padding: '2rem 0' }}>
                La información detallada de esta secretaría se está actualizando.
              </p>
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
                    width={140}
                    height={160}
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
      <Footer />
    </>
  );
}
