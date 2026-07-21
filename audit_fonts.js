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
    if (filePath.endsWith('.css')) {
        let content = fs.readFileSync(filePath, 'utf8');
        let newContent = content;
        
        // Replace hardcoded fonts with CSS variables
        newContent = newContent.replace(/font-family:\s*['"]?Outfit['"]?,\s*sans-serif;/g, 'font-family: var(--font-heading);');
        newContent = newContent.replace(/font-family:\s*['"]?Inter['"]?,\s*sans-serif;/g, 'font-family: var(--font-body);');
        
        // Also catch inline overrides where they might have used just 'Outfit' or 'Inter'
        newContent = newContent.replace(/font-family:\s*['"]?Outfit['"]?;/g, 'font-family: var(--font-heading);');
        newContent = newContent.replace(/font-family:\s*['"]?Inter['"]?;/g, 'font-family: var(--font-body);');
        
        // Let's also fix fallback vars if they put them backwards or hardcoded them
        // like var(--font-heading, 'Outfit', sans-serif) - actually those are fine since Panton is in the var
        
        if (content !== newContent) {
            fs.writeFileSync(filePath, newContent, 'utf8');
            console.log('Updated:', filePath);
            modifiedCount++;
        }
    }
});

console.log(`Audit complete. Modified ${modifiedCount} files.`);
