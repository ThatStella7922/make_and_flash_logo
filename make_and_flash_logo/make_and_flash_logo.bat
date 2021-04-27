REM The input image must be called logo.png or else this won't work!
@echo off
set "version=v1.1"
set "toolname=make_and_flash_logo"
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo A tiny utility for quick logo conversion and flashing in one click for the Pinecil.
echo.

echo Please ensure you have read the README file before using this utility.
echo You can also read the CHANGELOG to learn about the changes in this version.
echo.

title %toolname% - preparing
echo Press any key to confirm that the Pinecil is connected in DFU mode and that the 
echo logo is in the same directory as this batch file and is named logo.png.
echo.
echo This utility will not work otherwise.
timeout -t -1 > nul
echo.
echo.
echo User has confirmed that the Pinecil is connected in DFU mode -- Continuing...
echo.
echo.

cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo A tiny utility for quick logo conversion and flashing in one click for the Pinecil.
echo.
title %toolname% - converting
echo Converting PNG logo to hex...
python resources\img2ts100.py logo.png resources\temp.hex
echo.
echo.

echo Converting hex logo to binary...
resources\objcopy.exe -I ihex -O binary resources\temp.hex resources\temp.bin
echo.
echo.
timeout -t 1 /nobreak > nul

cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo A tiny utility for quick logo conversion and flashing in one click for the Pinecil.
echo.
echo Preparing to flash logo to Pinecil...
timeout -t 1 /nobreak > nul
title %toolname% - flashing logo to Pinecil
echo.
echo.
echo Flashing logo to Pinecil...
echo.
resources\dfu-util.exe -d 28e9:0189 -a 0 -D resources\temp.bin -s 0x0800f800
echo.
echo.

echo Deleting temporary files...
del resources\temp.hex
del resources\temp.bin
echo.
echo.


title %toolname% - done
echo Done! If you see "File downloaded successfully" above then all went well.
echo Thanks for using %toolname% %version% by ThatsNiceGuy!
echo.
echo Press any key or wait 15s to exit.
timeout -t 15 > nul
