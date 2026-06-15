'use client';
import { useEffect, useRef } from 'react';

/**
 * useGSAP — safely initializes GSAP + ScrollTrigger on the client only.
 * Usage: useGSAP((gsap, ScrollTrigger) => { ... }, [deps])
 */
export function useGSAP(callback, deps = []) {
  const cbRef = useRef(callback);
  cbRef.current = callback;

  useEffect(() => {
    let ctx;
    let cleanup;

    (async () => {
      const { gsap } = await import('gsap');
      const { ScrollTrigger } = await import('gsap/ScrollTrigger');
      gsap.registerPlugin(ScrollTrigger);

      ctx = gsap.context(() => {
        cleanup = cbRef.current(gsap, ScrollTrigger);
      });
    })();

    return () => {
      ctx?.revert();
      if (typeof cleanup === 'function') cleanup();
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, deps);
}

/**
 * useCountUp — animates a number from 0 to `end` when the element enters the viewport.
 */
export function useCountUp(ref, end, duration = 2, suffix = '') {
  useEffect(() => {
    if (!ref.current) return;
    let ctx;

    (async () => {
      const { gsap } = await import('gsap');
      const { ScrollTrigger } = await import('gsap/ScrollTrigger');
      gsap.registerPlugin(ScrollTrigger);

      const numericEnd = parseFloat(String(end).replace(/[^0-9.]/g, ''));
      const hasK = String(end).includes('K');
      const hasPlus = String(end).includes('+');

      const obj = { val: 0 };

      ctx = gsap.context(() => {
        gsap.to(obj, {
          val: numericEnd,
          duration,
          ease: 'power2.out',
          scrollTrigger: {
            trigger: ref.current,
            start: 'top 85%',
            once: true,
          },
          onUpdate: () => {
            if (!ref.current) return;
            const formatted = hasK
              ? `${Math.round(obj.val)}K${hasPlus ? '+' : ''}`
              : `${Math.round(obj.val)}${hasPlus ? '+' : ''}${suffix}`;
            ref.current.textContent = formatted;
          },
        });
      });
    })();

    return () => ctx?.revert();
  }, [ref, end, duration, suffix]);
}
