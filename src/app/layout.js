import { Inter, Outfit } from 'next/font/google';
import './globals.css';
import Script from 'next/script';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter', display: 'swap' });
const outfit = Outfit({ subsets: ['latin'], variable: '--font-outfit', display: 'swap' });

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
    <html lang="es" data-scroll-behavior="smooth" className={`${inter.variable} ${outfit.variable}`}>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </head>
      <body>
        {children}
        <Script id="google-translate-init" strategy="afterInteractive">
          {`
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'es', includedLanguages: 'es,qu,en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
            }
          `}
        </Script>
        <Script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit" strategy="afterInteractive" />
      </body>
    </html>
  );
}
