@echo [INFO] Define default value for BEID_DIR_VS_2005 if not defined yet
@echo [INFO] Input BEID_DIR_VS_2005=%BEID_DIR_VS_2005%
@set FILE_TO_FIND="Common7\IDE\devenv.exe"
@echo [INFO] Looking for files: %FILE_TO_FIND%

@set FILE_NOT_FOUND=
@for %%i in (%FILE_TO_FIND%) do @if not exist "%BEID_DIR_VS_2005%\%%~i" set FILE_NOT_FOUND=%%~i
@if "%FILE_NOT_FOUND%"=="" goto find_vs2005
@echo        Not found in "%BEID_DIR_VS_2005%"

@set BEID_DIR_VS_2005=C:\Program Files\Microsoft Visual Studio 8
@set FILE_NOT_FOUND=
@for %%i in (%FILE_TO_FIND%) do @if not exist "%BEID_DIR_VS_2005%\%%~i" set FILE_NOT_FOUND=%%~i
@if "%FILE_NOT_FOUND%"=="" goto find_vs2005
@echo        Not found in "%BEID_DIR_VS_2005%"

@echo [ERROR] Visual Studio 2005 could not be found
@echo         If the path is different from "C:\Program Files\Microsoft Visual Studio 8"
@echo         please define BEID_DIR_VS_2005 environment variable.
@exit /B 1

:find_vs2005
@echo        Found in "%BEID_DIR_VS_2005%"
@exit /B 0