Set emailObj      = CreateObject("CDO.Message")
emailObj.From     = "ask.me.mitm@gmail.com"

emailObj.To       = "ask.me.mitm@gmail.com"


Function GetRecentFile()
  scriptdir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
  scriptdir = scriptdir & "\nmap"
  Dim fso, file
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set GetRecentFile = Nothing
  For Each file in fso.GetFolder(scriptdir).Files
    If GetRecentFile is Nothing Then
      Set GetRecentFile = file
    ElseIf file.DateLastModified > GetRecentFile.DateLastModified Then
      Set GetRecentFile = file
    End If
  Next
End Function

Dim recentFile
Set recentFile = GetRecentFile()
' MsgBox(recentFile)

Set filestreamIn = CreateObject("Scripting.FileSystemObject").OpenTextFile(recentFile,1)
dim strLine
strLine = ""
Do Until filestreamIn.AtEndOfStream
    strLine = strLine & (filestreamIn.ReadLine) & vbcrlf
Loop

emailObj.Subject  = "ASK.ME TEST"
emailObj.TextBody = strLine

Set emailConfig = emailObj.Configuration

emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing")    = 2  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl")      = true 
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername")    = "ask.me.mitm@gmail.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword")    = "maninthemiddle"
emailConfig.Fields.Update

emailObj.Send()

If err.number = 0 then Msgbox "Mail Sent"