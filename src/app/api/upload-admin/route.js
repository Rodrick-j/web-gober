import { createClient } from '@supabase/supabase-js';
import { NextResponse } from 'next/server';

// Esta ruta usa la llave MAESTRA (service role) del servidor.
// Jamás se expone al navegador. Salta todas las restricciones de seguridad (RLS).
export async function POST(request) {
  try {
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

    const BUCKET_NAME = folder === 'documentos' ? 'documento-pdf' : 'imagenes';
    const fileExt = file.name.split('.').pop();
    const fileName = `${Date.now()}_${Math.random().toString(36).substring(7)}.${fileExt}`;
    const filePath = `${folder}/${fileName}`;

    // Convertir el File a ArrayBuffer y luego a Uint8Array
    const arrayBuffer = await file.arrayBuffer();
    const buffer = new Uint8Array(arrayBuffer);

    const { error } = await supabaseAdmin.storage
      .from(BUCKET_NAME)
      .upload(filePath, buffer, {
        contentType: file.type || 'application/pdf',
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
