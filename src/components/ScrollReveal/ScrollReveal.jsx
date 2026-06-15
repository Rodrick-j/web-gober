'use client';
import { useRef } from 'react';
import { useGSAP } from '@/hooks/useGSAP';

/**
 * ScrollReveal — wraps children and reveals them via GSAP ScrollTrigger
 * Props:
 *   direction: 'up' | 'left' | 'right' | 'fade'
 *   delay: seconds
 *   stagger: seconds between children (if wrapChildren=true)
 *   wrapChildren: if true, staggers direct children
 */
export default function ScrollReveal({
  children,
  direction = 'up',
  delay = 0,
  duration = 0.75,
  stagger = 0.12,
  wrapChildren = false,
  className = '',
  style = {},
}) {
  const ref = useRef(null);

  const getFrom = () => {
    switch (direction) {
      case 'left':  return { x: -50, opacity: 0 };
      case 'right': return { x:  50, opacity: 0 };
      case 'fade':  return { opacity: 0 };
      default:      return { y: 40, opacity: 0 };
    }
  };

  const getTo = () => {
    switch (direction) {
      case 'left':  return { x: 0, opacity: 1 };
      case 'right': return { x: 0, opacity: 1 };
      case 'fade':  return { opacity: 1 };
      default:      return { y: 0, opacity: 1 };
    }
  };

  useGSAP((gsap) => {
    if (!ref.current) return;

    const targets = wrapChildren
      ? ref.current.children
      : ref.current;

    gsap.fromTo(
      targets,
      getFrom(),
      {
        ...getTo(),
        duration,
        delay,
        stagger: wrapChildren ? stagger : 0,
        ease: 'power3.out',
        scrollTrigger: {
          trigger: ref.current,
          start: 'top 82%',
          once: true,
        },
      }
    );
  }, []);

  return (
    <div ref={ref} className={className} style={style}>
      {children}
    </div>
  );
}
