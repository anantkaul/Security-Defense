result_1 = MsgBox ("Did you change the network?", vbYesNo, "ASK.ME THREAT FOUND !!")

Select Case result_1
Case vbYes
    MsgBox("Then you're safe!")
    ' "Phew... Nice Try"
Case vbNo
    Set WshShell_2 = CreateObject ("Wscript.Shell") 
    WshShell_2.Run chr(34) & "MIMConfirmed.bat" & Chr(34), 0
    Set WshShell_2 = Nothing

    result_2 = MsgBox("Do you want to Turn OFF Your WiFi to stay Protected?", vbYesNo, "ASK.ME THREAT WARNING !!")

    Select Case result_2
    Case vbYes
        Set WshShell_3 = CreateObject ("Wscript.Shell") 
        WshShell_3.Run chr(34) & "WiFi_Off.bat" & Chr(34), 0
        Set WshShell_3 = Nothing
        MsgBox("You are clever. You just saved all your PRIVATE INFORMATION !!")
        ' "ASK.ME Made You Clever !!"

    Case vbNo
        MsgBox("You are a Fool. You Don't Care about your PRIVATE INFORMATION !!")

    End Select

End Select

' MsgBox(prompt[,buttons][,title][,helpfile,context])