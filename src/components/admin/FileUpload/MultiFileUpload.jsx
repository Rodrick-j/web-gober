'use client';
import { useState, useRef } from 'react';
import imageCompression from 'browser-image-compression';
import styles from './MultiFileUpload.module.css';

export default function MultiFileUpload({ 
  onFilesSelect, 
  accept = "image/*", 
  label = "Subir múltiples imágenes", 
  maxSizeMB = 5
}) {
  const [dragActive, setDragActive] = useState(false);
  const [filesData, setFilesData] = useState([]); // { file, preview, name }
  const [error, setError] = useState('');
  const inputRef = useRef(null);

  const handleFiles = async (files) => {
    setError('');
    
    let processedFiles = [...filesData];
    
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      let fileToUpload = file;

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
          console.error('Error al comprimir:', err);
        }
      } else {
        if (file.size > maxSizeMB * 1024 * 1024) {
          setError(`El archivo ${file.name} es muy grande.`);
          continue;
        }
      }

      const url = URL.createObjectURL(fileToUpload);
      processedFiles.push({ file: fileToUpload, preview: url, name: fileToUpload.name });
    }

    setFilesData(processedFiles);
    onFilesSelect(processedFiles.map(f => f.file));
  };

  const removeFile = (index) => {
    const updated = [...filesData];
    URL.revokeObjectURL(updated[index].preview);
    updated.splice(index, 1);
    setFilesData(updated);
    onFilesSelect(updated.map(f => f.file));
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
    
    if (e.dataTransfer.files && e.dataTransfer.files.length > 0) {
      handleFiles(e.dataTransfer.files);
    }
  };

  const handleChange = (e) => {
    e.preventDefault();
    if (e.target.files && e.target.files.length > 0) {
      handleFiles(e.target.files);
    }
  };

  const onButtonClick = () => {
    inputRef.current.click();
  };

  return (
    <div className={styles.container}>
      <label className={styles.label}>{label}</label>
      
      <div 
        className={`${styles.dropZone} ${dragActive ? styles.dragActive : ''}`}
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
          multiple
          onChange={handleChange} 
          className={styles.hiddenInput}
        />
        <div className={styles.uploadContent}>
          <span className={styles.icon}>🖼️</span>
          <p className={styles.text}>
            <strong>Haz clic</strong> o arrastra múltiples fotos aquí
          </p>
        </div>
      </div>

      {error && <div className={styles.error}>{error}</div>}

      {filesData.length > 0 && (
        <div className={styles.previewGrid}>
          {filesData.map((fd, index) => (
            <div key={index} className={styles.previewCard}>
              <img src={fd.preview} alt="preview" className={styles.previewImg} />
              <button 
                type="button" 
                onClick={(e) => { e.stopPropagation(); removeFile(index); }}
                className={styles.removeBtn}
                title="Quitar"
              >
                ✕
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
