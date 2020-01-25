# FFmpeg-based ADX converter

Simple ADX converter that uses FFmpeg

----------------------

## How to use
### ADX to WAV/FLAC
1. Place ADX files you want to convert into the `SOUND` directory.
2. Run `adx_to_wav.bat` or `adx_to_flac.bat`.
3. Converted files will appear in the `SOUND_raw` directory keeping original file hierarchy.

### WAV/FLAC/MP3 to ADX
1. Place the files you want to convert into the `SOUND_raw` directory.
2. Run `convert_to_adx.bat`.
3. Converted files will appear in the `SOUND` directory keeping original file hierarchy.

## Technical information
FFmpeg compiled with the parameters in the build file from the repository supports:

   Way   | Formats
---------|--------
Encoding | ADX (ADXv3 without loop pointers), WAV (s16le), and FLAC
Decoding | WAV, MP3, FLAC, and ADX


## How to compile
0. You need a Linux or Windows Subsystem for Linux.
1. Prepare your environment: https://trac.ffmpeg.org/wiki/CompilationGuide/CrossCompilingForWindows (listed in "Linux Packages")
2. Clone the repository and run `git submodule init && git submodule update`.
3. In case Bash says something related to the carette return symbol (`\r`) after clonning the repo on Windows/WSL, run `python3 fix_sh_newline.py`.
4. Run `bash build/build_pack_win.sh`
5. `dist` directory should appear with a `7z` file with the program after compilation.

## License
Conversion scripts in this repository are licensed under the MIT license.

FFmpeg compiled with the parameters in the build file from the repository is licensed under the LGPLv2.1+. For more information: https://ffmpeg.org/legal.html

## TODO
1. Improve scripts to pass the output file name without copying original file.
2. Add Linux Bash scripts.
