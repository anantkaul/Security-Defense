Set WshShell = CreateObject ("Wscript.Shell") 
:: Dim strArgs
:: strArgs = "cmd /c get_ip_NetworkBridge.bat"
:: WshShell.run strArgs, 0, false

 
WshShell.Run chr(34) & "get_ip_NetworkBridge.bat" & Chr(34), 0
Set WshShell = Nothing