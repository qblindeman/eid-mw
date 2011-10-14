echo %0 %1
set CONFIGURATION=%1

call "%~dp0..\..\..\SetPathPSdk2008.bat"
if NOT %ERRORLEVEL%==0 exit 1

set OUT_PATH=%~dp0bin\%CONFIGURATION%
echo [INFO] OUT_PATH=%OUT_PATH%

set MSI_FILE_IN=BeidMW40-64-Basic
set MSI_FILE_OUT=BeidMW40-64
set MST_DIR=%OUT_PATH%\mst

mkdir "%MST_DIR%"

::------------------------------------
:: check if all the MSI files were built
::------------------------------------
set LANG=en-us
IF NOT EXIST "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-en.msi" goto NOT_%LANG%

set LANG=nl-nl
IF NOT EXIST "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-nl.msi" goto NOT_%LANG%

set LANG=fr-fr
IF NOT EXIST "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-fr.msi" goto NOT_%LANG%

set LANG=de-de
IF NOT EXIST "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-de.msi" goto NOT_%LANG%

::------------------------------------
:: take all the MSI files and process
::------------------------------------

set LANG=en-us
copy /Y "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-en.msi" "%OUT_PATH%\%MSI_FILE_OUT%.msi"
set LANG=nl-nl
"%BEID_DIR_PLATFORMSDK_2008%\Bin\msitran.exe" -g "%OUT_PATH%\%MSI_FILE_OUT%.msi" "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-nl.msi" "2067"
echo ...
set LANG=fr-fr
"%BEID_DIR_PLATFORMSDK_2008%\Bin\msitran.exe" -g "%OUT_PATH%\%MSI_FILE_OUT%.msi" "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-fr.msi" "2060"
echo ...
set LANG=de-de
"%BEID_DIR_PLATFORMSDK_2008%\Bin\msitran.exe" -g "%OUT_PATH%\%MSI_FILE_OUT%.msi" "%OUT_PATH%\%LANG%\%MSI_FILE_IN%-de.msi" "1031"
echo ...

"%BEID_DIR_PLATFORMSDK_2008%\Bin\msidb.exe" -d "%OUT_PATH%\%MSI_FILE_OUT%.msi" -r "2067"
"%BEID_DIR_PLATFORMSDK_2008%\Bin\msidb.exe" -d "%OUT_PATH%\%MSI_FILE_OUT%.msi" -r "2060"
"%BEID_DIR_PLATFORMSDK_2008%\Bin\msidb.exe" -d "%OUT_PATH%\%MSI_FILE_OUT%.msi" -r "1031"

"%BEID_DIR_PLATFORMSDK_2008%\Bin\msiInfo.exe" "%OUT_PATH%\%MSI_FILE_OUT%.msi" /p Intel;1033,2067,2060,1031
@if "%ERROLEVEL%" == "1" goto END
::------------------------------------
:: generate the correct file name and upload file to network
::------------------------------------
set /p SVN_REVISION= < "%~dp0..\..\..\svn_revision"
"%~dp0..\..\..\upload-win.bat" msi40-64 %SVN_REVISION%

goto END

:NOT_en-us
echo [ERR ] Missing file '%OUT_PATH%\%LANG%\%MSI_FILE_IN%-en.msi'
exit 1
goto END

:NOT_nl-nl
echo [ERR ] Missing file '%OUT_PATH%\%LANG%\%MSI_FILE_IN%-nl.msi'
exit 1
goto END

:NOT_fr-fr
echo [ERR ] Missing file '%OUT_PATH%\%LANG%\%MSI_FILE_IN%-fr.msi'
exit 1
goto END

:NOT_de-de
echo [ERR ] Missing file '%OUT_PATH%\%LANG%\%MSI_FILE_IN%-de.msi'
exit 1
goto END

:END

