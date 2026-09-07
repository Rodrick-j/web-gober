'use client';
import { useState, useRef } from 'react';
import { uploadFile, deleteFile } from '@/lib/supabase/storage';

/**
 * GaleriaUploader — componente reutilizable para subir múltiples imágenes a galeria_urls
 *
 * Props:
 *   urlsIniciales: string[]   — URLs ya guardadas en BD
 *   onChange: (urls: string[]) => void — callback con el array final de URLs
 *   maxImagenes?: number      — máximo de imágenes permitidas (default 10)
 */
export default function GaleriaUploader({ urlsIniciales = [], onChange, maxImagenes = 10 }) {
  const [urls, setUrls] = useState(urlsIniciales); // URLs ya subidas
  const [uploading, setUploading] = useState(false);
  const [uploadingIdx, setUploadingIdx] = useState(null); // índice del slot subiendo
  const [error, setError] = useState('');
  const inputRef = useRef(null);

  const notify = (newUrls) => {
    setUrls(newUrls);
    onChange?.(newUrls);
  };

  const handleFiles = async (files) => {
    const arr = Array.from(files);
    if (!arr.length) return;

    const disponibles = maxImagenes - urls.length;
    if (disponibles <= 0) {
      setError(`Ya alcanzaste el máximo de ${maxImagenes} imágenes.`);
      return;
    }
    const toUpload = arr.slice(0, disponibles);
    setError('');
    setUploading(true);

    const nuevas = [];
    for (let i = 0; i < toUpload.length; i++) {
      const file = toUpload[i];
      if (!file.type.startsWith('image/')) { setError('Solo se permiten imágenes.'); continue; }
      if (file.size > 8 * 1024 * 1024) { setError('Máximo 8MB por imagen.'); continue; }
      setUploadingIdx(urls.length + i);
      try {
        const url = await uploadFile(file, 'noticias');
        nuevas.push(url);
      } catch (e) {
        setError('Error subiendo imagen: ' + e.message);
      }
    }
    setUploading(false);
    setUploadingIdx(null);
    if (nuevas.length) notify([...urls, ...nuevas]);
    if (inputRef.current) inputRef.current.value = '';
  };

  const handleDrop = (e) => {
    e.preventDefault();
    handleFiles(e.dataTransfer.files);
  };

  const handleRemove = async (idx) => {
    const url = urls[idx];
    const newUrls = urls.filter((_, i) => i !== idx);
    notify(newUrls);
    // Eliminar del storage en background
    deleteFile(url).catch(() => {});
  };

  const handleReplace = async (idx, file) => {
    if (!file) return;
    setUploading(true);
    setUploadingIdx(idx);
    try {
      const oldUrl = urls[idx];
      const newUrl = await uploadFile(file, 'noticias');
      const newUrls = [...urls];
      newUrls[idx] = newUrl;
      notify(newUrls);
      deleteFile(oldUrl).catch(() => {});
    } catch (e) {
      setError('Error al reemplazar imagen: ' + e.message);
    } finally {
      setUploading(false);
      setUploadingIdx(null);
    }
  };

  const puedeAgregar = urls.length < maxImagenes && !uploading;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>

      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
        <span style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)' }}>
          {urls.length} de {maxImagenes} imágenes · mínimo 2 recomendadas
        </span>
        {urls.length > 0 && (
          <span style={{
            fontSize: '0.65rem', fontWeight: 700, padding: '2px 8px', borderRadius: '20px',
            background: urls.length >= 2 ? 'rgba(16,185,129,0.12)' : 'rgba(245,158,11,0.12)',
            color: urls.length >= 2 ? '#10b981' : '#f59e0b',
            border: `1px solid ${urls.length >= 2 ? 'rgba(16,185,129,0.3)' : 'rgba(245,158,11,0.3)'}`,
          }}>
            {urls.length >= 2 ? '✓ Completo' : '⚠ Mín. 2'}
          </span>
        )}
      </div>

      {/* Grid de imágenes */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fill, minmax(120px, 1fr))',
        gap: '0.625rem',
      }}>
        {/* Imágenes existentes */}
        {urls.map((url, idx) => (
          <div
            key={url + idx}
            style={{
              position: 'relative', borderRadius: '10px', overflow: 'hidden',
              border: '1px solid var(--admin-border)', aspectRatio: '4/3',
              background: 'var(--admin-surface-2)',
            }}
          >
            {uploadingIdx === idx ? (
              <div style={{ width: '100%', height: '100%', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: '0.5rem', color: 'var(--admin-text-muted)', fontSize: '0.72rem' }}>
                <div style={{ width: 24, height: 24, border: '3px solid var(--admin-border)', borderTopColor: 'var(--admin-primary)', borderRadius: '50%', animation: 'spin 0.8s linear infinite' }} />
                Subiendo...
              </div>
            ) : (
              <>
                <img src={url} alt={`Galería ${idx + 1}`} style={{ width: '100%', height: '100%', objectFit: 'cover', display: 'block' }} />
                {/* Overlay con acciones */}
                <div style={{
                  position: 'absolute', inset: 0, background: 'rgba(0,0,0,0.5)',
                  opacity: 0, transition: 'opacity 0.2s',
                  display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '0.4rem',
                }}
                  onMouseEnter={e => e.currentTarget.style.opacity = 1}
                  onMouseLeave={e => e.currentTarget.style.opacity = 0}
                >
                  {/* Reemplazar */}
                  <label title="Reemplazar imagen" style={{
                    width: 32, height: 32, borderRadius: '8px', background: 'rgba(255,255,255,0.2)',
                    display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer',
                    border: '1px solid rgba(255,255,255,0.3)', transition: 'background 0.15s',
                  }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                    <input type="file" accept="image/*" style={{ display: 'none' }} onChange={e => handleReplace(idx, e.target.files?.[0])} />
                  </label>
                  {/* Eliminar */}
                  <button
                    type="button"
                    onClick={() => handleRemove(idx)}
                    title="Eliminar imagen"
                    style={{
                      width: 32, height: 32, borderRadius: '8px', background: 'rgba(239,68,68,0.7)',
                      border: '1px solid rgba(239,68,68,0.5)', cursor: 'pointer',
                      display: 'flex', alignItems: 'center', justifyContent: 'center',
                    }}
                  >
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14H6L5 6"/><path d="M10 11v6"/><path d="M14 11v6"/><path d="M9 6V4h6v2"/></svg>
                  </button>
                </div>

                {/* Número de foto */}
                <div style={{ position: 'absolute', top: 4, left: 4, background: 'rgba(0,0,0,0.6)', color: '#fff', fontSize: '0.6rem', fontWeight: 700, padding: '1px 5px', borderRadius: '4px' }}>
                  {idx + 1}
                </div>
              </>
            )}
          </div>
        ))}

        {/* Slot para agregar más */}
        {puedeAgregar && (
          <label
            onDrop={handleDrop}
            onDragOver={e => e.preventDefault()}
            style={{
              borderRadius: '10px', border: '2px dashed var(--admin-border)',
              aspectRatio: '4/3', display: 'flex', flexDirection: 'column',
              alignItems: 'center', justifyContent: 'center', gap: '0.4rem',
              cursor: 'pointer', transition: 'all 0.2s', color: 'var(--admin-text-muted)',
              background: 'var(--admin-surface-2)',
            }}
            onMouseEnter={e => { e.currentTarget.style.borderColor = 'var(--admin-primary)'; e.currentTarget.style.color = 'var(--admin-primary)'; }}
            onMouseLeave={e => { e.currentTarget.style.borderColor = 'var(--admin-border)'; e.currentTarget.style.color = 'var(--admin-text-muted)'; }}
          >
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="3" y="3" width="18" height="18" rx="2"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/></svg>
            <span style={{ fontSize: '0.65rem', fontWeight: 600, textAlign: 'center', lineHeight: 1.3 }}>
              Agregar<br />imagen
            </span>
            <input
              ref={inputRef}
              type="file"
              accept="image/*"
              multiple
              style={{ display: 'none' }}
              onChange={e => handleFiles(e.target.files)}
            />
          </label>
        )}

        {/* Spinner slot al subir */}
        {uploading && uploadingIdx !== null && uploadingIdx >= urls.length && (
          <div style={{ borderRadius: '10px', border: '1px solid var(--admin-border)', aspectRatio: '4/3', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: '0.5rem', background: 'var(--admin-surface-2)', color: 'var(--admin-text-muted)', fontSize: '0.72rem' }}>
            <div style={{ width: 24, height: 24, border: '3px solid var(--admin-border)', borderTopColor: 'var(--admin-primary)', borderRadius: '50%', animation: 'spin 0.8s linear infinite' }} />
            Subiendo...
          </div>
        )}
      </div>

      {/* Error */}
      {error && (
        <div style={{ fontSize: '0.78rem', color: '#ef4444', padding: '0.5rem 0.75rem', background: 'rgba(239,68,68,0.08)', borderRadius: '8px', border: '1px solid rgba(239,68,68,0.2)' }}>
          ⚠️ {error}
        </div>
      )}

      {/* Tip */}
      <p style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)', margin: 0 }}>
        Arrastra o haz clic para agregar. Máx. 8MB por imagen. Hover sobre la imagen para reemplazar o eliminar.
      </p>

      <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
    </div>
  );
}
