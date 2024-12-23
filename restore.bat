@ECHO off

:restorepoint

echo.
echo [-] Restore Point
echo.
chcp 437 > nul
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "DisableConfig" /f
Reg.exe  add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f 
powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\', 'D:\', 'E:\', 'F:\', 'G:\' 
powershell -ExecutionPolicy Unrestricted -NoProfile Checkpoint-Computer -Description 'Luxtweaks Restore Point' 