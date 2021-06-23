@echo off
set "version=v2.11"
set "toolname=make_logo"
set "subtext=A tiny utility for quick logo conversion in one click for the Pinecil."
set "logo=logo.png"
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.

echo Please ensure you have read the INSTRUCTION file before using this utility.
echo You can also read the CHANGELOG to learn about the changes in this version.
echo.

title %toolname% - preparing
echo Looking for %logo%...
echo.
If exist "%logo%" goto convert
:: ^ here we check if the image exists and if it does, skip to the convert section
:: v this is shown if the logo isn't found
echo An error has occured - the logo image wasn't found.
echo To continue, enter the filename of the logo (with extension) or paste in its path.
set /p "logo= --> "
If exist "%logo%" goto convert
echo.
goto logonotfound

:logonotfound
echo The utility cannot find the logo image you specified.
echo The filename/path you provided was '%logo%', check it and try again.
echo Paste the filename/path of the logo image...
set /p "logo= --> "
echo.
If exist "%logo%" goto convert
goto logonotfound

:convert
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.
title %toolname% - converting
copy %logo% resources\temp.png 1>nul
echo Converting PNG logo to hex...
python resources\img2ts100.py resources\temp.png logo.hex
echo.
echo.

echo Converting hex logo to binary...
resources\objcopy.exe -I ihex -O binary logo.hex logo.bin
echo.
echo.
timeout -t 1 /nobreak > nul

cls
echo Deleting temporary files...
del resources\temp.png
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
