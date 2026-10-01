import { notFound } from 'next/navigation';
import CategoriaHeader from '../../[categoria]/CategoriaHeader';
import GacetaClient from '@/app/(public)/gaceta/[tipo]/GacetaClient';
import { getDocumentosDesarrolloOrganizacional } from '@/data/desarrolloOrganizacional';
import styles from '@/app/(public)/gaceta/[tipo]/gaceta.module.css';

export const revalidate = 60;

export function generateStaticParams() {
  return [
    { tipo: 'reglamentos-vigentes' },
    { tipo: 'manual-funciones' },
    { tipo: 'flujos-procesos' },
  ];
}

export async function generateMetadata({ params }) {
  const { tipo } = await params;
  const seccion = getDocumentosDesarrolloOrganizacional(tipo);

  if (!seccion) return { title: 'No encontrado' };

  return {
    title: `${seccion.titulo} | Desarrollo Organizacional | GADOR`,
    description: seccion.descripcion,
  };
}

export default async function DocumentosDesarrolloOrganizacionalPage({ params }) {
  const { tipo } = await params;
  const seccion = getDocumentosDesarrolloOrganizacional(tipo);

  if (!seccion) notFound();

  return (
    <main className={styles.portalContainer}>
      <div className="container">
        <CategoriaHeader titulo={seccion.titulo} slug="desarrollo-organizacional" />
        <GacetaClient
          documentos={seccion.documentos}
          tipoLabel={seccion.titulo}
          icon={seccion.icono}
        />
      </div>
    </main>
  );
}
