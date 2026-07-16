'use client';
import { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import styles from './login.module.css';

export default function AdminLogin() {
  const router      = useRouter();
  const searchParams = useSearchParams();
  const redirectTo  = searchParams.get('redirectTo') || '/admin';
  const errorParam  = searchParams.get('error');

  const [email,    setEmail]    = useState('');
  const [password, setPassword] = useState('');
  const [loading,  setLoading]  = useState(false);
  const [error,    setError]    = useState('');
  const [showPass, setShowPass] = useState(false);

  // Mostrar error de URL (sin acceso, etc.)
  useEffect(() => {
    if (errorParam === 'no_access')
      setError('Tu cuenta no tiene permisos de administrador. Contacta a TI.');
    if (errorParam === 'forbidden')
      setError('No tienes permisos para acceder a ese módulo.');
  }, [errorParam]);

  const handleLogin = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    const supabase = createClient();

    const { error: authError } = await supabase.auth.signInWithPassword({
      email:    email.trim().toLowerCase(),
      password,
    });

    if (authError) {
      // Errores amigables en español
      if (authError.message.includes('Invalid login credentials'))
        setError('Correo o contraseña incorrectos. Verifica tus datos.');
      else if (authError.message.includes('Email not confirmed'))
        setError('Debes confirmar tu correo electrónico antes de ingresar.');
      else if (authError.message.includes('Too many requests'))
        setError('Demasiados intentos. Espera unos minutos e intenta de nuevo.');
      else
        setError('Error al iniciar sesión. Intenta de nuevo.');

      setLoading(false);
      return;
    }

    // Login exitoso — redirigir
    router.push(redirectTo);
    router.refresh();
  };

  return (
    <div className={styles.loginRoot}>
      {/* Background animado */}
      <div className={styles.loginBg}>
        <div className={styles.bgOrb1} />
        <div className={styles.bgOrb2} />
        <div className={styles.bgGrid} />
      </div>

      {/* Card de login */}
      <div className={styles.loginCard}>

        {/* Header */}
        <div className={styles.loginHeader}>
          <div className={styles.logoIcon}>
            <img src="/favicon-gador.png" alt="GADOR Logo" className={styles.logoImg} />
          </div>
          <div className={styles.loginTitle}>Panel Administrativo</div>
          <div className={styles.loginSubtitle}>
            Gobierno Autónomo Departamental de Oruro
          </div>
        </div>

        {/* Divider */}
        <div className={styles.divider} />

        {/* Formulario */}
        <form className={styles.loginForm} onSubmit={handleLogin} noValidate>

          {/* Error box */}
          {error && (
            <div className={styles.errorBox} role="alert">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <circle cx="12" cy="12" r="10"/>
                <line x1="12" y1="8" x2="12" y2="12"/>
                <line x1="12" y1="16" x2="12.01" y2="16"/>
              </svg>
              {error}
            </div>
          )}

          {/* Email */}
          <div className={styles.fieldGroup}>
            <label className={styles.fieldLabel} htmlFor="admin-email">
              Correo Electrónico
            </label>
            <div className={styles.inputWrap}>
              <svg className={styles.inputIcon} width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                <polyline points="22,6 12,13 2,6"/>
              </svg>
              <input
                id="admin-email"
                type="email"
                className={styles.input}
                placeholder="admin@oruro.gob.bo"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                autoComplete="email"
                autoFocus
              />
            </div>
          </div>

          {/* Contraseña */}
          <div className={styles.fieldGroup}>
            <label className={styles.fieldLabel} htmlFor="admin-password">
              Contraseña
            </label>
            <div className={styles.inputWrap}>
              <svg className={styles.inputIcon} width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
              </svg>
              <input
                id="admin-password"
                type={showPass ? 'text' : 'password'}
                className={styles.input}
                placeholder="••••••••"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                autoComplete="current-password"
              />
              <button
                type="button"
                className={styles.togglePass}
                onClick={() => setShowPass(!showPass)}
                aria-label={showPass ? 'Ocultar contraseña' : 'Mostrar contraseña'}
              >
                {showPass ? (
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/>
                    <path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/>
                    <line x1="1" y1="1" x2="23" y2="23"/>
                  </svg>
                ) : (
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                    <circle cx="12" cy="12" r="3"/>
                  </svg>
                )}
              </button>
            </div>
          </div>

          {/* Botón */}
          <button
            type="submit"
            className={styles.loginBtn}
            id="admin-login-submit"
            disabled={loading || !email || !password}
          >
            {loading ? (
              <>
                <span className={styles.spinner} />
                Verificando...
              </>
            ) : (
              <>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                  <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
                  <polyline points="10 17 15 12 10 7"/>
                  <line x1="15" y1="12" x2="3" y2="12"/>
                </svg>
                Iniciar Sesión
              </>
            )}
          </button>

        </form>

        {/* Footer */}
        <div className={styles.loginFooter}>
          <div className={styles.secureLabel}>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
              <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
            </svg>
            Conexión cifrada con SSL
          </div>
          <span className={styles.footerVersion}>v1.0 · GADOR 2026</span>
        </div>
      </div>
    </div>
  );
}
