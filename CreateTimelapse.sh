#: uses ffmpeg and ImageMagic (brew install imagemagic ffmpeg)
echo 'time-stamping...'
mogrify -gravity SouthWest -pointsize 100 -fill white  -annotate 0 "%[EXIF:DateTimeOriginal]" ./Thanksgiving/*.JPG

echo 'creating movie...'
ffmpeg -r 30 -f image2 -pattern_type glob -i './Thanksgiving/*.JPG' -s 4000x3000 -c:v mjpeg -q:v 10 ./thanksgiving.mov
