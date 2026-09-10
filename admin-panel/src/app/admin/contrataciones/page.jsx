'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import styles from './Contrataciones.module.css';
import { Plus, Trash2, Pencil } from 'lucide-react';

// RM 067/2025 · bloque Contrataciones (ítems 37 TdR, 38 Convocatorias, 39 Proveedores)
const TIPOS_CONV = [
  { id: 'tdr', label: 'Términos de Referencia' },
  { id: 'bienes_servicios', label: 'Adquisición de Bienes y Servicios' },
  { id: 'empleo', label: 'Oportunidad de Empleo' },
];
const ESTADOS_CONV = [
  { id: 'vigente', label: 'Vigente' },
  { id: 'cerrada', label: 'Cerrada' },
  { id: 'adjudicada', label: 'Adjudicada' },
  { id: 'desierta', label: 'Desierta' },
];
const lbl = (arr, id) => arr.find((x) => x.id === id)?.label || id;
const hoy = () => new Date().toISOString().split('T')[0];

const EMPTY_CONV = { tipo: 'bienes_servicios', titulo: '', codigo: '', descripcion: '', fecha_publicacion: hoy(), fecha_limite: '', estado: 'vigente' };
const EMPTY_PROV = { nombre: '', nit: '', contacto: '', rubro: '', productos_servicios: '', condiciones_pago: '' };

