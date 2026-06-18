/** @type {import('next').NextConfig} */
const nextConfig = {
  // Permitir archivos grandes (hasta 50MB) en Server Actions y API Routes
  experimental: {
    serverActions: {
      bodySizeLimit: '50mb',
    },
  },
  images: {
    // Dominios remotos permitidos para optimizaciÃ³n de imÃ¡genes
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '*.supabase.co',
        pathname: '/storage/v1/object/public/**',
      },
      {
        protocol: 'https',
        hostname: '*.supabase.in',
        pathname: '/storage/v1/object/public/**',
      },
    ],
    // Formatos modernos â€” Next.js servirÃ¡ AVIF/WebP automÃ¡ticamente
    formats: ['image/avif', 'image/webp'],
    // Calidades de compresiÃ³n
    qualities: [50, 75, 85, 90, 100],
    // TamaÃ±os por defecto
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
  },
};

export default nextConfig;


