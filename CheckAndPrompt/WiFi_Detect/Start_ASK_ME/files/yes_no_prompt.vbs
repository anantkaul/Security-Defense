result = MsgBox ("Did you change the network?", vbYesNo, "ASK.ME FOUND")

Select Case result
Case vbYes
    MsgBox("Then you're safe!")
Case vbNo
    Set WshShell = CreateObject ("Wscript.Shell") 
    WshShell.Run chr(34) & "MIMConfirmed.bat" & Chr(34), 0
    Set WshShell = Nothing
End Select

' MsgBox(prompt[,buttons][,title][,helpfile,context])