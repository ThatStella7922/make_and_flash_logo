:: The input image must be called logo.png or else this won't work!
@echo off
set "version=v1.2"
set "toolname=make_logo"
set "subtext=A tiny utility for quick logo conversion in one click for the Pinecil."
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.

echo Please ensure you have read the README file before using this utility.
echo You can also read the CHANGELOG to learn about the changes in this version.
echo.

title %toolname% - preparing
echo Press any key to confirm that the logo is in the same directory as this batch file
echo and is named logo.png.
echo.
echo This utility will not work otherwise.
timeout -t -1 > nul
echo.
echo.
echo User has confirmed that the logo is in the proper directory -- Continuing...
echo.
echo.

cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.
title %toolname% - converting
echo Converting PNG logo to hex...
python resources\img2ts100.py logo.png logo.hex
echo.
echo.

echo Converting hex logo to binary...
resources\objcopy.exe -I ihex -O binary logo.hex logo.bin
echo.
echo.
timeout -t 1 /nobreak > nul

cls
echo Deleting temporary files...
echo No temporary files to delete - skipping.
echo.
echo.


title %toolname% - done
echo Done! You should now have a 'logo.bin' and a 'logo.hex' file in the main folder.
echo The 'logo.bin' file is compatible with the Pinecil.
echo The 'logo.hex' is compatible with TS100, TS80, and TS80P.
echo.
echo For more info, see https://github.com/Ralim/IronOS/blob/master/Documentation/Logo.md
echo.
echo Thanks for using %toolname% %version% by ThatsNiceGuy!
echo.
echo Press any key or wait 15s to exit.
timeout -t 15 > nul
