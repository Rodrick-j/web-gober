const Jimp = require('jimp');

async function removeBg() {
  try {
    const image = await Jimp.read('../public/gobernador_perfil.png');
    const w = image.bitmap.width;
    const h = image.bitmap.height;
    
    // Flood fill algorithm
    const stack = [[0, 0], [w - 1, 0]];
    const visited = new Uint8Array(w * h);
    const transparentMask = new Uint8Array(w * h);
    
    const threshold = 30; // Slightly higher threshold
    
    while (stack.length > 0) {
      const [x, y] = stack.pop();
      if (x < 0 || x >= w || y < 0 || y >= h) continue;
      
      const idx = y * w + x;
      if (visited[idx]) continue;
      visited[idx] = 1;
      
      const hex = image.getPixelColor(x, y);
      const rgba = Jimp.intToRGBA(hex);
      
      if (rgba.r <= threshold && rgba.g <= threshold && rgba.b <= threshold && rgba.a > 0) {
        image.setPixelColor(0x00000000, x, y);
        transparentMask[idx] = 1;
        
        stack.push([x + 1, y]);
        stack.push([x - 1, y]);
        stack.push([x, y + 1]);
        stack.push([x, y - 1]);
      }
    }

    // Erosion passes to remove the halo
    for (let pass = 0; pass < 2; pass++) {
      const toRemove = [];
      for (let y = 0; y < h; y++) {
        for (let x = 0; x < w; x++) {
          const idx = y * w + x;
          if (!transparentMask[idx]) {
            // Check neighbors
            let hasTransparentNeighbor = false;
            if (x > 0 && transparentMask[y * w + (x - 1)]) hasTransparentNeighbor = true;
            if (x < w - 1 && transparentMask[y * w + (x + 1)]) hasTransparentNeighbor = true;
            if (y > 0 && transparentMask[(y - 1) * w + x]) hasTransparentNeighbor = true;
            if (y < h - 1 && transparentMask[(y + 1) * w + x]) hasTransparentNeighbor = true;

            if (hasTransparentNeighbor) {
              const hex = image.getPixelColor(x, y);
              const rgba = Jimp.intToRGBA(hex);
              // If border pixel is dark, mark for removal
              if (rgba.r < 80 && rgba.g < 80 && rgba.b < 80) {
                toRemove.push({x, y, idx});
              }
            }
          }
        }
      }

      for (const p of toRemove) {
        image.setPixelColor(0x00000000, p.x, p.y);
        transparentMask[p.idx] = 1;
      }
    }
    
    await image.writeAsync('../public/gobernador_perfil.png');
    console.log('Background removed with anti-halo erosion!');
  } catch (err) {
    console.error('Error:', err);
  }
}

removeBg();
