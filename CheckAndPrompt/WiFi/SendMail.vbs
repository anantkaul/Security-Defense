Set emailObj      = CreateObject("CDO.Message")
emailObj.From     = "ask.me.mitm@gmail.com"

emailObj.To       = "ask.me.mitm@gmail.com"

emailObj.Subject  = "ASK.ME TEST"
emailObj.TextBody = "ASK.ME TEST REPORT"

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

If err.number = 0 then Msgbox "Done"