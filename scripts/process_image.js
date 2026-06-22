const Jimp = require('jimp');
const path = require('path');

const imagePath = path.join(__dirname, '../public/images/marca_gobierno.png');
const outputPath = path.join(__dirname, '../public/images/marca_gobierno_blanco.png');

async function processImage() {
  try {
    const image = await Jimp.read(imagePath);

    image.scan(0, 0, image.bitmap.width, image.bitmap.height, function (x, y, idx) {
      const r = this.bitmap.data[idx + 0];
      const g = this.bitmap.data[idx + 1];
      const b = this.bitmap.data[idx + 2];
      const a = this.bitmap.data[idx + 3];

      // Ignore fully transparent pixels
      if (a === 0) return;

      // Identify dark red lines. 
      // Dark red typically has R > G and R > B, but not super bright (so it's not the flag)
      // Let's be generous to catch anti-aliased edges
      if (r > g + 10 && r > b + 10 && r < 210) {
        // It's a dark red pixel. Make it white, keep alpha
        this.bitmap.data[idx + 0] = 255; // R
        this.bitmap.data[idx + 1] = 255; // G
        this.bitmap.data[idx + 2] = 255; // B
      }
    });

    await image.writeAsync(outputPath);
    console.log('Image processed successfully!');
  } catch (err) {
    console.error('Error processing image:', err);
  }
}

processImage();
