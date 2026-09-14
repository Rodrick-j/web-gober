'use client';

import { useCallback, useEffect, useMemo, useState } from 'react';
import Image from 'next/image';
import { useRouter } from 'next/navigation';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import { revalidateConfig } from './actions';
import styles from './page.module.css';

const INITIAL_SOCIAL = {
  facebook: '',
  twitter: '',
  youtube: '',
  instagram: '',
  tiktok: '',
};

const INITIAL_NOTICE = {
  activo: false,
  imagen_url: '',
  enlace: '',
};

const INITIAL_CONTACT = {
  direccion: '',
  telefono: '',
  call_center: '',
  fax: '',
  whatsapp: '',
  email: '',
  latitud: '',
  longitud: '',
};

const SOCIAL_FIELDS = [
  { key: 'facebook', label: 'Facebook', prefix: 'f', placeholder: 'https://facebook.com/...' },
  { key: 'twitter', label: 'X / Twitter', prefix: 'X', placeholder: 'https://x.com/...' },
  { key: 'youtube', label: 'YouTube', prefix: '▶', placeholder: 'https://youtube.com/@...' },
  { key: 'instagram', label: 'Instagram', prefix: '◎', placeholder: 'https://instagram.com/...' },
  { key: 'tiktok', label: 'TikTok', prefix: '♪', placeholder: 'https://tiktok.com/@...' },
];

function withTimeout(request, milliseconds, message) {
  return new Promise((resolve, reject) => {
    const timeoutId = window.setTimeout(() => reject(new Error(message)), milliseconds);

    Promise.resolve(request).then(
      (result) => {
        window.clearTimeout(timeoutId);
        resolve(result);
      },
      (error) => {
        window.clearTimeout(timeoutId);
        reject(error);
      },
    );
  });
}

function safeObject(value) {
  return value && typeof value === 'object' && !Array.isArray(value) ? value : {};
}

function parseCoordinate(value, type) {
  if (value === '' || value === null || value === undefined) return null;

  const coordinate = Number.parseFloat(String(value));
  const limit = type === 'latitud' ? 90 : 180;

  if (!Number.isFinite(coordinate) || coordinate < -limit || coordinate > limit) {
    throw new Error(`La ${type} ingresada no es válida.`);
  }

  return coordinate;
}

function isValidYouTubeUrl(value) {
  try {
    const url = new URL(value);
    return ['youtube.com', 'www.youtube.com', 'youtu.be', 'm.youtube.com'].includes(url.hostname);
  } catch {
    return false;
  }
}

function SectionIcon({ name }) {
  const paths = {
    video: <><path d="m15 10 4.5-2.5v9L15 14" /><rect x="3" y="6" width="12" height="12" rx="2" /></>,
    ticker: <><path d="M4 7h16M4 12h12M4 17h8" /><path d="m17 15 3 2-3 2" /></>,
    social: <><circle cx="6" cy="12" r="2" /><circle cx="18" cy="6" r="2" /><circle cx="18" cy="18" r="2" /><path d="m8 11 8-4M8 13l8 4" /></>,
    contact: <><path d="M20 10c0 5-8 11-8 11S4 15 4 10a8 8 0 1 1 16 0Z" /><circle cx="12" cy="10" r="2.5" /></>,
    image: <><rect x="3" y="4" width="18" height="16" rx="2" /><circle cx="9" cy="9" r="2" /><path d="m21 15-5-5L5 20" /></>,
    check: <path d="m5 12 4 4L19 6" />,
    alert: <><path d="M12 9v4M12 17h.01" /><path d="M10.3 3.7 2.4 17.4A2 2 0 0 0 4.1 20h15.8a2 2 0 0 0 1.7-2.6L13.7 3.7a2 2 0 0 0-3.4 0Z" /></>,
    refresh: <><path d="M20 6v5h-5" /><path d="M4 18v-5h5" /><path d="M18.5 9A7 7 0 0 0 6.1 6.1L4 8M5.5 15A7 7 0 0 0 17.9 17.9L20 16" /></>,
    save: <><path d="M5 3h12l2 2v16H5Z" /><path d="M8 3v6h8V3M8 21v-8h8v8" /></>,
  };

  return (
    <svg viewBox="0 0 24 24" aria-hidden="true" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      {paths[name] || paths.check}
    </svg>
  );
}

