
:: Choice 1
Set objEmail = CreateObject("CDO.Message")
objEmail.From = "your@address.com"
objEmail.To = "destination@address.com"
objEmail.Subject = "Server is down!"
objEmail.Textbody = "Server100 is no longer accessible over the network."
objEmail.Send(objEmail.From, objEmail.To, objEmail.Subject, objEmail.Textbody)

:: Choice 2
Set objMail = CreateObject("CDO.Message")
Set objConf = CreateObject("CDO.Configuration")
Set objFlds = objConf.Fields
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.your-site-url.com" 'your smtp server domain or IP address goes here
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'default port for email
'uncomment next three lines if you need to use SMTP Authorization
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "your-username"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "your-password"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'cdoBasic
objFlds.Update
objMail.Configuration = objConf
objMail.FromName = "Your Name"
objMail.From = "your@address.com"
objMail.To = "destination@address.com"
objMail.Subject = "Email Subject Text"
objMail.TextBody = "The message of the email..."
objMail.Send
Set objFlds = Nothing
Set objConf = Nothing
Set objMail = Nothing