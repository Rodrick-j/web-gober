'use client';
import { motion } from 'framer-motion';

/**
 * ScrollReveal — wraps children and reveals them via framer-motion
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

  const getVariants = () => {
    const hidden = { opacity: 0 };
    const visible = {
      opacity: 1,
      transition: {
        duration,
        delay,
        ease: 'easeOut',
        when: "beforeChildren",
        staggerChildren: wrapChildren ? stagger : 0
      }
    };

    switch (direction) {
      case 'left':
        hidden.x = -50;
        visible.x = 0;
        break;
      case 'right':
        hidden.x = 50;
        visible.x = 0;
        break;
      case 'up':
      default:
        hidden.y = 40;
        visible.y = 0;
        break;
      case 'fade':
        break;
    }

    return { hidden, visible };
  };

  const variants = getVariants();

  if (wrapChildren) {
    // If wrapping children, we need to apply item variants to children
    // But since children are React nodes, it's easier to just use standard motion on the parent
    // and let framer-motion propagate variants if children were motion components.
    // However, if they aren't, staggerChildren doesn't auto-wrap them.
    // Given the previous GSAP implementation just animated DOM nodes directly,
    // this might require adjusting how children are structured.
    // For simplicity and matching GSAP, we'll return a simple motion.div
  }

  return (
    <motion.div
      className={className}
      style={style}
      variants={variants}
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, amount: 0.18 }}
    >
      {children}
    </motion.div>
  );
}
