@echo off
set "version=v2.11"
set "toolname=flash_ironos"
set "subtext=A tiny utility to flash IronOS in one click for the Pinecil."
set "file=Pinecil_EN.bin"
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
echo This is a configuration file for %toolname%. If you delete it, the application will behave unexpectedly based on the preferences you set during first time setup. > resources\%toolname%-setupenableskippinecilcheck%version%.cfg
echo Succesfully enabled %toolname%-setupenableskippinecilcheck%version%.
echo.
goto firsttimesetupcomplete

:setupdisableskippinecilcheck
echo.
del /Q resources\%toolname%-setupenableskippinecilcheck%version%.cfg >nul 2>&1
echo Succesfully disabled %toolname%-setupenableskippinecilcheck%version%.
echo.
goto firsttimesetupcomplete

:firsttimesetupcomplete
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
If exist resources\%toolname%-setupenableskippinecilcheck%version%.cfg goto checkforfile
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

:checkforfile
If exist resources\%toolname%-setupenableskippinecilcheck%version%.cfg echo Pinecil DFU check skipped.
If exist resources\%toolname%-setupenableskippinecilcheck%version%.cfg echo.
echo Looking for %file%...
echo.
If exist "%file%" goto flash
:: ^ here we check if the file exists and if it does, skip to the convert section
:: v this is shown if the file isn't found
echo An error has occured - the firmware file wasn't found. 
echo To continue, enter the filename of the firmware (with extension) or paste in its path.
set /p "file= --> "
If exist "%file%" goto convert
echo.
goto filenotfound

:filenotfound
echo The utility cannot find the firmware file you specified.
echo The filename/path you provided was '%file%', check it and try again.
echo Paste the filename/path of the logo image...
set /p "file= --> "
echo.
If exist "%file%" goto flash
goto filenotfound

:flash
cls
echo %toolname% %version% - By ThatsNiceGuy 2021 - Uses binaries not owned by me
echo %subtext%
echo.
echo Preparing to flash firmware to Pinecil...
copy %file% resources\firmware.bin 1>nul
timeout -t 1 /nobreak > nul
title %toolname% - flashing firmware to Pinecil
echo.
echo Flashing logo to Pinecil...
echo.
resources\dfu-util.exe -d 28e9:0189 -a 0 -D resources\firmware.bin -s 0x08000000
:: ':mass-erase:force' doesn't seem to work on my Pinecil
echo.

echo Deleting temporary files...
del resources\firmware.bin

title %toolname% - done
echo Done! If you see "File downloaded successfully" above then all went well.
echo Thanks for using %toolname% %version% by ThatsNiceGuy!
echo.
echo Press any key or wait 30s to exit.
timeout -t 30 > nul
