'use client';
import { useState, useTransition } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import styles from './page.module.css';

export default function NoticiasClient({ noticias, esSuperAdmin }) {
  const [confirmDelete, setConfirmDelete] = useState(null); // { id, titulo }
  const [isPending, startTransition] = useTransition();
  const [processingId, setProcessingId] = useState(null);
  const router = useRouter();

  const handleToggleEstado = async (noticia) => {
    setProcessingId(noticia.id + '-estado');
    const newEstado = noticia.estado === 'publicado' ? 'borrador' : 'publicado';
    const res = await fetch(`/api/noticias/${noticia.id}/estado`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ estado: newEstado }),
    });
    setProcessingId(null);
    if (res.ok) startTransition(() => router.refresh());
  };

  const handleDelete = async () => {
    if (!confirmDelete) return;
    setProcessingId(confirmDelete.id + '-delete');
    const res = await fetch(`/api/noticias/${confirmDelete.id}`, { method: 'DELETE' });
    setProcessingId(null);
    setConfirmDelete(null);
    if (res.ok) startTransition(() => router.refresh());
  };

  return (
    <div className="adminPage">

      {/* ── PAGE HEADER ── */}
      <div className={styles.pageHeader}>
        <div>
          <h1 className="adminTitle">Gestión de Noticias</h1>
          <p className="adminSubtitle">Administra los comunicados y artículos de prensa del departamento.</p>
        </div>
        <Link href="/admin/noticias/crear" className="btnPrimary" id="create-news-btn">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Nueva Noticia
        </Link>
      </div>

      {/* ── INFO BANNER ── */}
      <div className="infoBanner">
        <div className="infoBannerIcon">📢</div>
        <div>
          <div className="infoBannerTitle">¿Cómo funciona esto en la página pública?</div>
          <div className="infoBannerText">
            Las noticias publicadas aparecen en la <strong>página principal</strong> y en el portal de la <strong>Secretaría correspondiente</strong>. Los borradores son invisibles para el público hasta que los publiques.
          </div>
        </div>
      </div>

      {/* ── TABLE ── */}
      <div className="tableCard">
        <div className="tableHeader">
          <div className="tableTitle">
            Lista de Noticias
            <span style={{ marginLeft: '0.75rem', padding: '0.2rem 0.625rem', background: 'var(--admin-surface-2)', border: '1px solid var(--admin-border)', borderRadius: '20px', fontSize: '0.75rem', color: 'var(--admin-text-muted)' }}>
              {noticias?.length || 0}
            </span>
          </div>
        </div>

        <div style={{ overflowX: 'auto' }}>
          <table className="table">
            <thead>
              <tr>
                <th style={{ width: 60 }}>Foto</th>
                <th>Título</th>
                <th>Categoría</th>
                {esSuperAdmin && <th>Secretaría</th>}
                <th>Fecha</th>
                <th>Estado</th>
                <th style={{ textAlign: 'right' }}>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {noticias?.length === 0 ? (
                <tr>
                  <td colSpan={esSuperAdmin ? 7 : 6} style={{ textAlign: 'center', padding: '3rem', color: 'var(--admin-text-muted)' }}>
                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.75rem' }}>
                      <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" style={{ opacity: 0.3 }}><path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/></svg>
                      No hay noticias registradas aún.
                    </div>
                  </td>
                </tr>
              ) : (
                noticias?.map((noticia) => (
                  <tr key={noticia.id}>
                    <td>
                      {noticia.imagen_portada_url ? (
                        <div className={styles.imgThumb}>
                          <img src={noticia.imagen_portada_url} alt="Portada" loading="lazy" />
                        </div>
                      ) : (
                        <div className={styles.noImg}>
                          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
                        </div>
                      )}
                    </td>
                    <td>
                      <div className={styles.newsTitleCell}>
                        <span className={styles.newsTitle}>{noticia.titulo}</span>
                        {noticia.es_comunicado_rapido && (
                          <span className="badge badgeWarning" style={{ fontSize: '0.6rem' }}>Comunicado</span>
                        )}
                      </div>
                    </td>
                    <td>
                      <span className={styles.categoryBadge}>{noticia.categoria || 'General'}</span>
                    </td>
                    {esSuperAdmin && (
                      <td>
                        <span className="badge" style={{ background: 'var(--admin-surface-2)', color: 'var(--admin-text-muted)', border: '1px solid var(--admin-border)', fontSize: '0.68rem' }}>
                          {noticia.secretarias?.nombre_corto || 'General'}
                        </span>
                      </td>
                    )}
                    <td style={{ color: 'var(--admin-text-muted)', fontSize: '0.8rem', whiteSpace: 'nowrap' }}>
                      {noticia.fecha_publicacion ? new Date(noticia.fecha_publicacion).toLocaleDateString('es-BO') : '—'}
                    </td>
                    <td>
                      <span className={`badge ${noticia.estado === 'publicado' ? 'badgeSuccess' : 'badgeWarning'}`}>
                        {noticia.estado === 'publicado' ? '● Publicado' : '● Borrador'}
                      </span>
                    </td>
                    <td>
                      <div className={styles.actions}>
                        <Link
                          href={`/admin/noticias/editar/${noticia.id}`}
                          className="btnSecondary"
                          style={{ padding: '0.4rem 0.875rem', fontSize: '0.78rem' }}
                          id={`edit-${noticia.id}`}
                        >
                          Editar
                        </Link>
                        <button
                          onClick={() => handleToggleEstado(noticia)}
                          disabled={processingId === noticia.id + '-estado'}
                          className="btnSecondary"
                          style={{ padding: '0.4rem 0.875rem', fontSize: '0.78rem' }}
                          id={`toggle-${noticia.id}`}
                        >
                          {processingId === noticia.id + '-estado'
                            ? '...'
                            : noticia.estado === 'publicado' ? 'Ocultar' : 'Publicar'}
                        </button>
                        <button
                          onClick={() => setConfirmDelete({ id: noticia.id, titulo: noticia.titulo })}
                          className="btnDanger"
                          style={{ padding: '0.4rem 0.875rem', fontSize: '0.78rem' }}
                          id={`delete-${noticia.id}`}
                        >
                          Eliminar
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* ── DELETE CONFIRMATION MODAL ── */}
      {confirmDelete && (
        <div className="modalOverlay" onClick={() => setConfirmDelete(null)}>
          <div className="modalBox" onClick={e => e.stopPropagation()}>
            <div className="modalIcon">🗑️</div>
            <div className="modalTitle">¿Eliminar esta noticia?</div>
            <div className="modalText">
              <strong>"{confirmDelete.titulo}"</strong>
              <br /><br />
              Esta acción es <strong>permanente e irreversible</strong>. La noticia y su imagen serán borradas del sistema.
            </div>
            <div className="modalActions">
              <button
                className="btnSecondary"
                onClick={() => setConfirmDelete(null)}
                id="cancel-delete-btn"
              >
                Cancelar
              </button>
              <button
                className="btnDanger"
                onClick={handleDelete}
                disabled={processingId !== null}
                id="confirm-delete-btn"
              >
                {processingId ? 'Eliminando...' : 'Sí, eliminar'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
