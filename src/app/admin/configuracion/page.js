'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useRouter } from 'next/navigation';
import { uploadFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import Image from 'next/image';
import { revalidateConfig } from './actions';

export default function ConfiguracionPage() {
  const supabase = createClient();
  const router = useRouter();
  
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  
  // Estado para el Ticker
  const [velocidad, setVelocidad] = useState(60);
  const [mensajes, setMensajes] = useState([]);
  const [nuevoMensaje, setNuevoMensaje] = useState('');

  // Estado para Redes Sociales
  const [redes, setRedes] = useState({
    facebook: '',
    twitter: '',
    youtube: '',
    instagram: '',
    tiktok: ''
  });

  // Estado para Comunicado Popup
  const [comunicado, setComunicado] = useState({
    activo: false,
    imagen_url: '',
    enlace: ''
  });
  const [comunicadoFile, setComunicadoFile] = useState(null);

  useEffect(() => {
    async function cargarConfiguracion() {
      const { data, error } = await supabase
        .from('configuracion_global')
        .select('*');

      if (data && !error) {
        data.forEach(config => {
          if (config.clave === 'ticker_noticias') {
            setVelocidad(config.valor.velocidad_segundos || 60);
            setMensajes(config.valor.mensajes || []);
          }
          if (config.clave === 'redes_sociales') {
            setRedes({
              facebook: config.valor.facebook || '',
              twitter: config.valor.twitter || '',
              youtube: config.valor.youtube || '',
              instagram: config.valor.instagram || '',
              tiktok: config.valor.tiktok || ''
            });
          }
          if (config.clave === 'comunicado_popup') {
            setComunicado({
              activo: config.valor.activo || false,
              imagen_url: config.valor.imagen_url || '',
              enlace: config.valor.enlace || ''
            });
          }
        });
      }
      setLoading(false);
    }
    cargarConfiguracion();
  }, []);

  const handleAgregarMensaje = () => {
    if (nuevoMensaje.trim()) {
      setMensajes([...mensajes, nuevoMensaje.trim()]);
      setNuevoMensaje('');
    }
  };

  const handleQuitarMensaje = (index) => {
    const nuevos = [...mensajes];
    nuevos.splice(index, 1);
    setMensajes(nuevos);
  };

  const handleGuardarTodo = async () => {
    setSaving(true);
    
    const tickerData = {
      velocidad_segundos: parseInt(velocidad),
      mensajes
    };

    const redesData = {
      facebook: redes.facebook.trim(),
      twitter: redes.twitter.trim(),
      youtube: redes.youtube.trim(),
      instagram: redes.instagram.trim(),
      tiktok: redes.tiktok.trim()
    };

    // Upsert Ticker
    await supabase.from('configuracion_global').upsert({
      clave: 'ticker_noticias',
      valor: tickerData
    });

    // Upsert Redes
    await supabase.from('configuracion_global').upsert({
      clave: 'redes_sociales',
      valor: redesData
    });

    // Subir imagen del comunicado si existe nueva
    let finalComunicadoImgUrl = comunicado.imagen_url;
    if (comunicadoFile) {
      try {
        finalComunicadoImgUrl = await uploadFile(comunicadoFile, 'general');
      } catch (err) {
        console.error("Error subiendo imagen del comunicado", err);
        alert('Error al subir la imagen del comunicado.');
      }
    }

    const comunicadoData = {
      activo: comunicado.activo,
      imagen_url: finalComunicadoImgUrl,
      enlace: comunicado.enlace
    };

    // Upsert Comunicado
    await supabase.from('configuracion_global').upsert({
      clave: 'comunicado_popup',
      valor: comunicadoData
    });

    // Limpiar caché de Next.js para reflejar los cambios en público inmediatamente
    await revalidateConfig();

    setSaving(false);
    alert('Configuración guardada exitosamente.');
    router.refresh();
  };

  if (loading) {
    return <div className="adminPage" style={{ padding: '2rem' }}>Cargando configuración...</div>;
  }

  return (
    <div className="adminPage">
      <div className="adminHeader" style={{ marginBottom: '2rem' }}>
        <h1 className="adminTitle">Configuración Global</h1>
        <p className="adminSubtitle">Administra los textos, velocidades y enlaces de toda la web.</p>
      </div>

      <div style={{ display: 'flex', flexDirection: 'column', gap: '2rem' }}>
        
        {/* Ticker Section */}
        <div className="tableCard" style={{ padding: '2rem' }}>
          <h2 style={{ marginBottom: '1rem', borderBottom: '1px solid #eee', paddingBottom: '0.5rem' }}>
            Noticias Rápidas (Texto Recorrido EN VIVO)
          </h2>
          
          <div style={{ marginBottom: '1.5rem' }}>
            <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.5rem' }}>
              Velocidad de Animación (Segundos por vuelta)
            </label>
            <input 
              type="number" 
              className="input" 
              value={velocidad} 
              onChange={(e) => setVelocidad(e.target.value)}
              min="10" max="300"
              style={{ width: '150px', padding: '0.5rem' }}
            />
            <p style={{ fontSize: '0.8rem', color: '#666', marginTop: '0.5rem' }}>
              * A mayor número, más <strong>lento</strong> irá el texto. Actualmente está en {velocidad} segundos.
            </p>
          </div>

          <div>
            <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.5rem' }}>
              Mensajes Activos
            </label>
            <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1rem' }}>
              <input 
                type="text" 
                className="input" 
                placeholder="Ej: 🔴 HOY INAUGURACIÓN DEL HOSPITAL DE TERCER NIVEL"
                value={nuevoMensaje}
                onChange={(e) => setNuevoMensaje(e.target.value)}
                onKeyDown={(e) => { if(e.key === 'Enter') handleAgregarMensaje() }}
                style={{ flex: 1, padding: '0.5rem' }}
              />
              <button type="button" onClick={handleAgregarMensaje} className="btnPrimary" style={{ padding: '0.5rem 1rem' }}>
                Agregar
              </button>
            </div>

            <ul style={{ listStyle: 'none', padding: 0, display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
              {mensajes.length === 0 && <li style={{ color: '#999' }}>No hay mensajes configurados.</li>}
              {mensajes.map((msj, index) => (
                <li key={index} style={{ display: 'flex', justifyContent: 'space-between', background: '#f5f5f5', padding: '0.5rem 1rem', borderRadius: '4px' }}>
                  <span>{msj}</span>
                  <button type="button" onClick={() => handleQuitarMensaje(index)} style={{ color: 'red', background: 'none', border: 'none', cursor: 'pointer', fontWeight: 'bold' }}>
                    ✕ Quitar
                  </button>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Redes Sociales Section */}
        <div className="tableCard" style={{ padding: '2rem' }}>
          <h2 style={{ marginBottom: '1rem', borderBottom: '1px solid #eee', paddingBottom: '0.5rem' }}>
            Redes Sociales Institucionales
          </h2>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.25rem' }}>Facebook URL</label>
              <input 
                type="text" 
                className="input" 
                value={redes.facebook} 
                onChange={(e) => setRedes({...redes, facebook: e.target.value})}
                placeholder="https://facebook.com/..."
                style={{ width: '100%', maxWidth: '500px', padding: '0.5rem' }}
              />
            </div>
            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.25rem' }}>Twitter / X URL</label>
              <input 
                type="text" 
                className="input" 
                value={redes.twitter} 
                onChange={(e) => setRedes({...redes, twitter: e.target.value})}
                placeholder="https://x.com/..."
                style={{ width: '100%', maxWidth: '500px', padding: '0.5rem' }}
              />
            </div>
            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.25rem' }}>YouTube URL</label>
              <input 
                type="text" 
                className="input" 
                value={redes.youtube} 
                onChange={(e) => setRedes({...redes, youtube: e.target.value})}
                placeholder="https://youtube.com/..."
                style={{ width: '100%', maxWidth: '500px', padding: '0.5rem' }}
              />
            </div>
            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.25rem' }}>Instagram URL</label>
              <input 
                type="text" 
                className="input" 
                value={redes.instagram} 
                onChange={(e) => setRedes({...redes, instagram: e.target.value})}
                placeholder="https://instagram.com/..."
                style={{ width: '100%', maxWidth: '500px', padding: '0.5rem' }}
              />
            </div>
            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.25rem' }}>TikTok URL</label>
              <input 
                type="text" 
                className="input" 
                value={redes.tiktok} 
                onChange={(e) => setRedes({...redes, tiktok: e.target.value})}
                placeholder="https://tiktok.com/..."
                style={{ width: '100%', maxWidth: '500px', padding: '0.5rem' }}
              />
            </div>
          </div>
        </div>

        {/* Comunicado Emergente Section */}
        <div className="tableCard" style={{ padding: '2rem' }}>
          <h2 style={{ marginBottom: '1rem', borderBottom: '1px solid #eee', paddingBottom: '0.5rem' }}>
            Comunicado Emergente (Popup de Inicio)
          </h2>
          <p style={{ fontSize: '0.85rem', color: '#666', marginBottom: '1.5rem' }}>
            Esta imagen aparecerá en el centro de la pantalla la primera vez que un usuario entre a la página principal.
          </p>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
            
            <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
              <label style={{ fontWeight: 'bold' }}>¿Activar Comunicado?</label>
              <button 
                type="button"
                onClick={() => setComunicado({...comunicado, activo: !comunicado.activo})}
                style={{
                  background: comunicado.activo ? 'var(--color-primary)' : '#ccc',
                  color: 'white',
                  border: 'none',
                  padding: '0.5rem 1rem',
                  borderRadius: '20px',
                  cursor: 'pointer',
                  fontWeight: 'bold',
                  transition: 'background 0.3s'
                }}
              >
                {comunicado.activo ? 'SÍ, ACTIVADO' : 'NO, DESACTIVADO'}
              </button>
            </div>

            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.25rem' }}>Enlace Opcional (URL)</label>
              <input 
                type="text" 
                className="input" 
                value={comunicado.enlace} 
                onChange={(e) => setComunicado({...comunicado, enlace: e.target.value})}
                placeholder="Ej: https://youtube.com/... (Dejar en blanco si no tiene link)"
                style={{ width: '100%', maxWidth: '500px', padding: '0.5rem' }}
              />
            </div>

            <div>
              <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.5rem' }}>Imagen del Comunicado</label>
              <div style={{ display: 'flex', gap: '2rem', flexWrap: 'wrap' }}>
                <div style={{ flex: '1', minWidth: '250px', maxWidth: '400px' }}>
                  <FileUpload 
                    onFileSelect={setComunicadoFile} 
                    accept="image/*"
                    label="Cambiar o subir imagen"
                  />
                </div>
                {comunicado.imagen_url && !comunicadoFile && (
                  <div style={{ position: 'relative', width: '250px', height: '200px', border: '1px solid #ccc', borderRadius: '8px', overflow: 'hidden' }}>
                    <Image 
                      src={comunicado.imagen_url} 
                      alt="Comunicado actual" 
                      fill 
                      style={{ objectFit: 'contain', background: '#f5f5f5' }} 
                    />
                    <div style={{ position: 'absolute', bottom: 0, left: 0, right: 0, background: 'rgba(0,0,0,0.5)', color: 'white', fontSize: '0.75rem', padding: '0.25rem', textAlign: 'center' }}>
                      Imagen Actual Activa
                    </div>
                  </div>
                )}
              </div>
            </div>

          </div>
        </div>

        {/* Submit Button */}
        <div>
          <button 
            type="button" 
            onClick={handleGuardarTodo}
            disabled={saving}
            className="btnPrimary" 
            style={{ padding: '1rem 3rem', fontSize: '1.1rem' }}
          >
            {saving ? 'Guardando Cambios...' : '💾 Guardar Todo'}
          </button>
        </div>

      </div>
    </div>
  );
}
