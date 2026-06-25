'use server';
import { createClient } from '@supabase/supabase-js';

/**
 * Genera una URL firmada (signed URL) para que el navegador suba
 * el archivo DIRECTAMENTE a Supabase Storage, sin pasar por Next.js.
 * Usa la llave maestra del servidor para crear la URL segura.
 */
export async function getSignedUploadUrl(fileName) {
  const supabaseAdmin = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY,
    { auth: { persistSession: false } }
  );

  const fileExt = fileName.split('.').pop();
  const uniqueName = `${Date.now()}_${Math.random().toString(36).substring(7)}.${fileExt}`;
  const filePath = `documentos/${uniqueName}`;

  const { data, error } = await supabaseAdmin.storage
    .from('documento-pdf')
    .createSignedUploadUrl(filePath);

  if (error) {
    console.error('Error generando signed URL:', error.message);
    throw new Error(error.message);
  }

  // Construir la URL pública que tendrá el archivo una vez subido
  const publicUrl = `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/object/public/documento-pdf/${filePath}`;

  return {
    signedUrl: data.signedUrl,
    token: data.token,
    path: filePath,
    publicUrl,
  };
}
