/** @type {import('next').NextConfig} */
const nextConfig = {
  // output: 'export', // Comentado temporalmente por i18n middleware
  // Permitir archivos grandes (hasta 50MB) en Server Actions y API Routes
  experimental: {
    serverActions: {
      bodySizeLimit: '50mb',
    },
  },
  images: {
    qualities: [10, 20, 30, 40, 50, 60, 70, 75, 80, 85, 90, 95, 100],
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
  // Cabeceras de seguridad HTTP (Security Headers) para proteger contra ataques en producción
  async headers() {
    return [
      {
        source: '/(.*)',
        headers: [
          {
            key: 'X-DNS-Prefetch-Control',
            value: 'on'
          },
          {
            key: 'Strict-Transport-Security',
            value: 'max-age=63072000; includeSubDomains; preload'
          },
          {
            key: 'X-Content-Type-Options',
            value: 'nosniff'
          },
          {
            key: 'X-Frame-Options',
            value: 'SAMEORIGIN'
          },
          {
            key: 'Referrer-Policy',
            value: 'strict-origin-when-cross-origin'
          },
          {
            key: 'Permissions-Policy',
            value: 'camera=(), microphone=(), geolocation=(self)'
          }
        ],
      },
    ];
  },
};

export default nextConfig;
