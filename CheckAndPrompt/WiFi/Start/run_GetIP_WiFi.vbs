Set WshShell = CreateObject ("Wscript.Shell") 
WshShell.Run chr(34) & "get_ip_WiFi.bat" & Chr(34), 0
Set WshShell = Nothing