// =====================================================
// lib/supabase/storage.js
// Funciones de utilidad para manejar archivos en Supabase
// =====================================================
import { createClient } from './client';

/**
 * Sube un archivo a Supabase Storage y devuelve su URL pública
 * @param {File} file - El archivo a subir
 * @param {string} folder - Carpeta destino (ej. 'noticias', 'documentos', 'galeria')
 * @returns {Promise<string>} La URL pública del archivo subido
 */
export async function uploadFile(file, folder = 'general') {
  try {
    const supabase = createClient();
    
    // Determinar el bucket según la carpeta
    const BUCKET_NAME = folder === 'documentos' ? 'documentos-pdf' : 'imagenes';
    
    // Crear un nombre único para el archivo (para no sobreescribir)
    const fileExt = file.name.split('.').pop();
    const fileName = `${Date.now()}_${Math.random().toString(36).substring(7)}.${fileExt}`;
    const filePath = `${folder}/${fileName}`;

    // Subir archivo
    const { data, error } = await supabase.storage
      .from(BUCKET_NAME)
      .upload(filePath, file, {
        cacheControl: '31536000',  // 1 año de caché para imágenes públicas
        upsert: false
      });

    if (error) {
      console.error('Error subiendo archivo:', error.message);
      throw error;
    }

    // Obtener URL pública
    const { data: { publicUrl } } = supabase.storage
      .from(BUCKET_NAME)
      .getPublicUrl(filePath);

    return publicUrl;
  } catch (error) {
    console.error('Excepción en uploadFile:', error);
    throw error;
  }
}

/**
 * Elimina un archivo de Supabase Storage usando su URL pública
 * @param {string} fileUrl - La URL pública del archivo a eliminar
 */
export async function deleteFile(fileUrl) {
  if (!fileUrl) return;
  
  try {
    const supabase = createClient();
    
    // Extraer la ruta del archivo de la URL
    // URL formato: .../storage/v1/object/public/imagenes/noticias/1234_abc.jpg
    let bucketName = 'imagenes';
    let pathParts = fileUrl.split(`${bucketName}/`);
    
    if (pathParts.length !== 2) {
      bucketName = 'documentos-pdf';
      pathParts = fileUrl.split(`${bucketName}/`);
    }

    if (pathParts.length !== 2) return; // No es una URL válida de nuestros buckets
    
    const filePath = pathParts[1];

    const { error } = await supabase.storage
      .from(bucketName)
      .remove([filePath]);

    if (error) {
      console.error('Error eliminando archivo:', error.message);
    }
  } catch (error) {
    console.error('Excepción en deleteFile:', error);
  }
}
