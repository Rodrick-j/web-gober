'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import RichTextEditor from '@/components/admin/RichTextEditor/RichTextEditor';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import { revalidateContenido } from './actions';
import styles from './ContenidoInstitucional.module.css';
import { Pencil, FileText, Image as ImageIcon } from 'lucide-react';

// Bloques de contenido exigidos por la RM 067/2025 (Lineamientos de Contenidos Mínimos).
// `file`: null = solo texto | 'pdf' | 'image'
const BLOQUES = [
  { clave: 'mision', label: 'Misión', descripcion: 'Propósito esencial de la entidad. RM 067/2025 · ítem 1. Plazo de publicación: 10 días hábiles.', file: null },
  { clave: 'vision', label: 'Visión', descripcion: 'Dirección futura y metas estratégicas. RM 067/2025 · ítem 2.', file: null },
  { clave: 'valores_principios', label: 'Valores y Principios', descripcion: 'Cualidades y reglas que rigen la cultura institucional. RM 067/2025 · ítem 3.', file: null },
  { clave: 'objetivos_institucionales', label: 'Objetivos Institucionales', descripcion: 'Resumen del Plan Estratégico, redactados en infinitivo y medibles. RM 067/2025 · ítem 6.', file: null },
  { clave: 'resena_historica', label: 'Reseña Histórica', descripcion: 'Historia y evolución orgánica y funcional de la institución. RM 067/2025 · ítem 4.', file: null },
  { clave: 'memoria_institucional', label: 'Memoria Institucional / Informe de Gestión', descripcion: 'Balance documentado de la gestión: resultados, ejecución y logros. RM 067/2025 · ítem 5. Adjunte el documento en PDF.', file: 'pdf' },
  { clave: 'unidad_transparencia', label: 'Unidad de Transparencia y LCC', descripcion: 'Responsable, contacto, ubicación y funciones (Ley 974). RM 067/2025 · ítem 11.1 / 16. Se muestra en /transparencia/unidad.', file: null },
  { clave: 'encargado_mensajes', label: 'Atención a la Ciudadanía', descripcion: 'Responsable(s) de recibir y contestar mensajes y llamadas. RM 067/2025 · ítem 16.1 / 43.', file: null },
  { clave: 'organigrama_archivo', label: 'Organigrama Institucional', descripcion: 'Organigrama oficial aprobado (imagen o PDF). RM 067/2025 · ítem 13.1.1 / 30. Se muestra en /institucion/organigrama.', file: 'image' },
];

