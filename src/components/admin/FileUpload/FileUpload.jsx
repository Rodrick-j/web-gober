'use client';
import { useState, useRef } from 'react';
import imageCompression from 'browser-image-compression';
import styles from './FileUpload.module.css';

export default function FileUpload({ 
  onFileSelect, 
  accept = "image/*", 
  label = "Subir archivo", 
  icon = "📁",
  maxSizeMB = 5,
  multiple = false
}) {
  const [dragActive, setDragActive] = useState(false);
  const [preview, setPreview] = useState(null);
  const [fileName, setFileName] = useState('');
  const [error, setError] = useState('');
  const inputRef = useRef(null);

  const handleFile = async (file) => {
    setError('');
    
    let fileToUpload = file;

    // Comprimir si es imagen
    if (file.type.startsWith('image/')) {
      try {
        const options = {
          maxSizeMB: maxSizeMB,
          maxWidthOrHeight: 1920,
          useWebWorker: true,
          initialQuality: 0.8
        };
        fileToUpload = await imageCompression(file, options);
      } catch (err) {
        console.error('Error al comprimir la imagen:', err);
      }
    } else {
      // Si no es imagen, solo validar tamaño normal
      if (file.size > maxSizeMB * 1024 * 1024) {
        setError(`El archivo es demasiado grande. Máximo ${maxSizeMB}MB.`);
        return;
      }
    }

    setFileName(fileToUpload.name);
    onFileSelect(fileToUpload);

    // Crear preview local si es imagen
    if (fileToUpload.type.startsWith('image/')) {
      const url = URL.createObjectURL(fileToUpload);
      setPreview(url);
    } else {
      setPreview(null);
    }
  };

  const handleDrag = (e) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true);
    } else if (e.type === "dragleave") {
      setDragActive(false);
    }
  };

  const handleDrop = (e) => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);
    
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      handleFile(e.dataTransfer.files[0]);
    }
  };

  const handleChange = (e) => {
    e.preventDefault();
    if (e.target.files && e.target.files[0]) {
      handleFile(e.target.files[0]);
    }
  };

  const onButtonClick = () => {
    inputRef.current.click();
  };

  return (
    <div className={styles.container}>
      <label className={styles.label}>{label}</label>
      
      <div 
        className={`${styles.dropZone} ${dragActive ? styles.dragActive : ''} ${preview ? styles.hasPreview : ''}`}
        onDragEnter={handleDrag}
        onDragLeave={handleDrag}
        onDragOver={handleDrag}
        onDrop={handleDrop}
        onClick={onButtonClick}
      >
        <input 
          ref={inputRef}
          type="file" 
          accept={accept} 
          onChange={handleChange} 
          className={styles.hiddenInput}
        />

        {preview ? (
          <div className={styles.previewContainer}>
            <img src={preview} alt="Vista previa" className={styles.previewImage} />
            <div className={styles.previewOverlay}>
              <span>Cambiar imagen</span>
            </div>
          </div>
        ) : (
          <div className={styles.uploadContent}>
            <span className={styles.icon}>{icon}</span>
            <p className={styles.text}>
              <strong>Haz clic para subir</strong> o arrastra y suelta el archivo aquí
            </p>
            <p className={styles.subtext}>
              {accept.includes('pdf') ? 'Solo PDF' : 'Solo imágenes'} (Máx. {maxSizeMB}MB)
            </p>
          </div>
        )}
      </div>

      {fileName && !preview && (
        <div className={styles.fileSelected}>
          📄 {fileName}
        </div>
      )}

      {error && <div className={styles.error}>{error}</div>}
    </div>
  );
}
