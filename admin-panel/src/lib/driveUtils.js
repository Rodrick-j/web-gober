const DRIVE_HOST = 'drive.google.com';
const DOCS_HOST = 'docs.google.com';
const GOOGLE_FILE_ID_PATTERN = '[a-zA-Z0-9_-]+';

function getGoogleDriveReference(value) {
  if (typeof value !== 'string' || !value.trim()) return null;

  try {
    const parsedUrl = new URL(value.trim());
    const hostname = parsedUrl.hostname.toLowerCase().replace(/^www\./, '');

    if (hostname === DRIVE_HOST) {
      const fileMatch = parsedUrl.pathname.match(
        new RegExp(`/file/(?:u/\\d+/)?d/(${GOOGLE_FILE_ID_PATTERN})`)
      );
      const fileId = fileMatch?.[1] || parsedUrl.searchParams.get('id');

      return fileId && new RegExp(`^${GOOGLE_FILE_ID_PATTERN}$`).test(fileId)
        ? { type: 'drive-file', fileId }
        : null;
    }

    if (hostname === DOCS_HOST) {
      const documentMatch = parsedUrl.pathname.match(
        new RegExp(`/document/(?:u/\\d+/)?d/(${GOOGLE_FILE_ID_PATTERN})`)
      );

      return documentMatch
        ? { type: 'google-document', fileId: documentMatch[1] }
        : null;
    }
  } catch {
    return null;
  }

  return null;
}

/**
 * Convierte enlaces compartidos de Google Drive y Documentos de Google en una
 * URL estable para el portal público.
 */
export function normalizarUrlDrive(url) {
  if (!url) return url;

  const trimmedUrl = url.trim();
  const reference = getGoogleDriveReference(trimmedUrl);

  if (!reference) return trimmedUrl;

  if (reference.type === 'google-document') {
    return `https://docs.google.com/document/d/${reference.fileId}/export?format=pdf`;
  }

  return `https://drive.google.com/file/d/${reference.fileId}/view`;
}

/**
 * Acepta archivos de Drive y documentos nativos de Google Docs.
 */
export function esDriveUrl(url) {
  return Boolean(getGoogleDriveReference(url));
}
