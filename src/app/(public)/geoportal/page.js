import GeoportalOruro from './GeoportalOruro';

export const metadata = {
  title: 'Geoportal de Oruro | Gobernación Autónoma Departamental de Oruro',
  description:
    'Geoportal departamental: mapas temáticos de los 35 municipios y 16 provincias de Oruro con población, territorio y planificación.',
};

export default function GeoportalPage() {
  return <GeoportalOruro />;
}
