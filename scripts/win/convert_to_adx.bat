@echo off
setlocal EnableDelayedExpansion
call ffmpeg.exe -version && (
echo.

for /F "delims==" %%f in ('where /F /R SOUND_raw *.wav *.mp3 *.flac') DO (
    echo %%f
    set "output=%%~dpnf.adx"
    set "output="!output:SOUND_raw=SOUND!"" 
    call ffmpeg.exe -y -loglevel fatal -hide_banner -nostats -i %%f !output!
))
pause
