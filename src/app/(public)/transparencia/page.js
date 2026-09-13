import Link from 'next/link';
import { createClient } from '@/lib/supabase/public';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import TransparencyHero from '@/components/TransparencyHero/TransparencyHero';
import styles from './page.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Transparencia | GADOR',
  description: 'Portal de Transparencia del Gobierno Autónomo Departamental de Oruro. Acceso a información pública, rendición de cuentas y lucha contra la corrupción.',
};

const OBS_FALLBACK = 'https://observatorio.gob.bo/#/';

function PortalIcon({ name }) {
  const common = {
    viewBox: '0 0 24 24',
    fill: 'none',
    stroke: 'currentColor',
    strokeWidth: '1.8',
    strokeLinecap: 'round',
    strokeLinejoin: 'round',
    'aria-hidden': true,
  };

  if (name === 'shield') return <svg {...common}><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10Z" /><path d="m9 12 2 2 4-4" /></svg>;
  if (name === 'alert') return <svg {...common}><path d="M10.3 3.7 2.2 18a2 2 0 0 0 1.8 3h16a2 2 0 0 0 1.8-3L13.7 3.7a2 2 0 0 0-3.4 0Z" /><path d="M12 9v4M12 17h.01" /></svg>;
  if (name === 'message') return <svg {...common}><path d="M21 15a4 4 0 0 1-4 4H8l-5 3V7a4 4 0 0 1 4-4h10a4 4 0 0 1 4 4Z" /><path d="M8 9h8M8 13h5" /></svg>;
  if (name === 'chart') return <svg {...common}><path d="M4 20V10M10 20V4M16 20v-7M22 20H2" /></svg>;
  if (name === 'external') return <svg {...common}><circle cx="12" cy="12" r="9" /><path d="M3 12h18M12 3a15 15 0 0 1 0 18M12 3a15 15 0 0 0 0 18" /></svg>;
  return <svg {...common}><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8Z" /><path d="M14 2v6h6M8 13h8M8 17h6" /></svg>;
}

const ArrowIcon = ({ external }) => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
    {external ? <><path d="M15 3h6v6" /><path d="m10 14 11-11" /><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6" /></> : <><path d="M5 12h14" /><path d="m13 6 6 6-6 6" /></>}
  </svg>
);

export default async function TransparenciaPage() {
  let observatorioUrl = OBS_FALLBACK;
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('configuracion_global')
      .select('valor')
      .eq('clave', 'enlaces_transparencia')
      .maybeSingle();
    if (data?.valor?.observatorio_url) observatorioUrl = data.valor.observatorio_url;
  } catch {
    // Se mantiene el enlace oficial de respaldo.
  }

  const items = [
    {
      title: 'Unidad de Transparencia y Lucha Contra la Corrupción',
      subtitle: 'Conoce sus funciones, responsable y canales de atención conforme a la Ley N.º 974.',
      href: '/transparencia/unidad',
      icon: 'shield',
      tag: 'Información institucional',
    },
    {
      title: 'Denunciar hechos de corrupción',
      subtitle: 'Accede al sistema SITPRECO S2+ del Observatorio Ciudadano de Transparencia.',
      href: observatorioUrl,
      icon: 'alert',
      tag: 'Servicio externo',
      external: true,
    },
    {
      title: 'Solicitud de información pública',
      subtitle: 'Presenta una solicitud formal de acceso a información mediante el formulario en línea.',
      href: '/transparencia/solicitud-informacion',
      icon: 'message',
      tag: 'Trámite en línea',
    },
    {
      title: 'Rendición Pública de Cuentas',
      subtitle: 'Consulta informes y documentos oficiales de rendición de cuentas por gestión.',
      href: '/transparencia/rendicion_cuentas',
      icon: 'chart',
      tag: 'Repositorio documental',
    },
    {
      title: 'Rendición de cuentas en el Observatorio',
      subtitle: 'Consulta la información publicada por la institución en el portal nacional.',
      href: observatorioUrl,
      icon: 'external',
      tag: 'Portal nacional',
      external: true,
    },
    {
      title: 'Actividades y campañas',
      subtitle: 'Revisa la documentación de actividades institucionales de transparencia.',
      href: '/transparencia/actividades',
      icon: 'document',
      tag: 'Archivo institucional',
    },
  ];

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <TransparencyHero
        showBack={false}
        eyebrow="Gobierno Autónomo Departamental de Oruro"
        title="Transparencia institucional"
        description="Información pública clara, accesible y organizada para fortalecer la confianza y el control ciudadano."
      />

      <div className={styles.container}>
        <section className={styles.commitmentBar} aria-label="Compromisos del portal">
          <div className={styles.commitmentItem}>
            <span className={styles.commitmentIcon}><PortalIcon name="shield" /></span>
            <div><strong>Información oficial</strong><small>Fuentes institucionales verificadas</small></div>
          </div>
          <div className={styles.commitmentItem}>
            <span className={styles.commitmentIcon}><PortalIcon name="document" /></span>
            <div><strong>Acceso directo</strong><small>Documentos organizados por gestión</small></div>
          </div>
          <div className={styles.commitmentItem}>
            <span className={styles.commitmentIcon}><PortalIcon name="message" /></span>
            <div><strong>Atención ciudadana</strong><small>Canales y trámites disponibles</small></div>
          </div>
        </section>

        <section className={styles.services} aria-labelledby="transparency-services-title">
          <header className={styles.sectionHeader}>
            <p>Servicios de transparencia</p>
            <h2 id="transparency-services-title">¿Qué información necesitas?</h2>
            <span>Selecciona una opción para consultar documentos, iniciar un trámite o acceder a los canales oficiales.</span>
          </header>

          <div className={styles.servicesGrid}>
            {items.map((item) => {
              const cardContent = (
                <>
                  <div className={styles.cardTop}>
                    <span className={styles.cardIcon}><PortalIcon name={item.icon} /></span>
                    <span className={styles.cardTag}>{item.tag}</span>
                  </div>
                  <h3>{item.title}</h3>
                  <p>{item.subtitle}</p>
                  <span className={styles.cardAction}>
                    {item.external ? 'Abrir portal oficial' : 'Consultar información'}
                    <ArrowIcon external={item.external} />
                  </span>
                </>
              );

              return item.external ? (
                <a key={item.title} href={item.href} target="_blank" rel="noopener noreferrer" className={styles.serviceCard}>
                  {cardContent}
                </a>
              ) : (
                <Link key={item.title} href={item.href} className={styles.serviceCard}>
                  {cardContent}
                </Link>
              );
            })}
          </div>
        </section>
      </div>
    </main>
  );
}
