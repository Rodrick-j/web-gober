import './globals.css';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';

export const metadata = {
  title: 'Gobierno Autónomo Departamental de Oruro',
  description: 'Portal oficial del Gobierno Autónomo Departamental de Oruro. Noticias, trámites, leyes y servicios para los ciudadanos del Departamento de Oruro, Bolivia.',
  keywords: 'Oruro, Gobernación, Bolivia, Gobierno Departamental, Trámites, Gaceta Oficial',
  openGraph: {
    title: 'Gobierno Autónomo Departamental de Oruro',
    description: 'Portal oficial del Gobierno Autónomo Departamental de Oruro',
    type: 'website',
    locale: 'es_BO',
  },
};

export default function RootLayout({ children }) {
  return (
    <html lang="es" data-scroll-behavior="smooth">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Outfit:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet"
        />
      </head>
      <body>
        <AnimatedBackground />
        {children}
      </body>
    </html>
  );
}
