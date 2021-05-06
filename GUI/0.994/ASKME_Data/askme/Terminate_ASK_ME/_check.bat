@echo off
color c
title Checking

for /f "tokens=2 delims= " %%a in ('tasklist /v ^| findstr "ASKME-IDS"') do set terminate=%%a
echo %terminate%
echo %terminate% > processID.txt