import { cookies } from 'next/headers';
import dynamic from 'next/dynamic';
import GovernorSection from '@/components/GovernorSection/GovernorSection';
import HeroSlider from '@/components/HeroSlider/HeroSlider';
import IntroAnimation from '@/components/IntroAnimation/IntroAnimation';
import BreakingNews from '@/components/BreakingNews/BreakingNews';
import { createClient } from '@/lib/supabase/server';

// Dynamic imports para componentes below-the-fold
const SecretariatsSection = dynamic(() => import('@/components/SecretariatsSection/SecretariatsSection'), { ssr: true });
const QuickAccess = dynamic(() => import('@/components/QuickAccess/QuickAccess'), { ssr: true });
const NewsSection = dynamic(() => import('@/components/NewsSection/NewsSection'), { ssr: true });
const GacetaSection = dynamic(() => import('@/components/GacetaSection/GacetaSection'), { ssr: true });
const LocationSection = dynamic(() => import('@/components/LocationSection/LocationSection'), { ssr: true });
const CenefaCultural = dynamic(() => import('@/components/CenefaCultural/CenefaCultural'), { ssr: true });
const PopupComunicado = dynamic(() => import('@/components/PopupComunicado/PopupComunicado'), { ssr: true });

export default async function Home() {
  const supabase = await createClient();
  const cookieStore = await cookies();
  const introSeen = cookieStore.get('introSeen')?.value === '1';

  // Ejecutar todas las consultas a la base de datos en paralelo
  const [
    { data: banners },
    { data: configData },
    { data: secretarias },
    { data: ultimasNoticias },
    { data: ultimosDocumentos }
  ] = await Promise.all([
    supabase.from('banners_inicio').select('*').eq('activo', true).order('orden', { ascending: true }),
    supabase.from('configuracion_global').select('*').in('clave', ['ticker_noticias', 'contacto_oficial', 'redes_sociales', 'comunicado_popup']),
    supabase.from('secretarias').select('id, nombre, nombre_corto, slug, icono, secretario_nombre, secretario_cargo, secretario_foto_url, secretario_bio').eq('activo', true).order('orden', { ascending: true }),
    supabase.from('noticias').select('id, titulo, resumen, fecha_publicacion, imagen_portada_url, secretarias(nombre_corto, icono, color_acento)').eq('estado', 'publicado').order('fecha_publicacion', { ascending: false }).limit(5),
    supabase.from('documentos').select('id, tipo, numero, titulo, fecha_publicacion, archivo_url').eq('es_publico', true).order('fecha_publicacion', { ascending: false }).limit(5)
  ]);

  const tickerConfig = configData?.find(c => c.clave === 'ticker_noticias')?.valor || { velocidad_segundos: 60, mensajes: [] };
  const contactoConfig = configData?.find(c => c.clave === 'contacto_oficial')?.valor || { direccion: 'Plaza 10 de Febrero s/n, Oruro', telefono: '(591-2) 5270-000', email: 'contacto@oruro.gob.bo', latitud: -17.969520017575668, longitud: -67.11512711053955 };
  const redesConfig = configData?.find(c => c.clave === 'redes_sociales')?.valor || { facebook: '#', twitter: '#', youtube: '#', instagram: '#', tiktok: '#' };
  const comunicadoConfig = configData?.find(c => c.clave === 'comunicado_popup')?.valor || { activo: false, imagen_url: '', enlace: '' };

  return (
    <>
      {/* Pasamos prop para que la animación sepa si ya se vio o no antes de renderizar */}
      <IntroAnimation isSeen={introSeen} />
      <PopupComunicado config={comunicadoConfig} />

      <main>
        {/* Carrusel Principal */}
        <HeroSlider banners={banners || []} redes={redesConfig} />
        <BreakingNews config={tickerConfig} />
        <CenefaCultural />

        {/* Sección del Gobernador */}
        <GovernorSection />
        <CenefaCultural />

        <SecretariatsSection secretarias={secretarias || []} />
        <CenefaCultural />

        <QuickAccess />
        <CenefaCultural />

        <NewsSection noticias={ultimasNoticias || []} />
        <CenefaCultural />

        <GacetaSection documentos={ultimosDocumentos || []} />
        <CenefaCultural />

        <LocationSection contacto={contactoConfig} />
      </main>

    </>
  );
}
