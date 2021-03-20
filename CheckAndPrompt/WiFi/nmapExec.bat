@echo off
for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Wi-Fi" ^| findstr "Default"') do set DefaultGateway_2=%%g
nmap %DefaultGateway_2%
pause