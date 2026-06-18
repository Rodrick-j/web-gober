'use client';

import React from 'react';

export default function AnimatedBackground() {
  return (
    <div
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        width: '100vw',
        height: '100vh',
        zIndex: -1,
        pointerEvents: 'none',
        backgroundColor: '#F3F4F6',
        overflow: 'hidden',
      }}
    >
      <div
        style={{
          position: 'absolute',
          top: '-20%',
          left: '-20%',
          width: '140%',
          height: '140%',
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='103.92304845413264' viewBox='0 0 60 103.92304845413264' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M30 103.92304845413264L60 51.96152422706632L0 51.96152422706632z' fill='%23000000' fill-opacity='0.03'/%3E%3Cpath d='M30 0L60 51.96152422706632L0 51.96152422706632z' fill='%23000000' fill-opacity='0.04'/%3E%3C/svg%3E")`,
          backgroundSize: '180px 311.769px',
          animation: 'panBackground 40s linear infinite',
          willChange: 'transform',
        }}
      />
      <style>{`
        @keyframes panBackground {
          0% { transform: translate(0, 0); }
          100% { transform: translate(180px, 311.769px); }
        }
      `}</style>
    </div>
  );
}
