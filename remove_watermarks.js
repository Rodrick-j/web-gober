const ffmpeg = require('ffmpeg-static');
const { execFileSync } = require('child_process');
const path = require('path');
const fs = require('fs');

const videos = [
    'public/video-mineria.mp4',
    'public/video-desarrollo-social.mp4'
];

for (const video of videos) {
    const videoPath = path.join(__dirname, video);
    if (!fs.existsSync(videoPath)) {
        console.log("Not found:", videoPath);
        continue;
    }
    const tempPath = path.join(__dirname, video + '.tmp.mp4');
    
    console.log(`Processing ${video}...`);
    try {
        execFileSync(ffmpeg, [
            '-i', videoPath,
            '-vf', 'delogo=x=1000:y=550:w=270:h=165',
            '-c:v', 'libx264',
            '-crf', '23',
            '-preset', 'fast',
            '-c:a', 'copy',
            '-y',
            tempPath
        ]);
        
        fs.renameSync(tempPath, videoPath);
        console.log(`Done ${video}`);
    } catch(e) {
        console.error(e.message);
    }
}
