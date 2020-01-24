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
mkdir -p dist/FFmpeg-based-ADX-converter

cp -r scripts/win/* dist/FFmpeg-based-ADX-converter
mkdir dist/FFmpeg-based-ADX-converter/SOUND
mkdir dist/FFmpeg-based-ADX-converter/SOUND_raw
cp ffmpeg/ffmpeg.exe dist/FFmpeg-based-ADX-converter/ffmpeg.exe

mkdir dist/FFmpeg-based-ADX-converter/licenses
cp ffmpeg/COPYING.LGPLv2.1 dist/FFmpeg-based-ADX-converter/licenses/ffmpeg.txt
cp scripts/LICENSE dist/FFmpeg-based-ADX-converter/licenses/scripts.txt

7z a "./dist/FFmpeg-based-ADX-converter.7z" ./dist/* -mx=9
