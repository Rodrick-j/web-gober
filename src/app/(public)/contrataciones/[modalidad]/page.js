import { notFound } from 'next/navigation';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import GacetaClient from '@/app/(public)/gaceta/[tipo]/GacetaClient';
import styles from '@/app/(public)/gaceta/[tipo]/gaceta.module.css';

export const revalidate = 60;

const CONFIG = {
  menor: {
    title: 'Contratación Menor',
    subtitle: 'Documentación oficial sobre Contratación Menor',
    icon: '📄',
    docs: [
      { id: 'm1', anio: 2022, numero_documento: 'Doc. 2022', titulo: 'CONTRATACIÓN MENOR 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/contrataciones/CONTRATACION_MENOR  2022.pdf') },
      { id: 'm2', anio: 2022, numero_documento: 'Modalidad', titulo: 'MODALIDAD CONTRATACIÓN MENOR 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/contrataciones/MODALIDAD-CONTRATACION-MENOR 2022.pdf') },
      { id: 'm3', anio: 2022, numero_documento: 'Modalidad', titulo: 'MODALIDAD DE CONTRATACIÓN MENOR 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/contrataciones/MODALIDAD-DE-CONTRATACION-MENOR 2022.pdf') },
    ]
  },
  directa: {
    title: 'Contratación Directa',
    subtitle: 'Documentación oficial sobre Contratación Directa',
    icon: '📄',
    docs: [
      { id: 'd1', anio: 2022, numero_documento: 'Doc. 2022', titulo: 'CONTRATACIÓN DIRECTA 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/contrataciones/CONTRATACION_DIRECTA 2022.pdf') },
      { id: 'd2', anio: 2022, numero_documento: 'Modalidad', titulo: 'MODALIDAD CONTRATACIÓN DIRECTA 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/contrataciones/MODALIDAD-CONTRATACION-DIRECTA 2022.pdf') },
      { id: 'd3', anio: 2022, numero_documento: 'Modalidad', titulo: 'MODALIDAD DE CONTRATACIÓN DIRECTA 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/contrataciones/MODALIDAD-DE-CONTRATACION-DIRECTA 2022.pdf') },
    ]
  }
};

export function generateStaticParams() {
  return [{ modalidad: 'menor' }, { modalidad: 'directa' }];
}

export async function generateMetadata({ params }) {
  const { modalidad } = await params;
  const config = CONFIG[modalidad];

  if (!config) return { title: 'No encontrado' };

  return {
    title: `${config.title} | Contrataciones | GADOR`,
    description: config.subtitle,
  };
}

export default async function ModalidadContratacionPage({ params }) {
  const { modalidad } = await params;
  const config = CONFIG[modalidad];

  if (!config) {
    notFound();
  }

  return (
    <>
      <AnimatedBackground />
      <main className={styles.portalContainer}>
        <div className="container">
          <header className={styles.headerSection}>
            <div className={styles.headerIcon}>{config.icon}</div>
            <h1 className={styles.headerTitle}>{config.title}</h1>
            <div className={styles.headerDivider}></div>
            <p className={styles.headerSubtitle}>{config.subtitle}</p>
          </header>

          <GacetaClient
            documentos={config.docs}
            tipoLabel={config.title}
            icon={config.icon}
          />
        </div>
      </main>
    </>
  );
}
