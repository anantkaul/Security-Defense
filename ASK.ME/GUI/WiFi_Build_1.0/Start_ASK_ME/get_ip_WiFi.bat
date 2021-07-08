@echo off

title ASKME
set /A COUNTER=1

:loop
:: cd src
if not exist IP ( mkdir IP )

:: You should use "Wi-Fi" rather than "Network Bridge" if you have your Wi-Fi adaptor as PUBLIC 
:: Network Bridge - Bridged connection (Bridge Metered or PRIVATE Network)
:: Wi-Fi - PUBLIC Network (No Bridge, only OPEN or PUBLIC)

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Wi-Fi" ^| findstr "Default"') do set DefaultGateway_1=%%g
for /f "tokens=1 delims=:" %%h in ('arp -a %DefaultGateway_1%') do set DefaultGateway_11=%%h
echo %DefaultGateway_11%
echo %DefaultGateway_11% > IP/IP-1.txt
:: pause

:: Giving delay of 3 (n) seconds
timeout -t 3 /nobreak

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Wi-Fi" ^| findstr "Default"') do set DefaultGateway_2=%%g
for /f "tokens=1 delims=:" %%h in ('arp -a %DefaultGateway_2%') do set DefaultGateway_21=%%h
echo %DefaultGateway_21%
echo %DefaultGateway_21% > IP/IP-2.txt
:: pause
if "%DefaultGateway_21%" == "No ARP Entries Found." goto loop

:: Compare both the IP Addresses
cd IP

:: if "%DefaultGateway_11%" == "No ARP Entries Found." goto loop

FC /B IP-1.txt IP-2.txt

FC IP-1.txt IP-2.txt > nul
if errorlevel 1 goto error
cd ..

:: Go back to loop
goto loop

:error
cd ..

start cmd /k "echo Your Default Gateway MAC has been changed to %DefaultGateway_21:~20,24%"

start "ASK_ME_Prompt_Starter" cscript start_prompt_starter.vbs
goto loop

pause