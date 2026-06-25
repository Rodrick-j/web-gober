'use client';

import { useState, useEffect, use } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import Link from 'next/link';
import { uploadFile, deleteFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';

export default function EditarSecretariaPage({ params }) {
  const router = useRouter();
  const supabase = createClient();
  const { id } = use(params);
  
  const [activeTab, setActiveTab] = useState('identidad');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [formData, setFormData] = useState({
    nombre: '', nombre_corto: '', descripcion: '', mision: '', vision: '',
    secretario_nombre: '', secretario_cargo: 'Secretario/a Departamental',
    secretario_bio: '', color_acento: '#8B0000', icono: '🏛️',
    telefono: '', email: '', direccion: '', horario: 'Lunes a Viernes: 8:00 - 16:00'
  });
  const [fotoUrl, setFotoUrl] = useState('');
  const [bannerUrl, setBannerUrl] = useState('');
  const [videoUrl, setVideoUrl] = useState('');

  useEffect(() => {
    async function fetchSecretaria() {
      const { data, error } = await supabase.from('secretarias').select('*').eq('id', id).single();
      if (data && !error) {
        setFormData({
          nombre: data.nombre || '', nombre_corto: data.nombre_corto || '',
          descripcion: data.descripcion || '', mision: data.mision || '',
          vision: data.vision || '', secretario_nombre: data.secretario_nombre || '',
          secretario_cargo: data.secretario_cargo || 'Secretario/a Departamental',
          secretario_bio: data.secretario_bio || '', color_acento: data.color_acento || '#8B0000',
          icono: data.icono || '🏛️', telefono: data.telefono || '',
          email: data.email || '', direccion: data.direccion || '',
          horario: data.horario || 'Lunes a Viernes: 8:00 - 16:00'
        });
        setFotoUrl(data.secretario_foto_url || '');
        setBannerUrl(data.banner_url || '');
        setVideoUrl(data.video_url || '');
      } else {
        alert('Error cargando la secretaría');
      }
      setLoading(false);
    }
    fetchSecretaria();
  }, [id]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSave = async (e) => {
    e.preventDefault();
    setSaving(true);
    const { error } = await supabase.from('secretarias').update({
      ...formData, secretario_foto_url: fotoUrl, banner_url: bannerUrl, video_url: videoUrl, updated_at: new Date()
    }).eq('id', id);
    setSaving(false);
    if (error) { alert('Error guardando los cambios: ' + error.message); }
    else { router.push('/admin/secretarias'); router.refresh(); }
  };

  const [uploadingFoto, setUploadingFoto] = useState(false);
  const [uploadingBanner, setUploadingBanner] = useState(false);

  const handleUploadFoto = async (file) => {
    try {
      setUploadingFoto(true);
      if (fotoUrl) await deleteFile(fotoUrl);
      const url = await uploadFile(file, 'secretarios');
      setFotoUrl(url);
    } catch (err) {
      alert('Error al subir la foto: ' + err.message);
    } finally {
      setUploadingFoto(false);
    }
  };
  const handleRemoveFoto = async () => {
    if (fotoUrl) { await deleteFile(fotoUrl); setFotoUrl(''); }
  };
  const handleUploadBanner = async (file) => {
    try {
      setUploadingBanner(true);
      if (bannerUrl) await deleteFile(bannerUrl);
      const url = await uploadFile(file, 'banners');
      setBannerUrl(url);
    } catch (err) {
      alert('Error al subir el banner: ' + err.message);
    } finally {
      setUploadingBanner(false);
    }
  };
  const handleRemoveBanner = async () => {
    if (bannerUrl) { await deleteFile(bannerUrl); setBannerUrl(''); }
  };

  const [uploadingVideo, setUploadingVideo] = useState(false);
  const handleUploadVideo = async (file) => {
    try {
      setUploadingVideo(true);
      if (videoUrl && !videoUrl.includes('youtube.com') && !videoUrl.includes('youtu.be')) {
        await deleteFile(videoUrl);
      }
      const url = await uploadFile(file, 'videos');
      setVideoUrl(url);
    } catch (err) {
      alert('Error al subir el video: ' + err.message);
    } finally {
      setUploadingVideo(false);
    }
  };
  const handleRemoveVideo = async () => {
    if (videoUrl && !videoUrl.includes('youtube.com') && !videoUrl.includes('youtu.be')) {
      await deleteFile(videoUrl);
    }
    setVideoUrl('');
  };

  if (loading) {
    return (
      <div style={{ padding: '2rem', color: 'var(--admin-text-muted)', fontFamily: 'Inter, sans-serif' }}>
        Cargando datos de la Secretaría...
      </div>
    );
  }

  const tabStyle = (tab) => ({
    padding: '0.7rem 1.25rem', background: 'none', border: 'none',
    borderBottom: activeTab === tab ? '2px solid var(--admin-primary)' : '2px solid transparent',
    color: activeTab === tab ? '#FCA5A5' : 'var(--admin-text-muted)',
    fontWeight: activeTab === tab ? 700 : 500, cursor: 'pointer',
    transition: 'all 0.2s', fontFamily: 'Outfit, sans-serif', fontSize: '0.875rem', whiteSpace: 'nowrap',
  });

  return (
    <div style={{ maxWidth: '1100px', display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
      <div>
        <Link href="/admin/secretarias" style={{ color: 'var(--admin-text-muted)', textDecoration: 'none', fontSize: '0.8rem', display: 'inline-flex', alignItems: 'center', gap: '0.4rem', marginBottom: '0.75rem' }}>
          ← Volver a Secretarías
        </Link>
        <h1 style={{ fontFamily: "'Outfit',sans-serif", fontSize: '1.35rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
          Editar: {formData.nombre_corto}
        </h1>
        <p style={{ color: 'var(--admin-text-muted)', marginTop: '0.25rem', fontSize: '0.8rem' }}>
          Modifica la información visible en la página pública de esta Secretaría.
        </p>
      </div>

      <form onSubmit={handleSave} style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', overflow: 'hidden' }}>

        {/* Tabs */}
        <div style={{ display: 'flex', borderBottom: '1px solid var(--admin-border)', padding: '0 1.5rem', background: 'var(--admin-surface-2)' }}>
          <button type="button" onClick={() => setActiveTab('identidad')} style={tabStyle('identidad')}>🎨 Identidad</button>
          <button type="button" onClick={() => setActiveTab('autoridad')} style={tabStyle('autoridad')}>👔 Autoridad</button>
          <button type="button" onClick={() => setActiveTab('contacto')} style={tabStyle('contacto')}>📞 Contacto</button>
        </div>

        <div style={{ padding: '2rem' }}>

          {activeTab === 'identidad' && (
            <div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }}>
                <div className="formGroup">
                  <label className="formLabel">Nombre Completo</label>
                  <input type="text" name="nombre" value={formData.nombre} onChange={handleInputChange} className="formInput" required />
                </div>
                <div className="formGroup">
                  <label className="formLabel">Nombre Corto (Menú)</label>
                  <input type="text" name="nombre_corto" value={formData.nombre_corto} onChange={handleInputChange} className="formInput" required />
                </div>
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: '100px 160px 1fr', gap: '1.5rem', marginTop: '1rem' }}>
                <div className="formGroup">
                  <label className="formLabel">Ícono</label>
                  <input type="text" name="icono" value={formData.icono} onChange={handleInputChange} className="formInput" style={{ fontSize: '1.5rem', textAlign: 'center' }} />
                </div>
                <div className="formGroup">
                  <label className="formLabel">Color Acento</label>
                  <input type="color" name="color_acento" value={formData.color_acento} onChange={handleInputChange} className="formInput" style={{ height: '44px', padding: '2px 6px', cursor: 'pointer' }} />
                </div>
                <div className="formGroup">
                  <label className="formLabel">Banner (Cabecera)</label>
                  {bannerUrl && (
                    <div style={{ marginBottom: '1rem', position: 'relative' }}>
                      <img src={bannerUrl} alt="Banner Actual" style={{ width: '100%', borderRadius: '8px', border: '1px solid var(--admin-border)' }} />
                      <button type="button" onClick={handleRemoveBanner} style={{ position: 'absolute', top: '5px', right: '5px', background: 'rgba(255,0,0,0.8)', color: 'white', border: 'none', borderRadius: '4px', padding: '0.2rem 0.5rem', cursor: 'pointer', fontSize: '0.75rem' }}>Quitar</button>
                    </div>
                  )}
                  {uploadingBanner ? (
                    <p style={{ color: 'var(--admin-primary)', fontWeight: 'bold' }}>Subiendo banner...</p>
                  ) : (
                    <FileUpload onFileSelect={handleUploadBanner} label="Banner apaisado" />
                  )}
                </div>
              </div>
              <div className="formGroup" style={{ marginTop: '1rem' }}>
                <label className="formLabel">URL de Video de YouTube O Archivo .MP4 Local</label>
                
                {videoUrl && videoUrl.includes('.mp4') && !videoUrl.includes('youtube') && (
                  <div style={{ marginBottom: '1rem', position: 'relative' }}>
                    <video src={videoUrl} style={{ width: '100%', borderRadius: '8px', border: '1px solid var(--admin-border)' }} controls />
                    <button type="button" onClick={handleRemoveVideo} style={{ position: 'absolute', top: '5px', right: '5px', background: 'rgba(255,0,0,0.8)', color: 'white', border: 'none', borderRadius: '4px', padding: '0.2rem 0.5rem', cursor: 'pointer', fontSize: '0.75rem', zIndex: 10 }}>Quitar Video Subido</button>
                  </div>
                )}

                <div style={{ display: 'flex', gap: '1rem', flexDirection: 'column' }}>
                  <input 
                    type="text" 
                    value={videoUrl} 
                    onChange={(e) => setVideoUrl(e.target.value)} 
                    className="formInput" 
                    placeholder="Ej: https://www.youtube.com/watch?v=XXXXXXX" 
                  />
                  <div style={{ textAlign: 'center', fontWeight: 'bold' }}>O SUBE TU ARCHIVO MP4 DIRECTAMENTE:</div>
                  {uploadingVideo ? (
                    <p style={{ color: 'var(--admin-primary)', fontWeight: 'bold' }}>Subiendo video... esto puede tardar un momento (Max 50MB).</p>
                  ) : (
                    <FileUpload onFileSelect={handleUploadVideo} label="Subir Video MP4 (Máx 50MB)" accept="video/mp4" maxSizeMB={50} />
                  )}
                </div>

                <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', marginTop: '0.4rem' }}>
                  <strong>Importante:</strong> YouTube siempre mostrará botones si tu navegador bloquea el autoplay. Para tener un fondo 100% limpio sin íconos, <strong>sube el archivo .mp4 usando el botón de arriba</strong>.
                </p>
              </div>
              <div className="formGroup" style={{ marginTop: '1rem' }}>
                <label className="formLabel">Descripción Corta</label>
                <textarea name="descripcion" value={formData.descripcion} onChange={handleInputChange} className="formInput" rows={2} />
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem', marginTop: '1rem' }}>
                <div className="formGroup">
                  <label className="formLabel">Misión</label>
                  <textarea name="mision" value={formData.mision} onChange={handleInputChange} className="formInput" rows={4} />
                </div>
                <div className="formGroup">
                  <label className="formLabel">Visión</label>
                  <textarea name="vision" value={formData.vision} onChange={handleInputChange} className="formInput" rows={4} />
                </div>
              </div>
            </div>
          )}

          {activeTab === 'autoridad' && (
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '2rem' }}>
              <div>
                <div className="formGroup" style={{ marginBottom: '1.25rem' }}>
                  <label className="formLabel">Nombre del Secretario/a</label>
                  <input type="text" name="secretario_nombre" value={formData.secretario_nombre} onChange={handleInputChange} className="formInput" placeholder="Ej: Lic. Juan Pérez" />
                </div>
                <div className="formGroup" style={{ marginBottom: '1.25rem' }}>
                  <label className="formLabel">Cargo Oficial</label>
                  <input type="text" name="secretario_cargo" value={formData.secretario_cargo} onChange={handleInputChange} className="formInput" />
                </div>
                <div className="formGroup">
                  <label className="formLabel">Biografía / Mensaje</label>
                  <textarea name="secretario_bio" value={formData.secretario_bio} onChange={handleInputChange} className="formInput" rows={5} />
                </div>
              </div>
              <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', background: 'var(--admin-surface-2)', padding: '2rem', borderRadius: '12px', border: '1px dashed var(--admin-border)' }}>
                <label className="formLabel" style={{ textAlign: 'center', marginBottom: '1rem' }}>Fotografía Oficial</label>
                {fotoUrl && (
                  <div style={{ marginBottom: '1rem', position: 'relative' }}>
                    <img src={fotoUrl} alt="Foto Actual" style={{ width: '150px', height: '150px', objectFit: 'cover', borderRadius: '50%', border: '2px solid var(--admin-border)' }} />
                    <button type="button" onClick={handleRemoveFoto} style={{ position: 'absolute', bottom: '0', right: '0', background: 'rgba(255,0,0,0.8)', color: 'white', border: 'none', borderRadius: '50%', width: '25px', height: '25px', cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>✕</button>
                  </div>
                )}
                {uploadingFoto ? (
                  <p style={{ color: 'var(--admin-primary)', fontWeight: 'bold' }}>Subiendo foto...</p>
                ) : (
                  <FileUpload onFileSelect={handleUploadFoto} label="Fotografía retrato" />
                )}
              </div>
            </div>
          )}

          {activeTab === 'contacto' && (
            <div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }}>
                <div className="formGroup">
                  <label className="formLabel">Teléfono(s)</label>
                  <input type="text" name="telefono" value={formData.telefono} onChange={handleInputChange} className="formInput" placeholder="(2) 5270-000" />
                </div>
                <div className="formGroup">
                  <label className="formLabel">Correo Electrónico Institucional</label>
                  <input type="email" name="email" value={formData.email} onChange={handleInputChange} className="formInput" placeholder="secretaria@oruro.gob.bo" />
                </div>
              </div>
              <div className="formGroup" style={{ marginTop: '1.25rem' }}>
                <label className="formLabel">Dirección Física</label>
                <input type="text" name="direccion" value={formData.direccion} onChange={handleInputChange} className="formInput" placeholder="Plaza 10 de Febrero, 2do Piso" />
              </div>
              <div className="formGroup" style={{ marginTop: '1.25rem' }}>
                <label className="formLabel">Horario de Atención</label>
                <input type="text" name="horario" value={formData.horario} onChange={handleInputChange} className="formInput" />
              </div>
            </div>
          )}
        </div>

        <div style={{ display: 'flex', gap: '1rem', justifyContent: 'flex-end', padding: '1.25rem 2rem', borderTop: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)' }}>
          <Link href="/admin/secretarias" className="btnSecondary">Cancelar</Link>
          <button type="submit" disabled={saving} className="btnPrimary">
            {saving ? 'Guardando...' : '✓ Guardar Cambios'}
          </button>
        </div>
      </form>
    </div>
  );
}
