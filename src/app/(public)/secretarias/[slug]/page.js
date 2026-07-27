import { createClient } from '@/lib/supabase/public';
import { notFound } from 'next/navigation';
import Image from 'next/image';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import MisionVisionSection from '@/components/MisionVisionSection/MisionVisionSection';
import styles from './SecretariaDetail.module.css';

import EstadisticasChartWrapper from '@/components/EstadisticasChart/EstadisticasChartWrapper';
import PlanificacionSection from './PlanificacionSection';
import SecretariatTabs from '@/components/SecretariatTabs/SecretariatTabs';



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

  // Override para secretaría de planificación
  if (slug.includes('planificacion')) {
    sec.video_url = '/video-planificacion.mp4';
  }

  // Override para secretaría de desarrollo productivo e industria
  if (slug.includes('productiv') || slug.includes('industria')) {
    sec.video_url = '/video-desarrollo-productivo.mp4';
  }

  // Override para secretaría de obras públicas
  if (slug.includes('obras')) {
    sec.video_url = '/video-obras-publicas.mp4';
  }

  // Override para secretaría de medio ambiente
  if (slug.includes('medio-ambiente') || slug.includes('madre-tierra') || slug.includes('agua')) {
    sec.video_url = '/video-medio-ambiente.mp4';
  }

  // Override para secretaría de minería
  if (slug.includes('mineria') || slug.includes('metalurgia')) {
    sec.video_url = '/video-mineria.mp4';
  }

  // Override para secretaría de desarrollo social
  if (slug.includes('social')) {
    sec.video_url = '/video-desarrollo-social.mp4';
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

  const isProductivo = slug.includes('productiv') || slug.includes('industria');
  const isCompactVideo = hasVideo && isProductivo;


  return (
    <>

      <div style={{ backgroundColor: 'transparent', '--acento': acento }}>
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
              style={{ 
                position: 'absolute', 
                top: 0, 
                left: 0, 
                width: '100%', 
                height: '100%', 
                backgroundImage: `url(${sec.banner_url || '/secretaria_default_banner.png'})`, 
                backgroundSize: 'cover', 
                backgroundPosition: 'center' 
              }}
            ></div>
          </div>
        ) : (
          <Image 
            src={sec.banner_url || '/secretaria_default_banner.png'} 
            alt={`Banner ${sec.nombre}`} 
            fill
            priority={true}
            className={styles.heroImage} 
            style={{ objectFit: 'cover', objectPosition: 'center' }}
            sizes="100vw"
          />
        )}
        <div className={styles.heroOverlay}></div>
      </div>

      </div>

      <SecretariatTabs sec={sec} slug={slug} />

    </>
  );
}
