import Navbar from '@/components/Navbar/Navbar';
import GovernorSection from '@/components/GovernorSection/GovernorSection';
import HeroSlider from '@/components/HeroSlider/HeroSlider';
import IntroAnimation from '@/components/IntroAnimation/IntroAnimation';
import BreakingNews from '@/components/BreakingNews/BreakingNews';
import SecretariatsSection from '@/components/SecretariatsSection/SecretariatsSection';
import QuickAccess from '@/components/QuickAccess/QuickAccess';
import NewsSection from '@/components/NewsSection/NewsSection';
import GacetaSection from '@/components/GacetaSection/GacetaSection';
import LocationSection from '@/components/LocationSection/LocationSection';
import Footer from '@/components/Footer/Footer';
import { createClient } from '@/lib/supabase/server';

export default async function Home() {
  const supabase = await createClient();

  // Fetch banners activos ordenados por orden
  const { data: banners } = await supabase
    .from('banners_inicio')
    .select('*')
    .eq('activo', true)
    .order('orden', { ascending: true });

  // Fetch configuración global (ticker, redes, contacto)
  const { data: configData } = await supabase
    .from('configuracion_global')
    .select('*')
    .in('clave', ['ticker_noticias', 'contacto_oficial', 'redes_sociales']);

  const tickerConfig = configData?.find(c => c.clave === 'ticker_noticias')?.valor || {
    velocidad_segundos: 60,
    mensajes: []
  };
  
  const contactoConfig = configData?.find(c => c.clave === 'contacto_oficial')?.valor || {
    direccion: 'Plaza 10 de Febrero s/n, Oruro',
    telefono: '(591-2) 5270-000',
    email: 'contacto@oruro.gob.bo',
    latitud: -17.969520017575668,
    longitud: -67.11512711053955
  };

  const redesConfig = configData?.find(c => c.clave === 'redes_sociales')?.valor || {
    facebook: '#', twitter: '#', youtube: '#', instagram: '#', tiktok: '#'
  };

  // Fetch Secretarías activas
  const { data: secretarias } = await supabase
    .from('secretarias')
    .select('id, nombre, nombre_corto, slug, icono, secretario_nombre, secretario_cargo')
    .eq('activo', true)
    .order('orden', { ascending: true });

  // Fetch Últimas Noticias (5 más recientes publicadas)
  const { data: ultimasNoticias } = await supabase
    .from('noticias')
    .select('id, titulo, resumen, fecha_publicacion, imagen_portada_url, secretarias(nombre_corto, icono, color_acento)')
    .eq('estado', 'publicado')
    .order('fecha_publicacion', { ascending: false })
    .limit(5);

  // Fetch Últimos Documentos (Gaceta Oficial)
  const { data: ultimosDocumentos } = await supabase
    .from('documentos')
    .select('id, tipo, numero, titulo, fecha_publicacion, archivo_url')
    .eq('es_publico', true)
    .order('fecha_publicacion', { ascending: false })
    .limit(5);

  return (
    <>
      <IntroAnimation />
      <Navbar />
      <main>
        {/* Carrusel Principal */}
        <HeroSlider banners={banners || []} redes={redesConfig} />
        <BreakingNews config={tickerConfig} />

        {/* Sección del Gobernador */}
        <GovernorSection />
        <SecretariatsSection secretarias={secretarias || []} />
        <QuickAccess />
        <NewsSection noticias={ultimasNoticias || []} />
        <GacetaSection documentos={ultimosDocumentos || []} />
        <LocationSection contacto={contactoConfig} />
      </main>
      <Footer />
    </>
  );
}
