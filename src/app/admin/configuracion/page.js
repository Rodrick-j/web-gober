'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useRouter } from 'next/navigation';

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
