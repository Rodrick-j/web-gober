'use server';
import { createClient } from '@supabase/supabase-js';
import { verifyAdminSession } from '@/lib/auth';

/**
 * Sube un archivo PDF directamente desde el servidor a Supabase Storage.
 * Esto evita problemas de CORS en el navegador y crea el bucket si no existe.
 */
export async function uploadPdfAction(formData) {
  const session = await verifyAdminSession();
  if (!session) {
    throw new Error('No autorizado para subir documentos.');
  }

  const file = formData.get('file');
  if (!file) {
    throw new Error('No se proporcionó ningún archivo.');
  }

  const supabaseAdmin = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY,
    { auth: { persistSession: false } }
  );

  const fileExt = file.name.split('.').pop();
  const uniqueName = `${Date.now()}_${Math.random().toString(36).substring(7)}.${fileExt}`;
  const filePath = `documentos/${uniqueName}`;

  // Intentar subir el archivo
  let { error } = await supabaseAdmin.storage
    .from('documentos-pdf')
    .upload(filePath, file, {
      contentType: file.type || 'application/pdf',
      upsert: false
    });

  // Si el bucket no existe, crearlo y reintentar
  if (error && error.message.includes('Bucket not found')) {
    await supabaseAdmin.storage.createBucket('documentos-pdf', { public: true });
    
    const retry = await supabaseAdmin.storage
      .from('documentos-pdf')
      .upload(filePath, file, {
        contentType: file.type || 'application/pdf',
        upsert: false
      });
      
    if (retry.error) {
      throw new Error('Error al subir tras crear bucket: ' + retry.error.message);
    }
  } else if (error) {
    throw new Error('Error al subir a Supabase: ' + error.message);
  }

  // Retornar la URL pública
  const publicUrl = `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/object/public/documentos-pdf/${filePath}`;
  
  return publicUrl;
}

