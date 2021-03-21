@echo off
color c
title Killing_All

for /f "tokens=2 delims= " %%a in ('tasklist /v ^| findstr "ASKME"') do taskkill /f /pid %%a

:: tasklist /fi "imagename eq get_ip_WiFi.bat"
pause