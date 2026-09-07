'use client';
import { useState, useTransition, useMemo } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import styles from './page.module.css';

const PAGE_SIZE = 10;

export default function NoticiasClient({ noticias, esSuperAdmin }) {
  const [confirmDelete, setConfirmDelete] = useState(null);
  const [isPending, startTransition] = useTransition();
  const [processingId, setProcessingId] = useState(null);
  const [page, setPage] = useState(0);
  const [search, setSearch] = useState('');
  const [filterEstado, setFilterEstado] = useState(''); // '' | 'publicado' | 'borrador'
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

  // ── FILTRADO ──
  const filtered = useMemo(() => {
    let list = noticias || [];
    if (search.trim()) {
      const q = search.trim().toLowerCase();
      list = list.filter(n =>
        n.titulo?.toLowerCase().includes(q) ||
        n.secretarias?.nombre_corto?.toLowerCase().includes(q) ||
        n.categoria?.toLowerCase().includes(q)
      );
    }
    if (filterEstado) list = list.filter(n => n.estado === filterEstado);
    return list;
  }, [noticias, search, filterEstado]);

  const totalPages = Math.max(1, Math.ceil(filtered.length / PAGE_SIZE));
  const currentPage = Math.min(page, totalPages - 1);
  const paginated = filtered.slice(currentPage * PAGE_SIZE, (currentPage + 1) * PAGE_SIZE);

  const resetPage = () => setPage(0);

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
        <div className="tableHeader" style={{ flexWrap: 'wrap', gap: '0.75rem' }}>
          <div className="tableTitle">
            Lista de Noticias
            <span style={{ marginLeft: '0.75rem', padding: '0.2rem 0.625rem', background: 'var(--admin-surface-2)', border: '1px solid var(--admin-border)', borderRadius: '20px', fontSize: '0.75rem', color: 'var(--admin-text-muted)' }}>
              {filtered.length} {filtered.length !== (noticias?.length || 0) ? `de ${noticias?.length}` : ''}
            </span>
          </div>

          {/* ── FILTROS ── */}
          <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginLeft: 'auto' }}>
            <input
              type="search"
              placeholder="🔍 Buscar noticia..."
              value={search}
              onChange={e => { setSearch(e.target.value); resetPage(); }}
              style={{
                padding: '0.45rem 0.75rem', borderRadius: '8px',
                border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)',
                color: 'var(--admin-text)', fontFamily: 'Inter, sans-serif', fontSize: '0.82rem',
                outline: 'none', width: '200px',
              }}
            />
            <select
              value={filterEstado}
              onChange={e => { setFilterEstado(e.target.value); resetPage(); }}
              style={{
                padding: '0.45rem 0.625rem', borderRadius: '8px',
                border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)',
                color: 'var(--admin-text)', fontFamily: 'Inter, sans-serif', fontSize: '0.82rem',
                cursor: 'pointer',
              }}
            >
              <option value="">Todos</option>
              <option value="publicado">Publicados</option>
              <option value="borrador">Borradores</option>
            </select>
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
              {paginated.length === 0 ? (
                <tr>
                  <td colSpan={esSuperAdmin ? 7 : 6} style={{ textAlign: 'center', padding: '3rem', color: 'var(--admin-text-muted)' }}>
                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.75rem' }}>
                      <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" style={{ opacity: 0.3 }}><path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/></svg>
                      {search || filterEstado ? 'No se encontraron noticias con ese filtro.' : 'No hay noticias registradas aún.'}
                    </div>
                  </td>
                </tr>
              ) : (
                paginated.map((noticia) => (
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

        {/* ── PAGINACIÓN ── */}
        {totalPages > 1 && (
          <div style={{
            display: 'flex', alignItems: 'center', justifyContent: 'space-between',
            padding: '0.875rem 1.25rem', borderTop: '1px solid var(--admin-border)',
            flexWrap: 'wrap', gap: '0.5rem',
          }}>
            {/* Info */}
            <span style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)' }}>
              Mostrando {currentPage * PAGE_SIZE + 1}–{Math.min((currentPage + 1) * PAGE_SIZE, filtered.length)} de {filtered.length} noticias
            </span>

            {/* Botones */}
            <div style={{ display: 'flex', gap: '0.25rem', alignItems: 'center' }}>
              {/* Anterior */}
              <button
                onClick={() => setPage(p => Math.max(0, p - 1))}
                disabled={currentPage === 0}
                style={paginBtnStyle(false, currentPage === 0)}
              >
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="15 18 9 12 15 6"/></svg>
              </button>

              {/* Páginas numeradas */}
              {Array.from({ length: totalPages }, (_, i) => {
                // Mostrar: primera, última, actual ±1, y puntos suspensivos
                const show = i === 0 || i === totalPages - 1 || Math.abs(i - currentPage) <= 1;
                const showEllipsisBefore = i === 1 && currentPage > 3;
                const showEllipsisAfter = i === totalPages - 2 && currentPage < totalPages - 4;
                if (!show && !showEllipsisBefore && !showEllipsisAfter) return null;
                if (showEllipsisBefore || showEllipsisAfter) {
                  return <span key={`dots-${i}`} style={{ padding: '0 0.25rem', color: 'var(--admin-text-muted)', fontSize: '0.82rem' }}>…</span>;
                }
                return (
                  <button
                    key={i}
                    onClick={() => setPage(i)}
                    style={paginBtnStyle(i === currentPage, false)}
                  >
                    {i + 1}
                  </button>
                );
              })}

              {/* Siguiente */}
              <button
                onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))}
                disabled={currentPage >= totalPages - 1}
                style={paginBtnStyle(false, currentPage >= totalPages - 1)}
              >
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="9 18 15 12 9 6"/></svg>
              </button>
            </div>
          </div>
        )}
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

// Estilo de botón de paginación
function paginBtnStyle(isActive, isDisabled) {
  return {
    minWidth: 34, height: 34, borderRadius: '8px',
    display: 'flex', alignItems: 'center', justifyContent: 'center',
    border: isActive
      ? '1px solid var(--admin-primary)'
      : '1px solid var(--admin-border)',
    background: isActive
      ? 'var(--admin-primary)'
      : 'var(--admin-surface-2)',
    color: isActive
      ? '#fff'
      : isDisabled ? 'var(--admin-text-subtle)' : 'var(--admin-text-muted)',
    fontFamily: 'Inter, sans-serif',
    fontSize: '0.82rem',
    fontWeight: isActive ? 700 : 500,
    cursor: isDisabled ? 'not-allowed' : 'pointer',
    opacity: isDisabled ? 0.4 : 1,
    transition: 'all 0.15s',
    padding: '0 0.25rem',
  };
}
