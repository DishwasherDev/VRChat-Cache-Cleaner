@echo off

set "default_vrchat_location=%LocalAppData%Low\VRChat\VRChat"

if "%1"=="" (
    set "vrchat_location=%default_vrchat_location%"
) else (
    set "vrchat_location=%1"
)

if not exist "%vrchat_location%" (
    echo VRChat installation not found. Please select the VRChat installation folder.
    set "vrchat_location="
    setlocal enabledelayedexpansion
    for /f "delims=" %%I in ('powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog; $folderBrowser.RootFolder = [System.Environment+SpecialFolder]::MyComputer; $folderBrowser.Description = 'Select VRChat Installation Folder'; $folderBrowser.SelectedPath = (Get-Item -LiteralPath '.').FullName; $folderBrowser.ShowDialog(); $folderBrowser.SelectedPath}"') do set "vrchat_location=%%I"
    endlocal
    if not exist "%vrchat_location%" (
        echo VRChat installation not selected. Exiting script.
        timeout /t 5
        exit /b 1
    )
)

title VR Chat Cache Cleaner Tool

color 6
::VR Chat
echo  [Clearing VR Chat cache...]
cd /d "%vrchat_location%"
for /f %%I in ('dir /b /a-d /s Cache-WindowsPlayer\*') do del /q "%%I"
for /d %%I in (Cache-WindowsPlayer\*) do rd /s /q "%%I"
echo.

echo  +------------------------+
echo  ^|                        ^|
echo  ^|[VR Chat Cache Cleared] ^|
echo  ^|                        ^|
echo  +------------------------+
timeout /t 5

::Feel free to re-distribute/modify/improve
