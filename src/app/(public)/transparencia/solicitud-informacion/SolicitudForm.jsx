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
      <div className={styles.successCard} role="status">
        <div className={styles.successIcon}>
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
            <path d="M22 11.1V12a10 10 0 1 1-5.9-9.1" />
            <path d="m9 11 3 3L22 4" />
          </svg>
        </div>
        <h2>Solicitud registrada</h2>
        <p>
          Su solicitud de información fue recibida correctamente. La Unidad de Transparencia
          y Lucha Contra la Corrupción dará respuesta a través del correo o teléfono
          proporcionado, conforme a los plazos establecidos en la normativa de acceso a la
          información pública.
        </p>
        <button type="button" onClick={() => setDone(false)} className={styles.newRequest}>
          Realizar otra solicitud
        </button>
      </div>
    );
  }

  return (
    <form className={styles.card} onSubmit={handleSubmit} noValidate>
      <div className={styles.formHeader}>
        <span>Formulario oficial</span>
        <h2>Datos de la solicitud</h2>
        <p>Los campos marcados con <strong>*</strong> son obligatorios.</p>
      </div>

      {error && <div className={styles.error} role="alert">{error}</div>}

      <div className={styles.group}>
        <label htmlFor="solicitud-nombre">Nombre completo <span className={styles.req}>*</span></label>
        <input id="solicitud-nombre" type="text" value={form.nombre} onChange={set('nombre')} required maxLength={150} autoComplete="name" placeholder="Ej. María López Quispe" />
      </div>

      <div className={styles.row}>
        <div className={styles.group}>
          <label htmlFor="solicitud-documento">Cédula de Identidad / NIT</label>
          <input id="solicitud-documento" type="text" value={form.documento_id} onChange={set('documento_id')} maxLength={30} placeholder="Número de documento" />
        </div>
        <div className={styles.group}>
          <label htmlFor="solicitud-telefono">Teléfono / celular</label>
          <input id="solicitud-telefono" type="tel" value={form.telefono} onChange={set('telefono')} maxLength={30} autoComplete="tel" placeholder="Ej. 71234567" />
        </div>
      </div>

      <div className={styles.group}>
        <label htmlFor="solicitud-email">Correo electrónico</label>
        <input id="solicitud-email" type="email" value={form.email} onChange={set('email')} maxLength={150} autoComplete="email" placeholder="nombre@correo.com" />
      </div>

      <div className={styles.group}>
        <label htmlFor="solicitud-asunto">Asunto <span className={styles.req}>*</span></label>
        <input id="solicitud-asunto" type="text" value={form.asunto} onChange={set('asunto')} required maxLength={200} placeholder="Resume brevemente tu solicitud" />
      </div>

      <div className={styles.group}>
        <label htmlFor="solicitud-detalle">Detalle de la información solicitada <span className={styles.req}>*</span></label>
        <textarea id="solicitud-detalle" rows={6} value={form.detalle} onChange={set('detalle')} required maxLength={4000} placeholder="Describe de forma clara qué información o documentos necesitas..." />
      </div>

      {/* Honeypot: oculto para personas, tentador para bots */}
      <div className={styles.honey} aria-hidden="true">
        <label>No completar este campo</label>
        <input type="text" tabIndex={-1} autoComplete="off" value={form.website} onChange={set('website')} />
      </div>

      <button type="submit" className={styles.submit} disabled={sending}>
        {sending ? 'Enviando…' : 'Enviar solicitud'}
        {!sending && (
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
            <path d="m22 2-7 20-4-9-9-4Z" /><path d="M22 2 11 13" />
          </svg>
        )}
      </button>

      <p className={styles.privacyNote}>
        Tus datos serán utilizados únicamente para gestionar y responder esta solicitud.
      </p>
    </form>
  );
}
