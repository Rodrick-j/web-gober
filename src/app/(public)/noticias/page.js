import NoticiasClient from './NoticiasClient';

export const metadata = {
  title: 'Sala de Prensa — Gobierno Departamental de Oruro',
  description: 'Últimas noticias y comunicados oficiales de la Gobernación de Oruro.',
};

export default function NoticiasPortalPage() {
  return <NoticiasClient />;
}
