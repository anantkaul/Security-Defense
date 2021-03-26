@echo off

if not exist nmap ( mkdir nmap )
:inc
if exist nmap/nmap%COUNTER%.txt (
set /A COUNTER=%COUNTER%+1
goto inc
)
nmap -T4 %DefaultGateway_2%/24 > nmap/nmap%COUNTER%.txt
:: -sV -T4 -O -F --version-light

:: pause

pushd %~dp0
cscript SendMail.vbs


