@echo off
call ffmpeg.exe -version && (
echo.

where /Q /R SOUND *.adx && robocopy SOUND SOUND_raw *.adx /S > NUL

for /F "delims==" %%f in ('where /F /R SOUND_raw *.adx') DO (
    echo %%f
    call ffmpeg.exe -y -loglevel fatal -hide_banner -nostats -i %%f "%%~dpnf.flac" && (
    del %%f )
))
pause
