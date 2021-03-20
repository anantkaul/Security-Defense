Set WshShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c runGoogle.bat"
WshShell.run strArgs, 0, false