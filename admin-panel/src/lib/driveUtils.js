/**
 * Convierte un link de Google Drive en una URL de visualización directa.
 *
 * Formatos de Drive que acepta:
 *   https://drive.google.com/file/d/FILE_ID/view?usp=sharing
 *   https://drive.google.com/open?id=FILE_ID
 *   https://drive.google.com/uc?id=FILE_ID
 *
 * Devuelve:
 *   https://drive.google.com/file/d/FILE_ID/preview  ← embeds bien en iframe
 *
 * Si el link no es de Drive, lo devuelve tal cual (links externos normales).
 */
export function normalizarUrlDrive(url) {
  if (!url) return url;
  url = url.trim();

  // Extraer FILE_ID de los distintos formatos
  let fileId = null;

  // Formato: /file/d/FILE_ID/
  const matchFile = url.match(/\/file\/d\/([a-zA-Z0-9_-]+)/);
  if (matchFile) fileId = matchFile[1];

  // Formato: ?id=FILE_ID o &id=FILE_ID
  if (!fileId) {
    const matchId = url.match(/[?&]id=([a-zA-Z0-9_-]+)/);
    if (matchId) fileId = matchId[1];
  }

  if (fileId) {
    // URL de visualización directa (funciona como enlace, no iframe)
    return `https://drive.google.com/file/d/${fileId}/view`;
  }

  // No es un link de Drive, devolver intacto
  return url;
}

/**
 * Valida si el texto ingresado es un link de Google Drive válido.
 */
export function esDriveUrl(url) {
  if (!url) return false;
  return url.includes('drive.google.com');
}
