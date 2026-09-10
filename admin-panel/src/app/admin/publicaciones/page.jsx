'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import styles from './Publicaciones.module.css';
import { Plus, Trash2, Pencil, Star } from 'lucide-react';

// RM 067/2025 · bloque Comunicación (ítems 24 a 29)
const TIPOS = [
  { id: 'publicacion', label: 'Publicación' },
  { id: 'boletin', label: 'Boletín' },
  { id: 'revista', label: 'Revista' },
  { id: 'articulo', label: 'Artículo' },
  { id: 'investigacion', label: 'Trabajo de Investigación' },
  { id: 'campania', label: 'Campaña / Actividad' },
];
const tipoLabel = (id) => TIPOS.find((t) => t.id === id)?.label || id;

const EMPTY = {
  tipo: 'publicacion',
  titulo: '',
  descripcion: '',
  fecha: new Date().toISOString().split('T')[0],
  autor: '',
  enlace_externo: '',
  es_destacada: false,
};

export default function PublicacionesAdmin() {
  const supabase = createClient();
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filtro, setFiltro] = useState('todas');

  const [open, setOpen] = useState(false);
  const [editingId, setEditingId] = useState(null);
  const [form, setForm] = useState(EMPTY);
  const [pdfFile, setPdfFile] = useState(null);
  const [imgFile, setImgFile] = useState(null);
  const [currentPdf, setCurrentPdf] = useState('');
  const [currentImg, setCurrentImg] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => { fetchRows(); }, []);

  const fetchRows = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from('publicaciones')
      .select('*')
      .order('fecha', { ascending: false })
      .order('created_at', { ascending: false });
    if (data && !error) setRows(data);
    setLoading(false);
  };

  const openNew = () => {
    setEditingId(null);
    setForm(EMPTY);
    setPdfFile(null); setImgFile(null);
    setCurrentPdf(''); setCurrentImg('');
    setOpen(true);
  };

  const openEdit = (r) => {
    setEditingId(r.id);
    setForm({
      tipo: r.tipo,
      titulo: r.titulo || '',
      descripcion: r.descripcion || '',
      fecha: (r.fecha || new Date().toISOString()).split('T')[0],
      autor: r.autor || '',
      enlace_externo: r.enlace_externo || '',
      es_destacada: !!r.es_destacada,
    });
    setPdfFile(null); setImgFile(null);
    setCurrentPdf(r.archivo_url || '');
    setCurrentImg(r.imagen_url || '');
    setOpen(true);
  };

  const set = (k) => (e) => {
    const v = e.target.type === 'checkbox' ? e.target.checked : e.target.value;
    setForm((f) => ({ ...f, [k]: v }));
  };

  const handleSave = async (e) => {
    e.preventDefault();
    if (!form.titulo.trim()) { alert('El título es obligatorio.'); return; }
    setSaving(true);
    try {
      let archivo_url = currentPdf || null;
      let imagen_url = currentImg || null;
      if (pdfFile) archivo_url = await uploadFile(pdfFile, 'documentos');
      if (imgFile) imagen_url = await uploadFile(imgFile, 'general');

      const payload = {
        tipo: form.tipo,
        titulo: form.titulo.trim(),
        descripcion: form.descripcion.trim() || null,
        fecha: form.fecha || null,
        autor: form.autor.trim() || null,
        enlace_externo: form.enlace_externo.trim() || null,
        es_destacada: form.es_destacada,
        archivo_url,
        imagen_url,
      };

      const q = editingId
        ? supabase.from('publicaciones').update(payload).eq('id', editingId)
        : supabase.from('publicaciones').insert(payload);
      const { error } = await q;
      if (error) throw error;

      setOpen(false);
      await fetchRows();
    } catch (err) {
      alert('Error al guardar: ' + (err.message || err));
    } finally {
      setSaving(false);
    }
  };

  const toggleActivo = async (r) => {
    await supabase.from('publicaciones').update({ activo: !r.activo }).eq('id', r.id);
    fetchRows();
  };

  const handleDelete = async (r) => {
    if (!confirm('¿Eliminar definitivamente esta publicación?')) return;
    await supabase.from('publicaciones').delete().eq('id', r.id);
    fetchRows();
  };

  const filtered = filtro === 'todas' ? rows : rows.filter((r) => r.tipo === filtro);

  return (
    <div className={`adminPage ${styles.container}`}>
      <div className={styles.header}>
        <div>
          <h1 className={`adminTitle ${styles.title}`}>Publicaciones</h1>
          <p className={`adminSubtitle ${styles.subtitle}`}>
            Publicaciones, boletines, revistas, artículos, trabajos de investigación y campañas.
            Contenidos mínimos exigidos por la RM 067/2025 (bloque Comunicación). Se muestran en <code>/publicaciones</code>.
          </p>
        </div>
        <button className={styles.btnPrimary} onClick={openNew}><Plus size={18} /> Nueva publicación</button>
      </div>

      <div className={styles.filters}>
        <select className={styles.select} value={filtro} onChange={(e) => setFiltro(e.target.value)}>
          <option value="todas">Todos los tipos</option>
          {TIPOS.map((t) => <option key={t.id} value={t.id}>{t.label}</option>)}
        </select>
      </div>

      {loading ? (
        <div className={styles.loading}>Cargando…</div>
      ) : filtered.length === 0 ? (
        <div className={styles.emptyState}>No hay publicaciones en esta categoría.</div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr><th>Título</th><th>Tipo</th><th>Fecha</th><th>Estado</th><th>Acciones</th></tr>
            </thead>
            <tbody>
              {filtered.map((r) => (
                <tr key={r.id}>
                  <td>
                    {r.es_destacada && <Star size={13} style={{ verticalAlign: '-2px', marginRight: 4, color: '#a16207' }} />}
                    {r.titulo}
                  </td>
                  <td><span className={styles.badge}>{tipoLabel(r.tipo)}</span></td>
                  <td>{r.fecha ? new Date(r.fecha).toLocaleDateString('es-BO') : '—'}</td>
                  <td>
                    <button className={`${styles.badge} ${r.activo ? '' : styles.badgeOff}`} onClick={() => toggleActivo(r)} style={{ cursor: 'pointer', border: 'none' }}>
                      {r.activo ? 'Publicada' : 'Oculta'}
                    </button>
                  </td>
                  <td>
                    <div className={styles.actions}>
                      <button className={styles.btnIcon} onClick={() => openEdit(r)}><Pencil size={14} /></button>
                      <button className={styles.btnIconDanger} onClick={() => handleDelete(r)}><Trash2 size={15} /></button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {open && (
        <div className={styles.modalOverlay} onClick={(e) => { if (e.target === e.currentTarget) setOpen(false); }}>
          <div className={styles.modal}>
            <div className={styles.modalHeader}>
              <h2>{editingId ? 'Editar publicación' : 'Nueva publicación'}</h2>
              <button className={styles.closeBtn} onClick={() => setOpen(false)}>✕</button>
            </div>
            <form className={styles.modalBody} onSubmit={handleSave}>
              <div className={styles.formRow}>
                <div className={styles.formGroup}>
                  <label>Tipo</label>
                  <select value={form.tipo} onChange={set('tipo')}>
                    {TIPOS.map((t) => <option key={t.id} value={t.id}>{t.label}</option>)}
                  </select>
                </div>
                <div className={styles.formGroup}>
                  <label>Fecha</label>
                  <input type="date" value={form.fecha} onChange={set('fecha')} />
                </div>
              </div>

              <div className={styles.formGroup}>
                <label>Título</label>
                <input type="text" value={form.titulo} onChange={set('titulo')} required maxLength={250} />
              </div>

              <div className={styles.formGroup}>
                <label>Descripción</label>
                <textarea rows={3} value={form.descripcion} onChange={set('descripcion')} maxLength={2000} />
              </div>

              <div className={styles.formRow}>
                <div className={styles.formGroup}>
                  <label>Autor (opcional)</label>
                  <input type="text" value={form.autor} onChange={set('autor')} maxLength={150} />
                </div>
                <div className={styles.formGroup}>
                  <label>Enlace externo (opcional)</label>
                  <input type="url" value={form.enlace_externo} onChange={set('enlace_externo')} placeholder="https://…" />
                </div>
              </div>

              <div className={styles.formGroup}>
                <label>Archivo PDF (opcional)</label>
                <FileUpload onFileSelect={setPdfFile} accept="application/pdf" label="Seleccionar PDF" icon="📄" maxSizeMB={10} />
                {pdfFile && <p className={styles.uploadSuccess}>✓ {pdfFile.name}</p>}
                {!pdfFile && currentPdf && <p className={styles.currentLink}>Actual: <a href={currentPdf} target="_blank" rel="noopener noreferrer">ver PDF</a></p>}
              </div>

              <div className={styles.formGroup}>
                <label>Imagen de portada (opcional)</label>
                <FileUpload onFileSelect={setImgFile} accept="image/*" label="Seleccionar imagen" icon="🖼️" maxSizeMB={5} />
                {imgFile && <p className={styles.uploadSuccess}>✓ {imgFile.name}</p>}
                {!imgFile && currentImg && <p className={styles.currentLink}>Actual: <a href={currentImg} target="_blank" rel="noopener noreferrer">ver imagen</a></p>}
              </div>

              <label className={styles.checkRow}>
                <input type="checkbox" checked={form.es_destacada} onChange={set('es_destacada')} />
                Destacar esta publicación
              </label>

              <div className={styles.modalFooter}>
                <button type="button" className={styles.btnSecondary} onClick={() => setOpen(false)} disabled={saving}>Cancelar</button>
                <button type="submit" className={styles.btnPrimary} disabled={saving}>{saving ? 'Guardando…' : 'Guardar'}</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