function LoadingState() {
  return (
    <div className={styles.statePage} role="status" aria-live="polite">
      <div className={styles.loaderCard}>
        <div className={styles.loaderMark}>
          <span />
          <span />
          <span />
        </div>
        <div>
          <span className={styles.eyebrow}>Sincronizando sistema</span>
          <h1>Cargando configuración</h1>
          <p>Estamos recuperando los datos del portal institucional.</p>
        </div>
        <div className={styles.progressTrack}><span /></div>
        <div className={styles.skeletonRows} aria-hidden="true">
          <i /><i /><i />
        </div>
      </div>
    </div>
  );
}

export default function ConfiguracionPage() {
  const supabase = useMemo(() => createClient(), []);
  const router = useRouter();

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [loadError, setLoadError] = useState('');
  const [saveError, setSaveError] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const [configSnapshot, setConfigSnapshot] = useState({});

  const [velocidad, setVelocidad] = useState(60);
  const [mensajes, setMensajes] = useState([]);
  const [nuevoMensaje, setNuevoMensaje] = useState('');
  const [redes, setRedes] = useState(INITIAL_SOCIAL);
  const [comunicado, setComunicado] = useState(INITIAL_NOTICE);
  const [comunicadoFile, setComunicadoFile] = useState(null);
  const [contacto, setContacto] = useState(INITIAL_CONTACT);
  const [videosInicio, setVideosInicio] = useState([]);
  const [nuevoVideo, setNuevoVideo] = useState('');
  const [videoError, setVideoError] = useState('');

  const cargarConfiguracion = useCallback(async () => {
    setLoading(true);
    setLoadError('');

    try {
      const { data, error } = await withTimeout(
        supabase.from('configuracion_global').select('clave, valor'),
        12000,
        'La conexión tardó demasiado. Verifica Supabase o tu conexión a internet.',
      );

      if (error) throw new Error(error.message || 'No se pudo leer la configuración.');

      const configs = Object.fromEntries(
        (data || []).map((config) => [config.clave, safeObject(config.valor)]),
      );

      const ticker = configs.ticker_noticias || {};
      const social = configs.redes_sociales || {};
      const notice = configs.comunicado_popup || {};
      const homeVideo = configs.video_inicio || {};
      const officialContact = configs.contacto_oficial || {};

      setConfigSnapshot(configs);
      setVelocidad(ticker.velocidad_segundos || 60);
      setMensajes(Array.isArray(ticker.mensajes) ? ticker.mensajes : []);
      setRedes({
        facebook: social.facebook || '',
        twitter: social.twitter || '',
        youtube: social.youtube || '',
        instagram: social.instagram || '',
        tiktok: social.tiktok || '',
      });
      setComunicado({
        activo: Boolean(notice.activo),
        imagen_url: notice.imagen_url || '',
        enlace: notice.enlace || '',
      });
      setVideosInicio(
        Array.isArray(homeVideo.urls) ? homeVideo.urls : (homeVideo.url ? [homeVideo.url] : []),
      );
      setContacto({
        direccion: officialContact.direccion || '',
        telefono: officialContact.telefono || '',
        call_center: officialContact.call_center || '',
        fax: officialContact.fax || '',
        whatsapp: officialContact.whatsapp || '',
        email: officialContact.email || '',
        latitud: officialContact.latitud ?? '',
        longitud: officialContact.longitud ?? '',
      });
    } catch (error) {
      console.error('[Configuración] Error de carga:', error);
      setLoadError(error.message || 'No fue posible cargar la configuración.');
    } finally {
      setLoading(false);
    }
  }, [supabase]);

  useEffect(() => {
    const startTimer = window.setTimeout(() => {
      void cargarConfiguracion();
    }, 0);

    return () => window.clearTimeout(startTimer);
  }, [cargarConfiguracion]);

  const handleAgregarMensaje = () => {
    const message = nuevoMensaje.trim();
    if (!message || mensajes.includes(message)) return;
    setMensajes((current) => [...current, message]);
    setNuevoMensaje('');
  };

  const handleAgregarVideo = () => {
    const url = nuevoVideo.trim();
    setVideoError('');

    if (!isValidYouTubeUrl(url)) {
      setVideoError('Ingresa un enlace válido de YouTube o youtu.be.');
      return;
    }

    if (videosInicio.includes(url)) {
      setVideoError('Ese video ya está agregado.');
      return;
    }

    setVideosInicio((current) => [...current, url]);
    setNuevoVideo('');
  };

  const handleGuardarTodo = async () => {
    setSaving(true);
    setSaveError('');
    setSuccessMessage('');

    try {
      const parsedSpeed = Math.min(300, Math.max(10, Number.parseInt(velocidad, 10) || 60));
      const latitude = parseCoordinate(contacto.latitud, 'latitud');
      const longitude = parseCoordinate(contacto.longitud, 'longitud');

      let finalImageUrl = comunicado.imagen_url;
      if (comunicadoFile) {
        finalImageUrl = await withTimeout(
          uploadFile(comunicadoFile, 'general'),
          45000,
          'La imagen tardó demasiado en subir. Intenta nuevamente.',
        );
      }

      const rows = [
        {
          clave: 'ticker_noticias',
          valor: { ...safeObject(configSnapshot.ticker_noticias), velocidad_segundos: parsedSpeed, mensajes },
        },
        {
          clave: 'redes_sociales',
          valor: {
            ...safeObject(configSnapshot.redes_sociales),
            ...Object.fromEntries(Object.entries(redes).map(([key, value]) => [key, value.trim()])),
          },
        },
        {
          clave: 'comunicado_popup',
          valor: {
            ...safeObject(configSnapshot.comunicado_popup),
            activo: comunicado.activo,
            imagen_url: finalImageUrl,
            enlace: comunicado.enlace.trim(),
          },
        },
        {
          clave: 'video_inicio',
          valor: { ...safeObject(configSnapshot.video_inicio), urls: videosInicio },
        },
        {
          clave: 'contacto_oficial',
          valor: {
            ...safeObject(configSnapshot.contacto_oficial),
            direccion: contacto.direccion.trim(),
            telefono: contacto.telefono.trim(),
            call_center: contacto.call_center.trim(),
            fax: contacto.fax.trim(),
            whatsapp: contacto.whatsapp.trim(),
            email: contacto.email.trim(),
            latitud: latitude,
            longitud: longitude,
          },
        },
      ];

      const { error } = await withTimeout(
        supabase.from('configuracion_global').upsert(rows, { onConflict: 'clave' }),
        20000,
        'El guardado tardó demasiado. Verifica la conexión e inténtalo otra vez.',
      );

      if (error) throw new Error(error.message || 'No fue posible guardar los cambios.');

      await revalidateConfig();
      setVelocidad(parsedSpeed);
      setComunicado((current) => ({ ...current, imagen_url: finalImageUrl }));
      setComunicadoFile(null);
      setConfigSnapshot((current) => ({
        ...current,
        ...Object.fromEntries(rows.map((row) => [row.clave, row.valor])),
      }));
      setSuccessMessage(`Cambios publicados correctamente a las ${new Intl.DateTimeFormat('es-BO', { hour: '2-digit', minute: '2-digit' }).format(new Date())}.`);
      router.refresh();
    } catch (error) {
      console.error('[Configuración] Error de guardado:', error);
      setSaveError(error.message || 'Ocurrió un error al guardar los cambios.');
    } finally {
      setSaving(false);
    }
  };

  const configuredSocials = Object.values(redes).filter((value) => value.trim()).length;

  if (loading) return <LoadingState />;

  if (loadError) {
    return (
      <div className={styles.statePage}>
        <div className={`${styles.loaderCard} ${styles.errorCard}`} role="alert">
          <span className={styles.stateIcon}><SectionIcon name="alert" /></span>
          <span className={styles.eyebrow}>Conexión interrumpida</span>
          <h1>No pudimos cargar la configuración</h1>
          <p>{loadError}</p>
          <button type="button" className={styles.retryButton} onClick={cargarConfiguracion}>
            <SectionIcon name="refresh" /> Reintentar conexión
          </button>
        </div>
      </div>
    );
  }

  return (
    <main className={`adminPage ${styles.page}`}>
      <header className={styles.hero}>
        <div className={styles.heroCopy}>
          <span className={styles.eyebrow}>Centro de control institucional</span>
          <h1>Configuración global</h1>
          <p>Administra el contenido dinámico, los canales oficiales y los elementos visibles del portal.</p>
        </div>
        <div className={styles.heroActions}>
          <span className={styles.syncBadge}><i /> Sistema conectado</span>
          <button type="button" className={styles.primaryButton} onClick={handleGuardarTodo} disabled={saving}>
            {saving ? <span className={styles.buttonSpinner} /> : <SectionIcon name="save" />}
            {saving ? 'Publicando…' : 'Guardar cambios'}
          </button>
        </div>
      </header>

      {(saveError || successMessage) && (
        <div className={`${styles.feedback} ${saveError ? styles.feedbackError : styles.feedbackSuccess}`} role={saveError ? 'alert' : 'status'}>
          <SectionIcon name={saveError ? 'alert' : 'check'} />
          <span>{saveError || successMessage}</span>
          <button type="button" onClick={() => { setSaveError(''); setSuccessMessage(''); }} aria-label="Cerrar mensaje">×</button>
        </div>
      )}

      <section className={styles.metrics} aria-label="Resumen de configuración">
        <article>
          <span className={`${styles.metricIcon} ${styles.redIcon}`}><SectionIcon name="video" /></span>
          <div><strong>{videosInicio.length}</strong><span>Videos destacados</span></div>
          <em>{videosInicio.length ? 'Configurado' : 'Pendiente'}</em>
        </article>
        <article>
          <span className={`${styles.metricIcon} ${styles.goldIcon}`}><SectionIcon name="ticker" /></span>
          <div><strong>{mensajes.length}</strong><span>Mensajes en vivo</span></div>
          <em>{velocidad}s por vuelta</em>
        </article>
        <article>
          <span className={`${styles.metricIcon} ${styles.greenIcon}`}><SectionIcon name="social" /></span>
          <div><strong>{configuredSocials}/5</strong><span>Redes conectadas</span></div>
          <em>{comunicado.activo ? 'Comunicado activo' : 'Popup inactivo'}</em>
        </article>
      </section>

      <nav className={styles.quickNav} aria-label="Secciones de configuración">
        <span>Ir a</span>
        <a href="#videos"><SectionIcon name="video" /> Videos</a>
        <a href="#ticker"><SectionIcon name="ticker" /> Noticias rápidas</a>
        <a href="#redes"><SectionIcon name="social" /> Redes</a>
        <a href="#contacto"><SectionIcon name="contact" /> Contacto</a>
        <a href="#comunicado"><SectionIcon name="image" /> Imagen emergente</a>
      </nav>

      <div className={styles.contentGrid}>
        <section id="videos" className={styles.panel}>
          <div className={styles.panelHeader}>
            <span className={`${styles.panelIcon} ${styles.redIcon}`}><SectionIcon name="video" /></span>
            <div><span>Portada multimedia</span><h2>Videos destacados</h2><p>Contenido de YouTube que aparece en la página principal.</p></div>
            <b>{videosInicio.length}</b>
          </div>
          <div className={styles.panelBody}>
            <label className={styles.fieldLabel} htmlFor="new-video">Enlace de YouTube</label>
            <div className={styles.addRow}>
              <div className={styles.inputShell}><span>▶</span><input id="new-video" type="url" value={nuevoVideo} onChange={(event) => { setNuevoVideo(event.target.value); setVideoError(''); }} onKeyDown={(event) => { if (event.key === 'Enter') handleAgregarVideo(); }} placeholder="https://youtu.be/..." /></div>
              <button type="button" onClick={handleAgregarVideo} disabled={!nuevoVideo.trim()}>Agregar video</button>
            </div>
            {videoError && <p className={styles.fieldError}>{videoError}</p>}
            <p className={styles.helpText}>Acepta enlaces de youtube.com y youtu.be. Los videos se cargan de forma diferida en el portal.</p>
            <div className={styles.itemList}>
              {videosInicio.length === 0 ? <div className={styles.emptyState}>No hay videos configurados todavía.</div> : videosInicio.map((url, index) => (
                <div className={styles.listItem} key={`${url}-${index}`}>
                  <span className={styles.order}>{String(index + 1).padStart(2, '0')}</span>
                  <div><strong>Video destacado</strong><small title={url}>{url}</small></div>
                  <button type="button" onClick={() => setVideosInicio((current) => current.filter((_, itemIndex) => itemIndex !== index))} aria-label={`Quitar video ${index + 1}`}>Quitar</button>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section id="ticker" className={styles.panel}>
          <div className={styles.panelHeader}>
            <span className={`${styles.panelIcon} ${styles.goldIcon}`}><SectionIcon name="ticker" /></span>
            <div><span>Comunicación inmediata</span><h2>Noticias rápidas</h2><p>Mensajes que recorren la franja informativa EN VIVO.</p></div>
            <b>{mensajes.length}</b>
          </div>
          <div className={styles.panelBody}>
            <div className={styles.speedControl}>
              <div><label className={styles.fieldLabel} htmlFor="ticker-speed">Duración de la vuelta</label><p>{velocidad} segundos · un valor mayor reduce la velocidad.</p></div>
              <input id="ticker-speed" type="number" min="10" max="300" value={velocidad} onChange={(event) => setVelocidad(event.target.value)} />
            </div>
            <label className={styles.fieldLabel} htmlFor="new-message">Nuevo mensaje</label>
            <div className={styles.addRow}>
              <div className={styles.inputShell}><span>●</span><input id="new-message" type="text" value={nuevoMensaje} onChange={(event) => setNuevoMensaje(event.target.value)} onKeyDown={(event) => { if (event.key === 'Enter') handleAgregarMensaje(); }} placeholder="Escribe un anuncio institucional…" maxLength={220} /></div>
              <button type="button" onClick={handleAgregarMensaje} disabled={!nuevoMensaje.trim()}>Agregar mensaje</button>
            </div>
            <div className={styles.itemList}>
              {mensajes.length === 0 ? <div className={styles.emptyState}>No hay mensajes activos.</div> : mensajes.map((message, index) => (
                <div className={styles.listItem} key={`${message}-${index}`}>
                  <span className={`${styles.order} ${styles.liveDot}`}>●</span>
                  <div><strong>Mensaje {index + 1}</strong><small>{message}</small></div>
                  <button type="button" onClick={() => setMensajes((current) => current.filter((_, itemIndex) => itemIndex !== index))} aria-label={`Quitar mensaje ${index + 1}`}>Quitar</button>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section id="redes" className={`${styles.panel} ${styles.widePanel}`}>
          <div className={styles.panelHeader}>
            <span className={`${styles.panelIcon} ${styles.greenIcon}`}><SectionIcon name="social" /></span>
            <div><span>Canales verificados</span><h2>Redes sociales institucionales</h2><p>Centraliza los enlaces oficiales que se muestran en el sitio público.</p></div>
            <b>{configuredSocials}/5</b>
          </div>
          <div className={`${styles.panelBody} ${styles.socialGrid}`}>
            {SOCIAL_FIELDS.map((network) => (
              <label className={styles.socialField} key={network.key}>
                <span className={`${styles.socialLogo} ${styles[network.key]}`}>{network.prefix}</span>
                <span className={styles.socialCopy}><strong>{network.label}</strong><small>{redes[network.key] ? 'Canal conectado' : 'Sin configurar'}</small></span>
                <input type="url" value={redes[network.key]} onChange={(event) => setRedes((current) => ({ ...current, [network.key]: event.target.value }))} placeholder={network.placeholder} aria-label={`URL de ${network.label}`} />
              </label>
            ))}
          </div>
        </section>

        <section id="contacto" className={`${styles.panel} ${styles.widePanel}`}>
          <div className={styles.panelHeader}>
            <span className={`${styles.panelIcon} ${styles.blueIcon}`}><SectionIcon name="contact" /></span>
            <div><span>Información ciudadana</span><h2>Contacto oficial</h2><p>Datos públicos de ubicación y atención conforme a la RM 067/2025.</p></div>
            <em>Datos públicos</em>
          </div>
          <div className={`${styles.panelBody} ${styles.formGrid}`}>
            <label className={styles.fullField}><span>Dirección principal</span><input type="text" value={contacto.direccion} onChange={(event) => setContacto((current) => ({ ...current, direccion: event.target.value }))} placeholder="Calle Presidente Montes, entre Bolívar y Adolfo Mier, Oruro" /></label>
            <label><span>Teléfono</span><input type="tel" value={contacto.telefono} onChange={(event) => setContacto((current) => ({ ...current, telefono: event.target.value }))} placeholder="(591-2) 5270-000" /></label>
            <label><span>Línea gratuita</span><input type="tel" value={contacto.call_center} onChange={(event) => setContacto((current) => ({ ...current, call_center: event.target.value }))} placeholder="800-10-XXXX" /></label>
            <label><span>Fax</span><input type="tel" value={contacto.fax} onChange={(event) => setContacto((current) => ({ ...current, fax: event.target.value }))} placeholder="(591-2) 5270-001" /></label>
            <label><span>WhatsApp</span><input type="tel" value={contacto.whatsapp} onChange={(event) => setContacto((current) => ({ ...current, whatsapp: event.target.value }))} placeholder="+591 7XXXXXXX" /></label>
            <label><span>Correo electrónico</span><input type="email" value={contacto.email} onChange={(event) => setContacto((current) => ({ ...current, email: event.target.value }))} placeholder="contacto@oruro.gob.bo" /></label>
            <label><span>Latitud del mapa</span><input type="number" step="any" value={contacto.latitud} onChange={(event) => setContacto((current) => ({ ...current, latitud: event.target.value }))} placeholder="-17.9695" /></label>
            <label><span>Longitud del mapa</span><input type="number" step="any" value={contacto.longitud} onChange={(event) => setContacto((current) => ({ ...current, longitud: event.target.value }))} placeholder="-67.1151" /></label>
          </div>
        </section>

        <section id="comunicado" className={`${styles.panel} ${styles.widePanel} ${styles.noticePanel}`}>
          <div className={styles.panelHeader}>
            <span className={`${styles.panelIcon} ${styles.redIcon}`}><SectionIcon name="image" /></span>
            <div><span>Contenido visual prioritario</span><h2>Imagen emergente de inicio</h2><p>Gestiona el comunicado que recibe al ciudadano al ingresar al portal.</p></div>
            <button type="button" role="switch" aria-checked={comunicado.activo} className={`${styles.switch} ${comunicado.activo ? styles.switchActive : ''}`} onClick={() => setComunicado((current) => ({ ...current, activo: !current.activo }))}><i /><span>{comunicado.activo ? 'Activo' : 'Inactivo'}</span></button>
          </div>
          <div className={`${styles.panelBody} ${styles.noticeGrid}`}>
            <div className={styles.uploadColumn}>
              <div className={styles.noticeInfo}><strong>Recomendación de imagen</strong><p>Usa formato WebP, JPG o PNG, composición vertical u horizontal y un peso menor a 5 MB.</p></div>
              <FileUpload onFileSelect={setComunicadoFile} accept="image/*" label="Seleccionar nueva imagen" icon="＋" maxSizeMB={5} />
              <label className={styles.linkField}><span>Enlace al hacer clic <small>Opcional</small></span><input type="url" value={comunicado.enlace} onChange={(event) => setComunicado((current) => ({ ...current, enlace: event.target.value }))} placeholder="https://..." /></label>
            </div>
            <div className={styles.currentPreview}>
              <div className={styles.previewHeader}><div><span>Vista publicada</span><strong>{comunicado.imagen_url ? 'Imagen actual' : 'Sin imagen'}</strong></div><em className={comunicado.activo ? styles.activeStatus : styles.inactiveStatus}><i />{comunicado.activo ? 'Visible en inicio' : 'No visible'}</em></div>
              <div className={styles.previewFrame}>
                {comunicado.imagen_url ? <Image src={comunicado.imagen_url} alt="Vista previa del comunicado actual" fill sizes="(max-width: 900px) 100vw, 42vw" priority={false} /> : <div className={styles.emptyPreview}><SectionIcon name="image" /><strong>No existe una imagen publicada</strong><span>Selecciona un archivo para preparar el comunicado.</span></div>}
                {comunicado.imagen_url && <span className={styles.previewLabel}>Portal institucional · Inicio</span>}
              </div>
            </div>
          </div>
        </section>
      </div>

      <footer className={styles.saveBar}>
        <div><span className={styles.savePulse} /><p><strong>Configuración centralizada</strong><small>Los cambios se reflejarán en el portal después de guardar.</small></p></div>
        <button type="button" className={styles.primaryButton} onClick={handleGuardarTodo} disabled={saving}>
          {saving ? <span className={styles.buttonSpinner} /> : <SectionIcon name="save" />}
          {saving ? 'Publicando cambios…' : 'Guardar y publicar'}
        </button>
      </footer>
    </main>
  );
}
