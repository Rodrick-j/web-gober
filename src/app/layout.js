import ThemeInjector from '@/components/ThemeInjector/ThemeInjector';
import './globals.css';
import Script from 'next/script';

import ConsoleSuppressor from '../components/ConsoleSuppressor';

export const metadata = {
  title: 'Gobierno Autónomo Departamental de Oruro',
  description: 'Portal oficial del Gobierno Autónomo Departamental de Oruro. Noticias, trámites, leyes y servicios para los ciudadanos del Departamento de Oruro, Bolivia.',
  keywords: 'Oruro, Gobernación, Bolivia, Gobierno Departamental, Trámites, Gaceta Oficial',
  icons: {
    icon: '/favicon-gador.png',
    shortcut: '/favicon-gador.png',
    apple: '/favicon-gador.png',
  },
  openGraph: {
    title: 'Gobierno Autónomo Departamental de Oruro',
    description: 'Portal oficial del Gobierno Autónomo Departamental de Oruro',
    type: 'website',
    locale: 'es_BO',
  },
};

export default function RootLayout({ children }) {
  return (
    <html lang="es" data-scroll-behavior="smooth" className="theme-light" suppressHydrationWarning>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700;800;900&family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
      </head>
      <body suppressHydrationWarning>
        <ThemeInjector />
        {children}
        <ConsoleSuppressor />
        <Script id="google-translate-init" strategy="afterInteractive">
          {`
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'es', includedLanguages: 'es,qu,en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
            }
          `}
        </Script>
        {/* lazyOnload: evita el <link rel="preload"> que el navegador reporta como "preloaded but not used" */}
        <Script
          src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"
          strategy="lazyOnload"
        />
      </body>
    </html>
  );
}
