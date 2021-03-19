@ECHO OFF
ECHO ============================
ECHO NETWORK INFO
ECHO ============================
Set $x = ipconfig | findstr Gateway
ipconfig | findstr Gateway
:: START https://support.microsoft.com/en-us/windows/windows-10-system-requirements-6d4e9a79-66bf-7950-467c-795cf0386715
PAUSE