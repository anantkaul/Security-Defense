@echo off

:loop

:: You should use "Wi-Fi" rather than "Network Bridge" if you have your Wi-Fi adaptor as public 
:: Network Bridge - Bridged connection (Bridge Metered or Private Network)
:: Wi-Fi - Public Network (No Bridge, only OPEN or Public)

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Network Bridge" ^| findstr "Default"') do set DefaultGateway_1=%%g
echo %DefaultGateway_1%
echo %DefaultGateway_1% > IP-1.txt
:: pause

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Network Bridge" ^| findstr "Default"') do set DefaultGateway_2=%%g
echo %DefaultGateway_2%
echo %DefaultGateway_2% > IP-2.txt
:: pause

comp IP-1.txt IP-2.txt /M
goto loop
pause
