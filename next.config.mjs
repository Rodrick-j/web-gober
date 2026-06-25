/** @type {import('next').NextConfig} */
const nextConfig = {
  // Permitir archivos grandes (hasta 50MB) en Server Actions y API Routes
  experimental: {
    serverActions: {
      bodySizeLimit: '50mb',
    },
  },
  images: {
    qualities: [30, 40, 50, 60, 75, 80, 85, 90, 100],
    // Dominios remotos permitidos
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
    // Cloudflare Workers no tiene servidor de optimización de imágenes de Next.js.
    // Las imágenes se sirven directamente desde Supabase CDN (ya optimizadas en origen).
    unoptimized: true,
  },
};

export default nextConfig;



