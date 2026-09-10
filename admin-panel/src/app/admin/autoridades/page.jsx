'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import styles from './Autoridades.module.css';
import { Plus, Trash2, Pencil } from 'lucide-react';

// RM 067/2025 · Recursos Humanos · ítem 31 (Nómina de Autoridades)
const NIVELES = [
  { id: 'maxima', label: 'Máxima Autoridad (Gobernador/a)' },
  { id: 'secretario', label: 'Secretario/a Departamental' },
  { id: 'director', label: 'Director/a General' },
  { id: 'jefe', label: 'Jefe/a de Unidad' },
  { id: 'otro', label: 'Otro' },
];
const nivelLabel = (id) => NIVELES.find((n) => n.id === id)?.label || id;

const EMPTY = { nombre: '', cargo: '', nivel: 'director', unidad: '', bio: '', email: '', telefono: '', orden: 0 };

export default function AutoridadesAdmin() {
  const supabase = createClient();
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filtro, setFiltro] = useState('todos');

  const [open, setOpen] = useState(false);
  const [editingId, setEditingId] = useState(null);
  const [form, setForm] = useState(EMPTY);
  const [fotoFile, setFotoFile] = useState(null);
  const [currentFoto, setCurrentFoto] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => { fetchRows(); }, []);

  const fetchRows = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from('autoridades')
      .select('*')
      .order('orden', { ascending: true })
      .order('created_at', { ascending: true });
    if (data && !error) setRows(data);
    setLoading(false);
  };

  const openNew = () => {
    setEditingId(null); setForm(EMPTY);
    setFotoFile(null); setCurrentFoto('');
    setOpen(true);
  };
  const openEdit = (r) => {
    setEditingId(r.id);
    setForm({
      nombre: r.nombre || '', cargo: r.cargo || '', nivel: r.nivel || 'director',
      unidad: r.unidad || '', bio: r.bio || '', email: r.email || '', telefono: r.telefono || '',
      orden: r.orden ?? 0,
    });
    setFotoFile(null); setCurrentFoto(r.foto_url || '');
    setOpen(true);
  };
  const set = (k) => (e) => setForm((f) => ({ ...f, [k]: e.target.value }));

  const handleSave = async (e) => {
    e.preventDefault();
    if (!form.nombre.trim() || !form.cargo.trim()) { alert('Nombre y cargo son obligatorios.'); return; }
    setSaving(true);
    try {
      let foto_url = currentFoto || null;
      if (fotoFile) foto_url = await uploadFile(fotoFile, 'general');
      const payload = {
        nombre: form.nombre.trim(),
        cargo: form.cargo.trim(),
        nivel: form.nivel,
        unidad: form.unidad.trim() || null,
        bio: form.bio.trim() || null,
        email: form.email.trim() || null,
        telefono: form.telefono.trim() || null,
        orden: parseInt(form.orden) || 0,
        foto_url,
      };
      const q = editingId
        ? supabase.from('autoridades').update(payload).eq('id', editingId)
        : supabase.from('autoridades').insert(payload);
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
    await supabase.from('autoridades').update({ activo: !r.activo }).eq('id', r.id);
    fetchRows();
  };
  const handleDelete = async (r) => {
    if (!confirm('¿Eliminar esta autoridad de la nómina?')) return;
    await supabase.from('autoridades').delete().eq('id', r.id);
    fetchRows();
  };

  const filtered = filtro === 'todos' ? rows : rows.filter((r) => r.nivel === filtro);

  return (
    <div className={`adminPage ${styles.container}`}>
      <div className={styles.header}>
        <div>
          <h1 className={`adminTitle ${styles.title}`}>Nómina de Autoridades</h1>
          <p className={`adminSubtitle ${styles.subtitle}`}>
            Autoridades de la institución hasta directores generales, con fotografía y breve biografía
            (RM 067/2025 · ítem 13.1.2). Se muestran en <code>/institucion/autoridades</code>.
          </p>
        </div>
        <button className={styles.btnPrimary} onClick={openNew}><Plus size={18} /> Nueva autoridad</button>
      </div>

      <div className={styles.filters}>
        <select className={styles.select} value={filtro} onChange={(e) => setFiltro(e.target.value)}>
          <option value="todos">Todos los niveles</option>
          {NIVELES.map((n) => <option key={n.id} value={n.id}>{n.label}</option>)}
        </select>
      </div>

      {loading ? (
        <div className={styles.loading}>Cargando…</div>
      ) : filtered.length === 0 ? (
        <div className={styles.emptyState}>No hay autoridades registradas.</div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead><tr><th></th><th>Nombre</th><th>Cargo</th><th>Nivel</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody>
              {filtered.map((r) => (
                <tr key={r.id}>
                  <td>{r.foto_url ? <img className={styles.avatar} src={r.foto_url} alt="" /> : <div className={styles.avatar} />}</td>
                  <td>{r.nombre}</td>
                  <td>{r.cargo}</td>
                  <td><span className={styles.badge}>{nivelLabel(r.nivel)}</span></td>
                  <td>
                    <button className={`${styles.badge} ${r.activo ? '' : styles.badgeOff}`} onClick={() => toggleActivo(r)} style={{ cursor: 'pointer', border: 'none' }}>
                      {r.activo ? 'Visible' : 'Oculta'}
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
              <h2>{editingId ? 'Editar autoridad' : 'Nueva autoridad'}</h2>
              <button className={styles.closeBtn} onClick={() => setOpen(false)}>✕</button>
            </div>
            <form className={styles.modalBody} onSubmit={handleSave}>
              <div className={styles.formGroup}>
                <label>Nombre y apellidos</label>
                <input type="text" value={form.nombre} onChange={set('nombre')} required maxLength={150} />
              </div>
              <div className={styles.formRow}>
                <div className={styles.formGroup}>
                  <label>Cargo</label>
                  <input type="text" value={form.cargo} onChange={set('cargo')} required maxLength={150} />
                </div>
                <div className={styles.formGroup}>
                  <label>Nivel</label>
                  <select value={form.nivel} onChange={set('nivel')}>
                    {NIVELES.map((n) => <option key={n.id} value={n.id}>{n.label}</option>)}
                  </select>
                </div>
              </div>
              <div className={styles.formGroup}>
                <label>Unidad / Secretaría</label>
                <input type="text" value={form.unidad} onChange={set('unidad')} maxLength={200} />
              </div>
              <div className={styles.formGroup}>
                <label>Biografía breve</label>
                <textarea rows={4} value={form.bio} onChange={set('bio')} maxLength={2000} />
              </div>
              <div className={styles.formRow}>
                <div className={styles.formGroup}>
                  <label>Correo (opcional)</label>
                  <input type="email" value={form.email} onChange={set('email')} maxLength={150} />
                </div>
                <div className={styles.formGroup}>
                  <label>Teléfono (opcional)</label>
                  <input type="text" value={form.telefono} onChange={set('telefono')} maxLength={40} />
                </div>
              </div>
              <div className={styles.formGroup}>
                <label>Orden de aparición</label>
                <input type="number" value={form.orden} onChange={set('orden')} min={0} />
              </div>
              <div className={styles.formGroup}>
                <label>Fotografía</label>
                <FileUpload onFileSelect={setFotoFile} accept="image/*" label="Seleccionar fotografía" icon="👤" maxSizeMB={5} />
                {fotoFile && <p className={styles.uploadSuccess}>✓ {fotoFile.name}</p>}
                {!fotoFile && currentFoto && <p className={styles.currentLink}>Actual: <a href={currentFoto} target="_blank" rel="noopener noreferrer">ver foto</a></p>}
              </div>
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
