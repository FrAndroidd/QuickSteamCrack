@echo off

:: Sets the window title to QuickSteamCrack and window size to 51x16
title QuickSteamCrack
mode con: cols=51 lines=19
cls


echo ---------------------------------------------------
::::         ____        _      __   _____ ______
::::        / __ \__  __(_)____/ /__/ ___// ____/
::::       / / / / / / / / ___/ //_/\__ \/ /
::::      / /_/ / /_/ / / /__/ , < ___/ / /___
::::      \___\_\__,_/_/\___/_/|_|/____/\____/

:: Displays the QuickSC text ASCII art, ignoring special characters.
for /f "delims=: tokens=*" %%A in ('findstr /b :::: "%~f0"') do @echo(%%A
echo.
echo       Script by FrAndroid - Crack by Goldberg
echo ---------------------------------------------------
echo.
echo Enter the full game path:
set /p gamedir=
echo.
echo Enter the game name:
set /p gamename=
echo.
echo Enter the game's Steam AppID (optional):
set /p appid=

:: Sets the window title to show Cracking status and window size to 42x1
mode con: cols=42 lines=1
title QuickSteamCrack - Cracking...
cls

:: Copies the game from Steam to the current directory,
:: copies the steam_api(64).dll file to a temporary folder
:: and moves the cracked DLL
xcopy "%gamedir%" "%gamename%" /e /i
set dlldir=aaaaaaaaaaaaa
set dlldir64=aaaaaaaaaaaaaaa
for /r "%gamename%" %%a in (steam_api.dll) do (
    if exist "%%a" (
        set dlldir=%%a))
for /r "%gamename%" %%a in (steam_api64.dll) do (
    if exist "%%a" (
        set dlldir64=%%a))
mkdir "%gamename%/QuickSC"
move "%dlldir%" %gamename%/QuickSC"
move "%dlldir64%" "%gamename%/QuickSC"
xcopy steam_api.dll "%dlldir:~0,-13%" /i /y
xcopy steam_api64.dll "%dlldir64:~0,-15%" /i /y

:: Temporarily copies the InterfaceGen.exe file to the
:: temp folder (yes I know this is inefficient asf)
:: and uses it to get the steam_interfaces.txt from the DLL
xcopy InterfacesGen.exe "%gamename%/QuickSC" /i
cd "%gamename%/QuickSC"
echo %appid% > steam_appid.txt
start InterfacesGen.exe steam_api.dll
start InterfacesGen.exe steam_api64.dll
cls
timeout /t 1 /nobreak > NUL

:: Moves all files where they should be and removes temp folder
move ./steam_appid.txt "%dlldir:~0,-13%"
move ./steam_interfaces.txt "%dlldir:~0,-13%"
move ./steam_appid.txt "%dlldir64:~0,-15%"
move ./steam_interfaces.txt "%dlldir64:~0,-15%"
cd ..
rd QuickSC /s /q

:: End of script
title QuickSteamCrack - Done!
mode con: cols=51 lines=13
cls
echo ---------------------------------------------------
echo                ____                   __
echo               / __ \____  ____  ___  / /
echo              / / / / __ \/ __ \/ _ \/ /
echo             / /_/ / /_/ / / / /  __/_/
echo            /_____/\____/_/ /_/\___(_)
echo.
echo       Script by FrAndroid - Crack by Goldberg
echo ---------------------------------------------------
echo.
echo.
pause