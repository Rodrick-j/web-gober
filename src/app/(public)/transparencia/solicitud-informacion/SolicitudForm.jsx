'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import styles from './page.module.css';

const EMPTY = { nombre: '', documento_id: '', email: '', telefono: '', asunto: '', detalle: '', website: '' };

export default function SolicitudForm() {
  const [form, setForm] = useState(EMPTY);
  const [sending, setSending] = useState(false);
  const [error, setError] = useState('');
  const [done, setDone] = useState(false);

  const set = (k) => (e) => setForm((f) => ({ ...f, [k]: e.target.value }));

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');

    if (!form.nombre.trim() || !form.asunto.trim() || !form.detalle.trim()) {
      setError('Complete los campos obligatorios: nombre, asunto y detalle de la solicitud.');
      return;
    }
    if (form.email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
      setError('El correo electrónico no tiene un formato válido.');
      return;
    }

    // Honeypot anti-spam: si un bot llena "website", simulamos éxito sin guardar.
    if (form.website) { setDone(true); return; }

    setSending(true);
    try {
      const supabase = createClient();
      const { error: insErr } = await supabase.from('solicitudes_ciudadanas').insert({
        tipo: 'solicitud_informacion',
        nombre: form.nombre.trim(),
        documento_id: form.documento_id.trim() || null,
        email: form.email.trim() || null,
        telefono: form.telefono.trim() || null,
        asunto: form.asunto.trim(),
        detalle: form.detalle.trim(),
        origen: 'web',
      });
      if (insErr) throw insErr;
      setDone(true);
      setForm(EMPTY);
    } catch (err) {
      setError('No se pudo registrar la solicitud. Intente nuevamente en unos minutos. (' + (err.message || 'error') + ')');
    } finally {
      setSending(false);
    }
  };

  if (done) {
    return (
      <div className={styles.successCard}>
        <div className={styles.successIcon}>✅</div>
        <h2>Solicitud registrada</h2>
        <p>
          Su solicitud de información fue recibida correctamente. La Unidad de Transparencia
          y Lucha Contra la Corrupción dará respuesta a través del correo o teléfono
          proporcionado, conforme a los plazos establecidos en la normativa de acceso a la
          información pública.
        </p>
      </div>
    );
  }

  return (
    <form className={styles.card} onSubmit={handleSubmit} noValidate>
      {error && <div className={styles.error}>{error}</div>}

      <div className={styles.group}>
        <label>Nombre completo <span className={styles.req}>*</span></label>
        <input type="text" value={form.nombre} onChange={set('nombre')} required maxLength={150} />
      </div>

      <div className={styles.row}>
        <div className={styles.group}>
          <label>Cédula de Identidad / NIT</label>
          <input type="text" value={form.documento_id} onChange={set('documento_id')} maxLength={30} />
        </div>
        <div className={styles.group}>
          <label>Teléfono / celular</label>
          <input type="tel" value={form.telefono} onChange={set('telefono')} maxLength={30} />
        </div>
      </div>

      <div className={styles.group}>
        <label>Correo electrónico</label>
        <input type="email" value={form.email} onChange={set('email')} maxLength={150} />
      </div>

      <div className={styles.group}>
        <label>Asunto <span className={styles.req}>*</span></label>
        <input type="text" value={form.asunto} onChange={set('asunto')} required maxLength={200} />
      </div>

      <div className={styles.group}>
        <label>Detalle de la información solicitada <span className={styles.req}>*</span></label>
        <textarea rows={6} value={form.detalle} onChange={set('detalle')} required maxLength={4000} />
      </div>

      {/* Honeypot: oculto para personas, tentador para bots */}
      <div className={styles.honey} aria-hidden="true">
        <label>No completar este campo</label>
        <input type="text" tabIndex={-1} autoComplete="off" value={form.website} onChange={set('website')} />
      </div>

      <button type="submit" className={styles.submit} disabled={sending}>
        {sending ? 'Enviando…' : 'Enviar solicitud'}
      </button>
    </form>
  );
}
