@echo off
setlocal DisableDelayedExpansion
set ffmpeg="%~dp0ffmpeg.exe"
call %ffmpeg% -version && (
echo.

for /F "delims==" %%f in ('where /F /R SOUND *.adx') DO (
    echo %%f
    set "output=%%~dpnf.wav"
    setlocal EnableDelayedExpansion
    set "output="!output:SOUND=SOUND_raw!""
    endlocal

    if not exist %output% (
    mkdir %output%
    rmdir %output%
    )

    call %ffmpeg% -y -loglevel fatal -hide_banner -nostats -i %%f %output%
))
pause
