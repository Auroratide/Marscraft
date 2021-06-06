@echo off

SET PACK_NAME=Marscraft
SET MC_RESOURCE_PACKS=%appdata%\.minecraft\resourcepacks

IF EXIST "%MC_RESOURCE_PACKS%" (
    ECHO Linking %PACK_NAME% to %MC_RESOURCE_PACKS%...
) ELSE (
    ECHO ERROR: Could not find Minecraft in its default location! Exiting.
    EXIT
)

SET PACK_LOCATION=%MC_RESOURCE_PACKS%\%PACK_NAME%

IF EXIST "%PACK_LOCATION%" (
    ECHO Found existing %PACK_NAME% pack. Removing first.
    RMDIR /S /Q "%PACK_LOCATION%"
)

MKLINK /D "%PACK_LOCATION%" "%~dp0"