export default function ContratacionesAdmin() {
  const supabase = createClient();
  const [tab, setTab] = useState('convocatorias');

  const [convs, setConvs] = useState([]);
  const [provs, setProvs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [fTipo, setFTipo] = useState('todas');

  const [open, setOpen] = useState(false);
  const [editingId, setEditingId] = useState(null);
  const [form, setForm] = useState(EMPTY_CONV);
  const [pdfFile, setPdfFile] = useState(null);
  const [currentPdf, setCurrentPdf] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => { fetchAll(); }, []);

  const fetchAll = async () => {
    setLoading(true);
    const [{ data: c }, { data: p }] = await Promise.all([
      supabase.from('convocatorias').select('*').order('fecha_publicacion', { ascending: false }),
      supabase.from('proveedores').select('*').order('nombre', { ascending: true }),
    ]);
    setConvs(c || []);
    setProvs(p || []);
    setLoading(false);
  };

  const set = (k) => (e) => setForm((f) => ({ ...f, [k]: e.target.value }));

  const openNew = () => {
    setEditingId(null);
    setForm(tab === 'convocatorias' ? EMPTY_CONV : EMPTY_PROV);
    setPdfFile(null); setCurrentPdf('');
    setOpen(true);
  };
  const openEditConv = (r) => {
    setEditingId(r.id);
    setForm({
      tipo: r.tipo, titulo: r.titulo || '', codigo: r.codigo || '', descripcion: r.descripcion || '',
      fecha_publicacion: (r.fecha_publicacion || hoy()).split('T')[0],
      fecha_limite: r.fecha_limite ? r.fecha_limite.split('T')[0] : '',
      estado: r.estado || 'vigente',
    });
    setPdfFile(null); setCurrentPdf(r.archivo_url || '');
    setOpen(true);
  };
  const openEditProv = (r) => {
    setEditingId(r.id);
    setForm({
      nombre: r.nombre || '', nit: r.nit || '', contacto: r.contacto || '',
      rubro: r.rubro || '', productos_servicios: r.productos_servicios || '', condiciones_pago: r.condiciones_pago || '',
    });
    setOpen(true);
  };

  const saveConv = async () => {
    if (!form.titulo?.trim()) { alert('El título es obligatorio.'); return false; }
    let archivo_url = currentPdf || null;
    if (pdfFile) archivo_url = await uploadFile(pdfFile, 'documentos');
    const payload = {
      tipo: form.tipo, titulo: form.titulo.trim(), codigo: form.codigo.trim() || null,
      descripcion: form.descripcion.trim() || null, fecha_publicacion: form.fecha_publicacion || null,
      fecha_limite: form.fecha_limite || null, estado: form.estado, archivo_url,
    };
    const q = editingId
      ? supabase.from('convocatorias').update(payload).eq('id', editingId)
      : supabase.from('convocatorias').insert(payload);
    const { error } = await q;
    if (error) throw error;
    return true;
  };

  const saveProv = async () => {
    if (!form.nombre?.trim()) { alert('El nombre del proveedor es obligatorio.'); return false; }
    const payload = {
      nombre: form.nombre.trim(), nit: form.nit.trim() || null, contacto: form.contacto.trim() || null,
      rubro: form.rubro.trim() || null, productos_servicios: form.productos_servicios.trim() || null,
      condiciones_pago: form.condiciones_pago.trim() || null,
    };
    const q = editingId
      ? supabase.from('proveedores').update(payload).eq('id', editingId)
      : supabase.from('proveedores').insert(payload);
    const { error } = await q;
    if (error) throw error;
    return true;
  };

  const handleSave = async (e) => {
    e.preventDefault();
    setSaving(true);
    try {
      const ok = tab === 'convocatorias' ? await saveConv() : await saveProv();
      if (ok) { setOpen(false); await fetchAll(); }
    } catch (err) {
      alert('Error al guardar: ' + (err.message || err));
    } finally {
      setSaving(false);
    }
  };

  const toggleActivo = async (table, r) => {
    await supabase.from(table).update({ activo: !r.activo }).eq('id', r.id);
    fetchAll();
  };
  const del = async (table, r) => {
    if (!confirm('¿Eliminar definitivamente este registro?')) return;
    await supabase.from(table).delete().eq('id', r.id);
    fetchAll();
  };

  const convsFiltradas = fTipo === 'todas' ? convs : convs.filter((c) => c.tipo === fTipo);

  return (
    <div className={`adminPage ${styles.container}`}>
      <div className={styles.header}>
        <div>
          <h1 className={`adminTitle ${styles.title}`}>Contrataciones y Proveedores</h1>
          <p className={`adminSubtitle ${styles.subtitle}`}>
            Convocatorias (TdR, bienes y servicios, empleo) y lista de proveedores.
            RM 067/2025 · bloque Contrataciones. Se muestran en <code>/contrataciones</code>.
          </p>
        </div>
        <button className={styles.btnPrimary} onClick={openNew}>
          <Plus size={18} /> {tab === 'convocatorias' ? 'Nueva convocatoria' : 'Nuevo proveedor'}
        </button>
      </div>

      <div className={styles.tabsBar}>
        <button className={`${styles.tabBtn} ${tab === 'convocatorias' ? styles.tabBtnActive : ''}`} onClick={() => setTab('convocatorias')}>Convocatorias</button>
        <button className={`${styles.tabBtn} ${tab === 'proveedores' ? styles.tabBtnActive : ''}`} onClick={() => setTab('proveedores')}>Proveedores</button>
      </div>

      {tab === 'convocatorias' && (
        <div className={styles.toolbar}>
          <select className={styles.select} value={fTipo} onChange={(e) => setFTipo(e.target.value)}>
            <option value="todas">Todos los tipos</option>
            {TIPOS_CONV.map((t) => <option key={t.id} value={t.id}>{t.label}</option>)}
          </select>
        </div>
      )}

      {loading ? (
        <div className={styles.loading}>Cargando…</div>
      ) : tab === 'convocatorias' ? (
        convsFiltradas.length === 0 ? (
          <div className={styles.emptyState}>No hay convocatorias registradas.</div>
        ) : (
          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead><tr><th>Título</th><th>Tipo</th><th>Publicación</th><th>Límite</th><th>Estado</th><th>Acciones</th></tr></thead>
              <tbody>
                {convsFiltradas.map((r) => (
                  <tr key={r.id}>
                    <td>{r.titulo}{r.codigo ? ` · ${r.codigo}` : ''}</td>
                    <td><span className={styles.badge}>{lbl(TIPOS_CONV, r.tipo)}</span></td>
                    <td>{r.fecha_publicacion ? new Date(r.fecha_publicacion).toLocaleDateString('es-BO') : '—'}</td>
                    <td>{r.fecha_limite ? new Date(r.fecha_limite).toLocaleDateString('es-BO') : '—'}</td>
                    <td>
                      <span className={`${styles.badge} ${r.estado === 'vigente' ? styles.badgeVigente : ''} ${r.activo ? '' : styles.badgeOff}`}>
                        {r.activo ? lbl(ESTADOS_CONV, r.estado) : 'Oculta'}
                      </span>
                    </td>
                    <td>
                      <div className={styles.actions}>
                        <button className={styles.btnIcon} onClick={() => openEditConv(r)}><Pencil size={14} /></button>
                        <button className={styles.btnIcon} onClick={() => toggleActivo('convocatorias', r)}>{r.activo ? 'Ocultar' : 'Mostrar'}</button>
                        <button className={styles.btnIconDanger} onClick={() => del('convocatorias', r)}><Trash2 size={15} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )
      ) : provs.length === 0 ? (
        <div className={styles.emptyState}>No hay proveedores registrados.</div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead><tr><th>Nombre</th><th>NIT</th><th>Rubro</th><th>Contacto</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody>
              {provs.map((r) => (
                <tr key={r.id}>
                  <td>{r.nombre}</td>
                  <td>{r.nit || '—'}</td>
                  <td>{r.rubro || '—'}</td>
                  <td>{r.contacto || '—'}</td>
                  <td><span className={`${styles.badge} ${r.activo ? '' : styles.badgeOff}`}>{r.activo ? 'Activo' : 'Inactivo'}</span></td>
                  <td>
                    <div className={styles.actions}>
                      <button className={styles.btnIcon} onClick={() => openEditProv(r)}><Pencil size={14} /></button>
                      <button className={styles.btnIcon} onClick={() => toggleActivo('proveedores', r)}>{r.activo ? 'Ocultar' : 'Mostrar'}</button>
                      <button className={styles.btnIconDanger} onClick={() => del('proveedores', r)}><Trash2 size={15} /></button>
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
              <h2>{editingId ? 'Editar' : 'Nuevo'} · {tab === 'convocatorias' ? 'Convocatoria' : 'Proveedor'}</h2>
              <button className={styles.closeBtn} onClick={() => setOpen(false)}>✕</button>
            </div>
            <form className={styles.modalBody} onSubmit={handleSave}>
              {tab === 'convocatorias' ? (
                <>
                  <div className={styles.formRow}>
                    <div className={styles.formGroup}>
                      <label>Tipo</label>
                      <select value={form.tipo} onChange={set('tipo')}>
                        {TIPOS_CONV.map((t) => <option key={t.id} value={t.id}>{t.label}</option>)}
                      </select>
                    </div>
                    <div className={styles.formGroup}>
                      <label>Estado</label>
                      <select value={form.estado} onChange={set('estado')}>
                        {ESTADOS_CONV.map((s) => <option key={s.id} value={s.id}>{s.label}</option>)}
                      </select>
                    </div>
                  </div>
                  <div className={styles.formGroup}>
                    <label>Título</label>
                    <input type="text" value={form.titulo} onChange={set('titulo')} required maxLength={250} />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Código / CUCE (opcional)</label>
                    <input type="text" value={form.codigo} onChange={set('codigo')} maxLength={80} />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Descripción</label>
                    <textarea rows={3} value={form.descripcion} onChange={set('descripcion')} maxLength={2000} />
                  </div>
                  <div className={styles.formRow}>
                    <div className={styles.formGroup}>
                      <label>Fecha de publicación</label>
                      <input type="date" value={form.fecha_publicacion} onChange={set('fecha_publicacion')} />
                    </div>
                    <div className={styles.formGroup}>
                      <label>Fecha límite (opcional)</label>
                      <input type="date" value={form.fecha_limite} onChange={set('fecha_limite')} />
                    </div>
                  </div>
                  <div className={styles.formGroup}>
                    <label>Pliego / TdR (PDF)</label>
                    <FileUpload onFileSelect={setPdfFile} accept="application/pdf" label="Seleccionar PDF" icon="📄" maxSizeMB={10} />
                    {pdfFile && <p className={styles.uploadSuccess}>✓ {pdfFile.name}</p>}
                    {!pdfFile && currentPdf && <p className={styles.currentLink}>Actual: <a href={currentPdf} target="_blank" rel="noopener noreferrer">ver PDF</a></p>}
                  </div>
                </>
              ) : (
                <>
                  <div className={styles.formGroup}>
                    <label>Nombre / Razón social</label>
                    <input type="text" value={form.nombre} onChange={set('nombre')} required maxLength={200} />
                  </div>
                  <div className={styles.formRow}>
                    <div className={styles.formGroup}>
                      <label>NIT</label>
                      <input type="text" value={form.nit} onChange={set('nit')} maxLength={40} />
                    </div>
                    <div className={styles.formGroup}>
                      <label>Rubro</label>
                      <input type="text" value={form.rubro} onChange={set('rubro')} maxLength={150} />
                    </div>
                  </div>
                  <div className={styles.formGroup}>
                    <label>Contacto (teléfono / correo)</label>
                    <input type="text" value={form.contacto} onChange={set('contacto')} maxLength={200} />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Productos / servicios</label>
                    <textarea rows={3} value={form.productos_servicios} onChange={set('productos_servicios')} maxLength={2000} />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Condiciones de pago (opcional)</label>
                    <input type="text" value={form.condiciones_pago} onChange={set('condiciones_pago')} maxLength={200} />
                  </div>
                </>
              )}

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
