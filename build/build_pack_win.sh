cd "$(dirname "$0")"

## Compilation
## FFmpeg
cd ../ffmpeg

./configure \
    --arch=x86 \
    --target-os=mingw32 \
    --cross-prefix=i686-w64-mingw32- \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-doc \
    --disable-swscale \
    --disable-decoders \
    --enable-decoder=adpcm_adx \
    --enable-decoder=pcm_s16le \
    --enable-decoder=pcm_s24le \
    --enable-decoder=pcm_f32le \
    --enable-decoder=mp3 \
    --enable-decoder=flac \
    --disable-encoders \
    --enable-encoder=adpcm_adx \
    --enable-encoder=pcm_s16le \
    --enable-encoder=flac \
    --disable-hwaccels \
    --disable-muxers \
    --enable-muxer=adx \
    --enable-muxer=wav \
    --enable-muxer=flac \
    --disable-demuxers \
    --enable-demuxer=adx \
    --enable-demuxer=wav \
    --enable-demuxer=mp3 \
    --enable-demuxer=flac \
    --disable-parsers \
    --disable-bsfs \
    --disable-protocols \
    --enable-protocol=file \
    --disable-filters \
    --enable-filter=aresample \
    --disable-devices

make -j2 -s

## Package
cd ..
rm -r dist
mkdir dist

cp -r scripts/win/* dist
mkdir dist/SOUND
mkdir dist/SOUND_raw
cp ffmpeg/ffmpeg.exe dist/ffmpeg.exe

mkdir dist/licenses
cp ffmpeg/COPYING.LGPLv2.1 dist/licenses/ffmpeg.txt
cp scripts/LICENSE dist/licenses/scripts.txt
