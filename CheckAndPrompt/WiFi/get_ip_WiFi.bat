@echo off

title ASKME
set /A COUNTER=1

:loop

:: You should use "Wi-Fi" rather than "Network Bridge" if you have your Wi-Fi adaptor as PUBLIC 
:: Network Bridge - Bridged connection (Bridge Metered or PRIVATE Network)
:: Wi-Fi - PUBLIC Network (No Bridge, only OPEN or PUBLIC)

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Wi-Fi" ^| findstr "Default"') do set DefaultGateway_1=%%g
echo %DefaultGateway_1%
echo %DefaultGateway_1% > IP-1.txt
:: pause

:: Giving delay of 3 (n) seconds
timeout -t 3 /nobreak

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Wi-Fi" ^| findstr "Default"') do set DefaultGateway_2=%%g
echo %DefaultGateway_2%
echo %DefaultGateway_2% > IP-2.txt
:: pause

:: Compare both the IP Addresses
FC /B IP-1.txt IP-2.txt

FC IP-1.txt IP-2.txt > nul
if errorlevel 1 goto error

:: Go back to loop
goto loop

:error
START CMD /k "echo MiM Attacker's Details: && nmap %DefaultGateway_2%"
pushd %~dp0
cscript SendMail.vbs

if not exist nmap ( mkdir nmap )
:inc
if exist nmap/nmap%COUNTER%.txt (
set /A COUNTER=%COUNTER%+1
goto inc
)
nmap %DefaultGateway_2% > nmap/nmap%COUNTER%.txt

:: -sV -T4 -O -F --version-light
goto loop

pause