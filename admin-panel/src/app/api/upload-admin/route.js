import { createClient } from '@supabase/supabase-js';
import { NextResponse } from 'next/server';
import { verifyAdminSession } from '@/lib/auth';

// Esta ruta usa la llave MAESTRA (service role) del servidor.
// export const runtime = 'edge';

// Carpetas permitidas (se usan dentro de la ruta del objeto en Storage → sin traversal)
const CARPETAS = {
  general:      { bucket: 'imagenes',       tipo: 'imagen' },
  noticias:     { bucket: 'imagenes',       tipo: 'imagen' },
  secretarias:  { bucket: 'imagenes',       tipo: 'imagen' },
  carrusel:     { bucket: 'imagenes',       tipo: 'imagen' },
  galeria:      { bucket: 'imagenes',       tipo: 'imagen' },
  avatares:     { bucket: 'imagenes',       tipo: 'imagen' },
  secretarios:  { bucket: 'imagenes',       tipo: 'imagen' },
  banners:      { bucket: 'imagenes',       tipo: 'imagen' },
  documentos:   { bucket: 'documentos-pdf', tipo: 'pdf' },
};

const REGLAS = {
  imagen: {
    maxBytes: 5 * 1024 * 1024,
    mimes: { 'image/jpeg': 'jpg', 'image/png': 'png', 'image/webp': 'webp', 'image/gif': 'gif' },
  },
  pdf: {
    maxBytes: 10 * 1024 * 1024,
    mimes: { 'application/pdf': 'pdf' },
  },
};

// Jamás se expone al navegador. Salta todas las restricciones de seguridad (RLS).
export async function POST(request) {
  try {
    const session = await verifyAdminSession();
    if (!session) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const supabaseAdmin = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL,
      process.env.SUPABASE_SERVICE_ROLE_KEY,
      { auth: { persistSession: false } }
    );

    // Leer el archivo directamente del stream de la petición
    const formData = await request.formData();
    const file = formData.get('file');
    const folder = formData.get('folder') || 'general';

    if (!file || typeof file === 'string') {
      return NextResponse.json({ error: 'No se encontró ningún archivo.' }, { status: 400 });
    }

    // 1) Carpeta contra allowlist (evita path traversal en la ruta del objeto)
    const carpeta = CARPETAS[folder];
    if (!carpeta) {
      return NextResponse.json({ error: 'Carpeta no permitida.' }, { status: 400 });
    }
    const reglas = REGLAS[carpeta.tipo];

    // 2) Tipo MIME real declarado contra allowlist
    const ext = reglas.mimes[file.type];
    if (!ext) {
      return NextResponse.json(
        { error: `Tipo de archivo no permitido (${file.type || 'desconocido'}).` },
        { status: 400 }
      );
    }

    // 3) Tamaño
    if (file.size > reglas.maxBytes) {
      return NextResponse.json(
        { error: `El archivo supera el máximo de ${Math.round(reglas.maxBytes / 1024 / 1024)} MB.` },
        { status: 400 }
      );
    }

    const BUCKET_NAME = carpeta.bucket;
    const fileName = `${Date.now()}_${Math.random().toString(36).substring(7)}.${ext}`;
    const filePath = `${folder}/${fileName}`;

    // Convertir el File a ArrayBuffer y luego a Uint8Array
    const arrayBuffer = await file.arrayBuffer();
    const buffer = new Uint8Array(arrayBuffer);

    // contentType forzado desde la allowlist — nunca el valor crudo del cliente
    const safeContentType = Object.keys(reglas.mimes).find((m) => reglas.mimes[m] === ext);

    const { error } = await supabaseAdmin.storage
      .from(BUCKET_NAME)
      .upload(filePath, buffer, {
        contentType: safeContentType,
        cacheControl: '31536000',
        upsert: false,
      });

    if (error) {
      console.error('Error al subir archivo (admin):', error.message);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    // Obtener la URL pública
    const { data: { publicUrl } } = supabaseAdmin.storage
      .from(BUCKET_NAME)
      .getPublicUrl(filePath);

    return NextResponse.json({ url: publicUrl });
  } catch (err) {
    console.error('Excepción en upload-admin:', err.message, err.stack);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
