const fs = require('fs');
const path = require('path');

function walkDir(dir, callback) {
    fs.readdirSync(dir).forEach(f => {
        let dirPath = path.join(dir, f);
        let isDirectory = fs.statSync(dirPath).isDirectory();
        isDirectory ? 
            walkDir(dirPath, callback) : callback(path.join(dir, f));
    });
}

let modifiedCount = 0;

walkDir(path.join(__dirname, 'src'), (filePath) => {
    if (filePath.endsWith('.jsx') || filePath.endsWith('.js')) {
        let content = fs.readFileSync(filePath, 'utf8');
        let newContent = content;
        
        // Find <img ... > tags that don't have loading="lazy" or loading="eager"
        // and aren't obviously hero images (like in IntroAnimation we might want to skip)
        // Actually, just add loading="lazy" to all <img tags if it's missing, except if they have 'hero' or 'banner' in className or src
        
        newContent = newContent.replace(/<img\s+(?!.*?loading=)[^>]*>/g, (match) => {
            if (match.includes('banner-mineria') || match.includes('hero') || filePath.includes('IntroAnimation')) {
                return match; // Skip
            }
            return match.replace('<img ', '<img loading="lazy" ');
        });

        // Add preload="none" to <video> tags if missing, except if it has autoPlay
        newContent = newContent.replace(/<video\s+(?!.*?preload=)[^>]*>/g, (match) => {
            if (match.includes('autoPlay') || match.includes('autoplay')) {
                // Background video, don't add preload="none", it needs to play
                return match; 
            }
            return match.replace('<video ', '<video preload="none" ');
        });

        if (content !== newContent) {
            fs.writeFileSync(filePath, newContent, 'utf8');
            console.log('Optimized:', filePath);
            modifiedCount++;
        }
    }
});

console.log(`Optimization complete. Modified ${modifiedCount} files.`);
