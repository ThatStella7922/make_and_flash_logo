REM The input logo must be called logo.bin or else this won't work!
@echo off
set "version=v1.2"
set "toolname=flash_logo"
set "subtext=A tiny utility for quick logo flashing for the Pinecil."
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.

echo Please ensure you have read the README file before using this utility.
echo You can also read the CHANGELOG to learn about the changes in this version.
echo.

title %toolname% - preparing
echo Press any key to confirm that the Pinecil is connected in DFU mode and that the 
echo converted logo is in the same directory as this batch file and is named logo.bin.
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
echo %subtext%
echo.
echo Preparing to flash logo to Pinecil...
timeout -t 1 /nobreak > nul
title %toolname% - flashing logo to Pinecil
echo.
echo.
echo Flashing logo to Pinecil...
echo.
resources\dfu-util.exe -d 28e9:0189 -a 0 -D logo.bin -s 0x0800f800
echo.
echo.

echo Deleting temporary files...
echo No temporary files to delete - skipping.
echo.
echo.


title %toolname% - done
echo Done! If you see "File downloaded successfully" above then all went well.
echo Thanks for using %toolname% %version% by ThatsNiceGuy!
echo.
echo Press any key or wait 15s to exit.
timeout -t 15 > nul