export default function ContenidoInstitucionalAdmin() {
  const supabase = createClient();
  const [rows, setRows] = useState({});
  const [loading, setLoading] = useState(true);

  const [editing, setEditing] = useState(null); // bloque config
  const [titulo, setTitulo] = useState('');
  const [cuerpo, setCuerpo] = useState('');
  const [nuevoArchivo, setNuevoArchivo] = useState(null);
  const [saving, setSaving] = useState(false);

  useEffect(() => { fetchRows(); }, []);

  const fetchRows = async () => {
    setLoading(true);
    const { data, error } = await supabase.from('contenido_institucional').select('*');
    if (data && !error) {
      const map = {};
      data.forEach((r) => { map[r.clave] = r; });
      setRows(map);
    }
    setLoading(false);
  };

  const openEditor = (bloque) => {
    const row = rows[bloque.clave] || {};
    setEditing(bloque);
    setTitulo(row.titulo || bloque.label);
    setCuerpo(row.cuerpo || '');
    setNuevoArchivo(null);
  };

  const closeEditor = () => {
    setEditing(null);
    setNuevoArchivo(null);
  };

  const handleSave = async () => {
    if (!editing) return;
    setSaving(true);
    try {
      const { data: { user } } = await supabase.auth.getUser();

      let archivo_url = rows[editing.clave]?.archivo_url || null;
      if (nuevoArchivo) {
        archivo_url = await uploadFile(nuevoArchivo, editing.file === 'pdf' ? 'documentos' : 'general');
      }

      const { error } = await supabase.from('contenido_institucional').upsert({
        clave: editing.clave,
        titulo,
        cuerpo,
        archivo_url,
        actualizado_por: user?.id ?? null,
        actualizado_en: new Date().toISOString(),
      });

      if (error) throw error;

      await revalidateContenido();
      await fetchRows();
      closeEditor();
    } catch (err) {
      alert('Error al guardar: ' + (err.message || err));
    } finally {
      setSaving(false);
    }
  };

  const fmtFecha = (v) => v ? new Date(v).toLocaleDateString('es-BO', { day: 'numeric', month: 'short', year: 'numeric' }) : '—';
  const tieneContenido = (row) => Boolean(row && ((row.cuerpo && row.cuerpo.replace(/<[^>]*>/g, '').trim().length > 40) || row.archivo_url));

  return (
    <div className={`adminPage ${styles.container}`}>
      <div className={styles.header}>
        <h1 className={`adminTitle ${styles.title}`}>Contenido Institucional</h1>
        <p className={`adminSubtitle ${styles.subtitle}`}>
          Bloques de información institucional exigidos por la <strong>Resolución Ministerial N° 067/2025</strong> (Lineamientos de Contenidos Mínimos).
          Se publican en <code>/institucion/historia-institucion</code>, <code>/institucion/organigrama</code> y <code>/transparencia/unidad</code>.
        </p>
      </div>

      {loading ? (
        <div className={styles.loading}>Cargando bloques…</div>
      ) : (
        <div className={styles.grid}>
          {BLOQUES.map((b) => {
            const row = rows[b.clave];
            const ok = tieneContenido(row);
            return (
              <div key={b.clave} className={styles.card}>
                <div className={styles.cardTitle}>
                  {b.file === 'pdf' ? <FileText size={18} /> : b.file === 'image' ? <ImageIcon size={18} /> : null}
                  {b.label}
                </div>
                <div className={styles.cardDesc}>{b.descripcion}</div>
                <div className={styles.cardMeta}>Última edición: {fmtFecha(row?.actualizado_en)}</div>
                <div className={styles.cardRow}>
                  <span className={ok ? styles.tagOk : styles.tagPending}>
                    {ok ? '✓ Publicado' : '⚠ Pendiente / incompleto'}
                  </span>
                  <button className={styles.btnPrimary} onClick={() => openEditor(b)}>
                    <Pencil size={15} /> Editar
                  </button>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {editing && (
        <div className={styles.modalOverlay} onClick={(e) => { if (e.target === e.currentTarget) closeEditor(); }}>
          <div className={styles.modal}>
            <div className={styles.modalHeader}>
              <h2>Editar: {editing.label}</h2>
              <button className={styles.closeBtn} onClick={closeEditor}>✕</button>
            </div>
            <div className={styles.modalBody}>
              <div className={styles.formGroup}>
                <label>Título de la sección</label>
                <input type="text" value={titulo} onChange={(e) => setTitulo(e.target.value)} />
              </div>

              <div className={styles.formGroup}>
                <label>Contenido</label>
                <RichTextEditor value={cuerpo} onChange={setCuerpo} placeholder="Redacta el contenido de esta sección…" />
              </div>

              {editing.file && (
                <div className={styles.formGroup}>
                  <label>{editing.file === 'pdf' ? 'Documento (PDF)' : 'Imagen o PDF del organigrama'}</label>
                  {rows[editing.clave]?.archivo_url && (
                    <div className={styles.currentFile}>
                      Archivo actual:&nbsp;
                      <a href={rows[editing.clave].archivo_url} target="_blank" rel="noopener noreferrer">ver archivo</a>
                    </div>
                  )}
                  <FileUpload
                    onFileSelect={setNuevoArchivo}
                    accept={editing.file === 'pdf' ? 'application/pdf' : 'image/*,application/pdf'}
                    label="Reemplazar archivo"
                    icon={editing.file === 'pdf' ? '📄' : '🖼️'}
                    maxSizeMB={editing.file === 'pdf' ? 10 : 5}
                  />
                  {nuevoArchivo && <p className={styles.uploadSuccess}>✓ {nuevoArchivo.name}</p>}
                </div>
              )}

              <div className={styles.modalFooter}>
                <button className={styles.btnSecondary} onClick={closeEditor} disabled={saving}>Cancelar</button>
                <button className={styles.btnPrimary} onClick={handleSave} disabled={saving}>
                  {saving ? 'Guardando…' : 'Guardar cambios'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
