/** @type {import('next').NextConfig} */
const nextConfig = {
  // Permitir archivos grandes (hasta 50MB) en Server Actions y API Routes
  experimental: {
    serverActions: {
      bodySizeLimit: '50mb',
    },
    optimizePackageImports: ['!lucide-react'],
  },
  images: {
    qualities: [10, 20, 30, 40, 50, 60, 70, 75, 80, 85, 90, 95, 100],
    formats: ['image/avif', 'image/webp'],
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
      {
        protocol: 'https',
        hostname: 'img.youtube.com',
        pathname: '/vi/**',
      },
      {
        protocol: 'https',
        hostname: 'i.ytimg.com',
        pathname: '/vi/**',
      },
    ],
    // Vercel optimiza las imágenes (WebP/AVIF + resize automático).
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
  async rewrites() {
    return [
      {
        source: '/admin',
        destination: 'http://localhost:3001/admin',
      },
      {
        source: '/admin/:path*',
        destination: 'http://localhost:3001/admin/:path*',
      },
      {
        source: '/_admin_next/_next/:path*',
        destination: 'http://localhost:3001/_next/:path*',
      },
    ]
  },
};

export default nextConfig;
