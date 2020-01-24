@echo off
call ffmpeg.exe -version && (
echo.

where /Q /R SOUND_raw *.wav *.mp3 *.flac && robocopy SOUND_raw SOUND *.wav *.mp3 *.flac /S > NUL

for /F "delims==" %%f in ('where /F /R SOUND *.wav *.mp3 *.flac') DO (
    echo %%f
    call ffmpeg.exe -y -loglevel fatal -hide_banner -nostats -i %%f "%%~dpnf.adx" && (
    del %%f)
))
pause
