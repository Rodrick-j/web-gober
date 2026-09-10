'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import styles from './Solicitudes.module.css';
import { Inbox, Trash2 } from 'lucide-react';

const ESTADOS = [
  { id: 'recibida', label: 'Recibida' },
  { id: 'en_proceso', label: 'En proceso' },
  { id: 'respondida', label: 'Respondida' },
  { id: 'rechazada', label: 'Rechazada' },
];
const TIPOS = {
  solicitud_informacion: 'Solicitud de información',
  consulta: 'Consulta',
  reclamo: 'Reclamo',
  sugerencia: 'Sugerencia',
};

const fmt = (v) => v ? new Date(v).toLocaleString('es-BO', { dateStyle: 'medium', timeStyle: 'short' }) : '—';

export default function SolicitudesAdmin() {
  const supabase = createClient();
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [fEstado, setFEstado] = useState('todas');
  const [fTipo, setFTipo] = useState('todas');

  const [sel, setSel] = useState(null);
  const [estado, setEstado] = useState('recibida');
  const [encargado, setEncargado] = useState('');
  const [respuesta, setRespuesta] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => { fetchRows(); }, []);

  const fetchRows = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from('solicitudes_ciudadanas')
      .select('*')
      .order('created_at', { ascending: false });
    if (data && !error) setRows(data);
    setLoading(false);
  };

  const open = (r) => {
    setSel(r);
    setEstado(r.estado || 'recibida');
    setEncargado(r.encargado || '');
    setRespuesta(r.respuesta || '');
  };
  const close = () => setSel(null);

  const handleSave = async () => {
    if (!sel) return;
    setSaving(true);
    try {
      const { data: { user } } = await supabase.auth.getUser();
      const patch = {
        estado,
        encargado: encargado.trim() || null,
        respuesta: respuesta.trim() || null,
      };
      if (respuesta.trim() || estado === 'respondida') {
        patch.respondido_por = user?.id ?? null;
        patch.respondido_en = new Date().toISOString();
      }
      const { error } = await supabase.from('solicitudes_ciudadanas').update(patch).eq('id', sel.id);
      if (error) throw error;
      await fetchRows();
      close();
    } catch (err) {
      alert('Error al guardar: ' + (err.message || err));
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    if (!sel || !confirm('¿Eliminar definitivamente esta solicitud?')) return;
    const { error } = await supabase.from('solicitudes_ciudadanas').delete().eq('id', sel.id);
    if (error) { alert('Error: ' + error.message); return; }
    await fetchRows();
    close();
  };

  const filtered = rows.filter(
    (r) => (fEstado === 'todas' || r.estado === fEstado) && (fTipo === 'todas' || r.tipo === fTipo)
  );

  return (
    <div className={`adminPage ${styles.container}`}>
      <div className={styles.header}>
        <h1 className={`adminTitle ${styles.title}`}>
          <Inbox size={20} style={{ verticalAlign: '-3px', marginRight: 8 }} />
          Solicitudes Ciudadanas
        </h1>
        <p className={`adminSubtitle ${styles.subtitle}`}>
          Bandeja de solicitudes de información pública y consultas de la ciudadanía.
          Registrar aquí la respuesta enviada constituye el <strong>registro de respuestas</strong> exigido por la RM 067/2025 (ítems 18, 43 y 44).
        </p>
      </div>

      <div className={styles.filters}>
        <select className={styles.select} value={fEstado} onChange={(e) => setFEstado(e.target.value)}>
          <option value="todas">Todos los estados</option>
          {ESTADOS.map((e) => <option key={e.id} value={e.id}>{e.label}</option>)}
        </select>
        <select className={styles.select} value={fTipo} onChange={(e) => setFTipo(e.target.value)}>
          <option value="todas">Todos los tipos</option>
          {Object.entries(TIPOS).map(([id, label]) => <option key={id} value={id}>{label}</option>)}
        </select>
      </div>

      {loading ? (
        <div className={styles.loading}>Cargando solicitudes…</div>
      ) : filtered.length === 0 ? (
        <div className={styles.emptyState}>No hay solicitudes que coincidan con el filtro.</div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Fecha</th>
                <th>Solicitante</th>
                <th>Asunto</th>
                <th>Tipo</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              {filtered.map((r) => (
                <tr key={r.id} className={styles.rowClickable} onClick={() => open(r)}>
                  <td>{fmt(r.created_at)}</td>
                  <td>{r.nombre}</td>
                  <td>{r.asunto}</td>
                  <td>{TIPOS[r.tipo] || r.tipo}</td>
                  <td><span className={`${styles.badge} ${styles['st_' + r.estado]}`}>{ESTADOS.find((e) => e.id === r.estado)?.label || r.estado}</span></td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {sel && (
        <div className={styles.modalOverlay} onClick={(e) => { if (e.target === e.currentTarget) close(); }}>
          <div className={styles.modal}>
            <div className={styles.modalHeader}>
              <h2>Solicitud · {sel.asunto}</h2>
              <button className={styles.closeBtn} onClick={close}>✕</button>
            </div>
            <div className={styles.modalBody}>
              <dl className={styles.dl}>
                <dt>Recibida</dt><dd>{fmt(sel.created_at)}</dd>
                <dt>Nombre</dt><dd>{sel.nombre}</dd>
                <dt>CI / NIT</dt><dd>{sel.documento_id || '—'}</dd>
                <dt>Correo</dt><dd>{sel.email || '—'}</dd>
                <dt>Teléfono</dt><dd>{sel.telefono || '—'}</dd>
                <dt>Tipo</dt><dd>{TIPOS[sel.tipo] || sel.tipo}</dd>
              </dl>

              <div className={styles.formGroup}>
                <label>Detalle de la solicitud</label>
                <div className={styles.detalleBox}>{sel.detalle}</div>
              </div>

              <div className={styles.formGroup}>
                <label>Encargado de la respuesta</label>
                <input type="text" value={encargado} onChange={(e) => setEncargado(e.target.value)} placeholder="Nombre del servidor público responsable" />
              </div>

              <div className={styles.formGroup}>
                <label>Estado</label>
                <select value={estado} onChange={(e) => setEstado(e.target.value)}>
                  {ESTADOS.map((e) => <option key={e.id} value={e.id}>{e.label}</option>)}
                </select>
              </div>

              <div className={styles.formGroup}>
                <label>Respuesta enviada al solicitante</label>
                <textarea rows={5} value={respuesta} onChange={(e) => setRespuesta(e.target.value)} placeholder="Registre aquí el contenido de la respuesta remitida…" />
              </div>

              {sel.respondido_en && (
                <p style={{ fontSize: '0.8rem', color: '#64748b' }}>Última respuesta registrada: {fmt(sel.respondido_en)}</p>
              )}

              <div className={styles.modalFooter}>
                <button className={styles.btnDanger} onClick={handleDelete}>
                  <Trash2 size={14} style={{ verticalAlign: '-2px', marginRight: 4 }} /> Eliminar
                </button>
                <div style={{ display: 'flex', gap: '0.75rem' }}>
                  <button className={styles.btnSecondary} onClick={close} disabled={saving}>Cerrar</button>
                  <button className={styles.btnPrimary} onClick={handleSave} disabled={saving}>
                    {saving ? 'Guardando…' : 'Guardar'}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
