Set WshShell_1 = CreateObject ("Wscript.Shell") 
WshShell_1.Run chr(34) & "prompt_starter.bat" & Chr(34), 0
Set WshShell_1 = Nothing