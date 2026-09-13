'use client';

import { useMemo, useState } from 'react';
import styles from './page.module.css';

function normalizeText(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase();
}

function getDocumentActions(value) {
  if (!value) return { viewUrl: '#', downloadUrl: '#' };

  try {
    const url = new URL(value);
    const hostname = url.hostname.toLowerCase().replace(/^www\./, '');

    if (hostname === 'docs.google.com') {
      const match = url.pathname.match(/\/document\/(?:u\/\d+\/)?d\/([a-zA-Z0-9_-]+)/);
      if (match) {
        return {
          viewUrl: `https://docs.google.com/document/d/${match[1]}/preview`,
          downloadUrl: `https://docs.google.com/document/d/${match[1]}/export?format=pdf`,
        };
      }
    }

    if (hostname === 'drive.google.com') {
      const match = url.pathname.match(/\/file\/(?:u\/\d+\/)?d\/([a-zA-Z0-9_-]+)/);
      const fileId = match?.[1] || url.searchParams.get('id');
      if (fileId) {
        return {
          viewUrl: `https://drive.google.com/file/d/${fileId}/view`,
          downloadUrl: `https://drive.google.com/uc?export=download&id=${fileId}`,
        };
      }
    }
  } catch {
    // Conserva enlaces externos históricos sin impedir su acceso.
  }

  return { viewUrl: value, downloadUrl: value };
}

function formatFecha(fechaStr) {
  if (!fechaStr) return 'Fecha no registrada';
  const dateOnly = fechaStr.split('T')[0];
  return new Date(`${dateOnly}T00:00:00`).toLocaleDateString('es-BO', {
    day: '2-digit',
    month: 'long',
    year: 'numeric',
  });
}

const SearchIcon = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
    <circle cx="11" cy="11" r="7" />
    <path d="m20 20-3.4-3.4" />
  </svg>
);

const EyeIcon = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
    <path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12Z" />
    <circle cx="12" cy="12" r="3" />
  </svg>
);

const DownloadIcon = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
    <path d="M12 3v12" />
    <path d="m7 10 5 5 5-5" />
    <path d="M5 21h14" />
  </svg>
);

export default function DocumentosExplorer({ documentos }) {
  const [query, setQuery] = useState('');
  const [year, setYear] = useState('all');

  const years = useMemo(
    () => [...new Set(documentos.map((doc) => String(doc.gestion)))].sort((a, b) => Number(b) - Number(a)),
    [documentos]
  );

  const filteredDocuments = useMemo(() => {
    const normalizedQuery = normalizeText(query.trim());
    return documentos.filter((doc) => {
      const matchesYear = year === 'all' || String(doc.gestion) === year;
      const matchesQuery = !normalizedQuery || normalizeText(doc.titulo).includes(normalizedQuery);
      return matchesYear && matchesQuery;
    });
  }, [documentos, query, year]);

  const groupedDocuments = useMemo(() => {
    return filteredDocuments.reduce((groups, doc) => {
      const groupYear = String(doc.gestion);
      if (!groups[groupYear]) groups[groupYear] = [];
      groups[groupYear].push(doc);
      return groups;
    }, {});
  }, [filteredDocuments]);

  const visibleYears = Object.keys(groupedDocuments).sort((a, b) => Number(b) - Number(a));
  const hasFilters = Boolean(query.trim()) || year !== 'all';

  const clearFilters = () => {
    setQuery('');
    setYear('all');
  };

  return (
    <div className={styles.explorer}>
      <div className={styles.toolbar}>
        <div className={styles.toolbarHeading}>
          <p className={styles.toolbarEyebrow}>Repositorio documental</p>
          <h2>Consulta de documentos públicos</h2>
          <p>Busca por título o selecciona una gestión para encontrar el documento que necesitas.</p>
        </div>

        <div className={styles.filters} role="search">
          <label className={styles.searchField}>
            <span className={styles.srOnly}>Buscar documento</span>
            <SearchIcon />
            <input
              type="search"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
              placeholder="Buscar por nombre del documento..."
            />
          </label>

          <label className={styles.yearFilter}>
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
              <path d="M4 5h16" />
              <path d="M7 12h10" />
              <path d="M10 19h4" />
            </svg>
            <span className={styles.srOnly}>Filtrar por gestión</span>
            <select value={year} onChange={(event) => setYear(event.target.value)}>
              <option value="all">Todas las gestiones</option>
              {years.map((itemYear) => (
                <option key={itemYear} value={itemYear}>Gestión {itemYear}</option>
              ))}
            </select>
          </label>
        </div>

        <div className={styles.resultBar} aria-live="polite">
          <span>
            <strong>{filteredDocuments.length}</strong>{' '}
            {filteredDocuments.length === 1 ? 'documento encontrado' : 'documentos encontrados'}
          </span>
          {hasFilters && (
            <button type="button" onClick={clearFilters} className={styles.clearButton}>
              Limpiar filtros
            </button>
          )}
        </div>
      </div>

      {visibleYears.length === 0 ? (
        <div className={styles.emptyState}>
          <div className={styles.emptyStateIcon} aria-hidden="true">
            <SearchIcon />
          </div>
          <h3>No encontramos documentos</h3>
          <p>Prueba con otro término o selecciona una gestión diferente.</p>
          {hasFilters && <button type="button" onClick={clearFilters}>Mostrar todos</button>}
        </div>
      ) : (
        <div className={styles.results}>
          {visibleYears.map((itemYear) => (
            <section key={itemYear} className={styles.yearSection}>
              <div className={styles.yearHeading}>
                <div className={styles.yearIcon} aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <rect x="3" y="5" width="18" height="16" rx="2" />
                    <path d="M16 3v4M8 3v4M3 10h18" />
                  </svg>
                </div>
                <div>
                  <span>Gestión</span>
                  <h3>{itemYear}</h3>
                </div>
                <span className={styles.yearCount}>{groupedDocuments[itemYear].length} {groupedDocuments[itemYear].length === 1 ? 'archivo' : 'archivos'}</span>
              </div>

              <div className={styles.docsList}>
                {groupedDocuments[itemYear].map((doc, index) => {
                  const { viewUrl, downloadUrl } = getDocumentActions(doc.archivo_url);
                  return (
                    <article key={doc.id} className={styles.docItem}>
                      <div className={styles.documentNumber} aria-hidden="true">
                        {String(index + 1).padStart(2, '0')}
                      </div>
                      <div className={styles.docInfo}>
                        <span className={styles.pdfLabel}>Documento público · PDF</span>
                        <h4 className={styles.docTitle}>{doc.titulo}</h4>
                        <span className={styles.docDate}>Publicado el {formatFecha(doc.fecha_publicacion)}</span>
                      </div>
                      {doc.archivo_url && (
                        <div className={styles.docActions}>
                          <a href={viewUrl} target="_blank" rel="noopener noreferrer" className={styles.btnView}>
                            <EyeIcon />
                            Ver
                          </a>
                          <a href={downloadUrl} target="_blank" rel="noopener noreferrer" className={styles.btnDownload}>
                            <DownloadIcon />
                            Descargar PDF
                          </a>
                        </div>
                      )}
                    </article>
                  );
                })}
              </div>
            </section>
          ))}
        </div>
      )}
    </div>
  );
}
