@echo off
color c
START CMD /k "echo MiM Attacker's Details: && nmap %DefaultGateway_2%"


if not exist nmap ( mkdir nmap )
:inc
if exist nmap/nmap%COUNTER%.txt (
set /A COUNTER=%COUNTER%+1
goto inc
)
nmap %DefaultGateway_2% > nmap/nmap%COUNTER%.txt
:: -sV -T4 -O -F --version-light

pushd %~dp0
cscript SendMail.vbs