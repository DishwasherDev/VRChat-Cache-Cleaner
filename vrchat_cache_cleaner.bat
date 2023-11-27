@echo off

title VR Chat Cache Cleaner Tool

color 6
::VR Chat
echo  [Clearing VR Chat cache...]
c:
cd %localappdata%
cd ..
cd LocalLow\VRChat\VRChat
del /s /q Cache-WindowsPlayer\*
echo.

echo  +------------------------+
echo  ^|                        ^|
echo  ^|[VR Chat Cache Cleared] ^|
echo  ^|                        ^|
echo  +------------------------+
timeout /t 5

::Feel free to re-distribute/modify/improve