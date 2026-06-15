/** @type {import('next').NextConfig} */
const nextConfig = {
  // Permitir archivos grandes (hasta 50MB) en Server Actions y API Routes
  experimental: {
    serverActions: {
      bodySizeLimit: '50mb',
    },
  },
  images: {
    // Dominios remotos permitidos para optimización de imágenes
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
    // Formatos modernos — Next.js servirá AVIF/WebP automáticamente
    formats: ['image/avif', 'image/webp'],
    // Calidades de compresión
    qualities: [50, 75, 85, 90, 100],
    // Tamaños por defecto
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
  },
};

export default nextConfig;
