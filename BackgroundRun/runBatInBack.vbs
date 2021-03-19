Set WshShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c runGoogle.bat"
WshShell.Run strArgs, 0, false