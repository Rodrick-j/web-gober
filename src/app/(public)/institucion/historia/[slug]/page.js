import { notFound } from 'next/navigation';
import { municipios, getMunicipio } from '../municipiosData';
import MunicipioClient from './MunicipioClient';

// Required for output: 'export' — pre-renders all municipality slugs at build time
export function generateStaticParams() {
  return municipios.map((m) => ({ slug: m.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const mun = getMunicipio(slug);
  if (!mun) return {};
  return {
    title: `Municipio de ${mun.nombre} | Historia | GADOR`,
    description: `Conoce la historia, geografía, gobierno y datos oficiales del municipio de ${mun.nombre}, ${mun.provincia}, Departamento de Oruro, Bolivia.`,
  };
}

export default async function MunicipioPage({ params }) {
  const { slug } = await params;
  const mun = getMunicipio(slug);
  if (!mun) notFound();

  return <MunicipioClient mun={mun} />;
}
