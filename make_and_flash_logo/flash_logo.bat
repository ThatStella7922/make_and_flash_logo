@echo off
set "version=v2.1"
set "toolname=flash_logo"
set "subtext=A tiny utility for quick logo flashing in one click for the Pinecil."
set "logo=logo.bin"
title %toolname%
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.

echo Please ensure you have read the INSTRUCTION file before using this utility.
echo You can also read the CHANGELOG to learn about the changes in this version.
echo.

:firsttimesetup
echo Checking for preferences file...
If exist resources\%toolname%-setuphasrun%version%.cfg goto checkpinecil
title %toolname% - first time setup

echo.
echo We couldn't find a preferences file for this version, so first
echo time setup will need to be run for you to set your preferences.
echo.
timeout -t 2 /nobreak > nul
echo Welcome to %toolname% %version% setup!
echo.
echo Skip asking if your Pinecil is connected in DFU mode?
echo If you enable this, the utility will run without checking if the
echo Pinecil is connected. This could cause failed flashes.
echo. 
echo Do you want to enable this feature?
CHOICE /C YN
IF %ERRORLEVEL% EQU 2 goto setupdisableskippinecilcheck
IF %ERRORLEVEL% EQU 1 goto setupenableskippinecilcheck

:setupenableskippinecilcheck
echo.
echo This is a configuration file for %toolname%. If you delete it, the application will behave unexpectedly based on the preferences you set during first time setup. > resources\%toolname%-enableskippinecilcheck%version%.cfg
echo Succesfully enabled %toolname%-enableskippinecilcheck%version%.
echo.
goto setupcomplete

:setupdisableskippinecilcheck
echo.
del /Q resources\%toolname%-enableskippinecilcheck%version%.cfg >nul 2>&1
echo Succesfully disabled %toolname%-enableskippinecilcheck%version%.
echo.
goto setupcomplete

:setupcomplete
echo This file tells %toolname% that you finished first time setup. If you delete it, you'll have to complete first time setup again. > resources\%toolname%-setuphasrun%version%.cfg
echo You have completed first time setup. The script will now continue normally.
timeout -t 4 /nobreak > nul
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.
goto checkpinecil

:checkpinecil
title %toolname% - preparing
If exist resources\%toolname%-enableskippinecilcheck%version%.cfg goto checkforlogo
:: ^ check if the user disabled the pinecil check, if the file exists then it is disabled
:: v here we ask the user to confirm that the pinecil is connected
echo.
echo Press any key to confirm that the Pinecil is connected in DFU mode.
echo.
echo This utility will not work otherwise.
timeout -t -1 > nul
:: ^ wait indefinitely until the user presses any key
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.
echo User has confirmed that the Pinecil is connected in DFU mode -- Continuing...
echo.

:checkforlogo
If exist resources\%toolname%-enableskippinecilcheck%version%.cfg echo Pinecil DFU check skipped.
If exist resources\%toolname%-enableskippinecilcheck%version%.cfg echo.
echo Looking for %logo%...
echo.
If exist "%logo%" goto flash
:: ^ here we check if the image exists and if it does, skip to the convert section
:: v this is shown if the logo isn't found
echo An error has occured - the logo image wasn't found.
echo To continue, enter the filename of the logo (with extension) or paste in its path.
set /p "logo= --> "
If exist "%logo%" goto flash
echo.
goto logonotfound

:logonotfound
echo The utility cannot find the logo image you specified.
echo The filename/path you provided was '%logo%', check it and try again.
echo Paste the filename/path of the logo image...
set /p "logo= --> "
echo.
If exist "%logo%" goto flash
goto logonotfound

:flash
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.
echo Preparing to flash logo to Pinecil...
copy %logo% resources\temp.bin 1>nul
timeout -t 1 /nobreak > nul
title %toolname% - flashing logo to Pinecil
echo.
echo Flashing logo to Pinecil...
echo.
resources\dfu-util.exe -d 28e9:0189 -a 0 -D resources\temp.bin -s 0x0801F800
echo.
echo.

:deltempfiles
echo Deleting temporary files...
del resources\temp.bin
echo.
echo.

title %toolname% - done
echo Done! If you see "File downloaded successfully" above then all went well.
echo Thanks for using %toolname% %version% by ThatsNiceGuy!
echo.
echo Press any key or wait 30s to exit.
timeout -t 30 > nul
