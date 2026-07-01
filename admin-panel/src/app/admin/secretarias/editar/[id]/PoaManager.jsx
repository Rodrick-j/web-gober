'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile, deleteFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';

export default function PoaManager({ secretariaId }) {
  const [documentos, setDocumentos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [uploading, setUploading] = useState(false);
  const [formData, setFormData] = useState({ nombre: '', gestion: new Date().getFullYear() });
  const supabase = createClient();

  useEffect(() => {
    fetchDocumentos();
  }, [secretariaId]);

  const fetchDocumentos = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from('poa_documents')
      .select('*')
      .eq('secretaria_id', secretariaId)
      .order('gestion', { ascending: false })
      .order('created_at', { ascending: false });
    
    if (data) setDocumentos(data);
    setLoading(false);
  };

  const handleUpload = async (file) => {
    if (!formData.nombre) {
      alert('Por favor ingresa un nombre para el documento.');
      return;
    }
    
    try {
      setUploading(true);
      
      // Usa la función utilitaria que ya limpia los nombres de archivo
      const publicUrl = await uploadFile(file, 'documentos');
      const sizeMb = (file.size / (1024 * 1024)).toFixed(2);

      const { error: dbError } = await supabase.from('poa_documents').insert([{
        secretaria_id: secretariaId,
        nombre: formData.nombre,
        archivo_url: publicUrl,
        gestion: parseInt(formData.gestion),
        tamano_mb: parseFloat(sizeMb)
      }]);

      if (dbError) throw dbError;

      alert('Documento subido con éxito');
      setFormData({ nombre: '', gestion: new Date().getFullYear() });
      fetchDocumentos();
    } catch (err) {
      alert('Error al subir el documento: ' + err.message);
    } finally {
      setUploading(false);
    }
  };

  const handleDelete = async (doc) => {
    if (!confirm('¿Estás seguro de eliminar este documento?')) return;
    
    try {
      // Intentar borrar el archivo del storage usando nuestra utilidad
      await deleteFile(doc.archivo_url);

      // Borrar de la base de datos
      const { error } = await supabase.from('poa_documents').delete().eq('id', doc.id);
      if (error) throw error;
      
      fetchDocumentos();
    } catch (err) {
      alert('Error al eliminar: ' + err.message);
    }
  };

  if (loading) return <p>Cargando documentos...</p>;

  return (
    <div>
      <div style={{ background: 'var(--admin-surface-2)', padding: '1.5rem', borderRadius: '12px', marginBottom: '2rem', border: '1px solid var(--admin-border)' }}>
        <h3 style={{ marginTop: 0, marginBottom: '1rem', color: 'var(--admin-text)' }}>Subir Nuevo Documento POA</h3>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 150px', gap: '1rem', marginBottom: '1rem' }}>
          <div>
            <label className="formLabel">Nombre del Documento (Ej: POA Inicial Parte 1)</label>
            <input 
              type="text" 
              className="formInput" 
              value={formData.nombre} 
              onChange={e => setFormData({...formData, nombre: e.target.value})} 
            />
          </div>
          <div>
            <label className="formLabel">Gestión (Año)</label>
            <input 
              type="number" 
              className="formInput" 
              value={formData.gestion} 
              onChange={e => setFormData({...formData, gestion: e.target.value})} 
            />
          </div>
        </div>
        {uploading ? (
          <p style={{ color: 'var(--admin-primary)', fontWeight: 'bold' }}>Subiendo documento...</p>
        ) : (
          <FileUpload onFileSelect={handleUpload} label="Subir Archivo PDF" accept=".pdf" />
        )}
      </div>

      <h3 style={{ color: 'var(--admin-text)', marginBottom: '1rem' }}>Documentos Subidos</h3>
      {documentos.length === 0 ? (
        <p style={{ color: 'var(--admin-text-muted)' }}>No hay documentos subidos para esta secretaría.</p>
      ) : (
        <table className="adminTable">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Gestión</th>
              <th>Tamaño</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {documentos.map(doc => (
              <tr key={doc.id}>
                <td>{doc.nombre}</td>
                <td>{doc.gestion}</td>
                <td>{doc.tamano_mb} MB</td>
                <td>
                  <a href={doc.archivo_url} target="_blank" rel="noreferrer" style={{ color: '#3b82f6', marginRight: '1rem', textDecoration: 'none' }}>Ver</a>
                  <button onClick={() => handleDelete(doc)} style={{ background: 'none', border: 'none', color: '#ef4444', cursor: 'pointer', fontWeight: 'bold' }}>Eliminar</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
