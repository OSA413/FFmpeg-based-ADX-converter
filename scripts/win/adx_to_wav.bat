@echo off
setlocal EnableDelayedExpansion
call ffmpeg.exe -version && (
echo.

for /F "delims==" %%f in ('where /F /R SOUND *.adx') DO (
    echo %%f
    set "output=%%~dpnf.wav"
    set "output="!output:SOUND=SOUND_raw!""

    if not exist !output! (
    mkdir !output!
    rmdir !output!
    )

    call ffmpeg.exe -y -loglevel fatal -hide_banner -nostats -i %%f !output!
))
pause
