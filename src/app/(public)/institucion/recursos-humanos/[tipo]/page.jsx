import { notFound } from 'next/navigation';
import CategoriaHeader from '../../[categoria]/CategoriaHeader';
import GacetaClient from '@/app/(public)/gaceta/[tipo]/GacetaClient';
import { getDocumentosRecursosHumanos } from '@/data/recursosHumanos';
import styles from '@/app/(public)/gaceta/[tipo]/gaceta.module.css';

export const revalidate = 60;

export function generateStaticParams() {
  return [
    { tipo: 'nomina-autoridades' },
    { tipo: 'nomina-personal-dependiente' },
    { tipo: 'perfil-cargos' },
  ];
}

export async function generateMetadata({ params }) {
  const { tipo } = await params;
  const seccion = getDocumentosRecursosHumanos(tipo);

  if (!seccion) return { title: 'No encontrado' };

  return {
    title: `${seccion.titulo} | Recursos Humanos | GADOR`,
    description: seccion.descripcion,
  };
}

export default async function DocumentosRecursosHumanosPage({ params }) {
  const { tipo } = await params;
  const seccion = getDocumentosRecursosHumanos(tipo);

  if (!seccion) notFound();

  return (
    <main className={styles.portalContainer}>
      <div className="container">
        <CategoriaHeader titulo={seccion.titulo} slug="recursos-humanos" />
        <GacetaClient
          documentos={seccion.documentos}
          tipoLabel={seccion.titulo}
          icon={seccion.icono}
        />
      </div>
    </main>
  );
}
