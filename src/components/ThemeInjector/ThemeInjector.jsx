'use client';

import React, { useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';

export default function ThemeInjector() {
  const supabase = createClient();

  useEffect(() => {
    async function loadTheme() {
      try {
        const { data, error } = await supabase
          .from('configuracion_global')
          .select('valor')
          .eq('clave', 'tema_web')
          .maybeSingle();

        if (data && data.valor) {
          const colors = data.valor;
          if (typeof document !== 'undefined') {
            if (colors.primary) {
              document.documentElement.style.setProperty('--color-primary', colors.primary);
            }
            if (colors.gold) {
              document.documentElement.style.setProperty('--color-gold', colors.gold);
              document.documentElement.style.setProperty('--color-gold-light', colors.gold); // Approximate
            }
            if (colors.dark) {
              document.documentElement.style.setProperty('--color-text', colors.dark);
            }
          }
        }
      } catch (e) {
        console.error('Error loading theme:', e);
      }
    }

    loadTheme();
    
    // Optionally setup a realtime subscription to update theme instantly if another admin changes it
    const subscription = supabase
      .channel('theme_changes')
      .on('postgres_changes', { 
        event: 'UPDATE', 
        schema: 'public', 
        table: 'configuracion_global',
        filter: "clave=eq.tema_web"
      }, (payload) => {
        const colors = payload.new.valor;
        if (typeof document !== 'undefined' && colors) {
          if (colors.primary) document.documentElement.style.setProperty('--color-primary', colors.primary);
          if (colors.gold) document.documentElement.style.setProperty('--color-gold', colors.gold);
          if (colors.dark) document.documentElement.style.setProperty('--color-text', colors.dark);
        }
      })
      .subscribe();

    return () => {
      supabase.removeChannel(subscription);
    };
  }, [supabase]);

  // We return null because this component only injects CSS variables, it doesn't render anything
  return null;
}
