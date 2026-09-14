import { fileURLToPath } from 'node:url';

const adminRoot = fileURLToPath(new URL('.', import.meta.url));

/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  assetPrefix: '/_admin_next',
  turbopack: {
    root: adminRoot,
  },
  // Permitir archivos grandes (hasta 50MB) en Server Actions
  experimental: {
    serverActions: {
      bodySizeLimit: '50mb',
    },
    proxyClientMaxBodySize: '50mb',
  },
  images: {
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



