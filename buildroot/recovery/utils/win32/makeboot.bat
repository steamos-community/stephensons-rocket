@echo off
rem This batch file was modified by Steven Shiau.
rem The original one is from PDLA http://pendrivelinux.com
rem This batch file was created by ©2007 PDLA http://pendrivelinux.com
cd /d "%~dp0"
cls
echo -----------------------------------------------------------------
echo This batch file will prepare drive %~d0 for boot using syslinux!
echo -----------------------------------------------------------------
echo.
echo.
echo --------------------- WARNING!: ---------------------------------
echo.
echo Run this file from your portable USB device ONLY.
echo Running this file from your hard drive may overwrite your current
echo Master Boot Record (MBR) and render your Windows Operating System
echo un-bootable. YOU HAVE BEEN WARNED!
echo.
echo This batch file is offered in hopes that it will be useful and
echo comes with absolutely no warranty. USE AT YOUR OWN RISK!
echo.
echo -----------------------------------------------------------------
echo.
echo %~d0 | "%windir%\system32\findstr.exe" /B /I "%systemdrive%" && echo You can _NOT_ RUN makeboot.bat from your local system hard drive! It should only be run from your USB flash drive or USB hard drive. && goto end
echo.
echo Press any key to make drive %~d0 bootable
echo or close this window to abort...
pause > nul
cls

syslinux.exe -mafi %~d0
echo.
echo ~~~~~~~~ Congratulations ~~~~~~~
echo.
echo The hidden file ldlinux.sys has been installed
echo Your %~d0 drive should now be bootable.
echo //NOTE// If your USB flash drive fails to boot (maybe buggy BIOS), try to use "syslinux -sfmar %~d0".
echo.
echo.
:end
cd /d %systemdrive%
echo Press any key to exit this window!
pause > nul

