@echo off
setlocal EnableDelayedExpansion
set ffmpeg=%~dp0ffmpeg.exe
call %ffmpeg% -version && (
echo.

for /F "delims==" %%f in ('where /F /R SOUND_raw *.wav *.mp3 *.flac') DO (
    echo %%f
    set "output=%%~dpnf.adx"
    set "output="!output:SOUND_raw=SOUND!""

    if not exist !output! (
    mkdir !output!
    rmdir !output!
    )

    call %ffmpeg% -y -loglevel fatal -hide_banner -nostats -i %%f !output!
))
pause
