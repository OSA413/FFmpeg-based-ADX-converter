convert()
{
for file in ./$3/**/*.$1; do
    echo $file
    output="${file%.*}".$2
    output="${output/$3/$4}"
    
    ffmpeg -y -loglevel fatal -hide_banner -nostats -i $file $output
done
}

ffmpeg -version && (

shopt -s globstar

if [ $# == 0 ]; then
    for extension in mp3 flac wav; do
        convert $extension adx SOUND_raw SOUND
    done
else
    convert $1 $2 SOUND SOUND_raw
fi
)
