## renew

```
slmgr -rearm 
```

## win10 style menu
```
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```
## disable win denfender
```
Disable-ScheduledTask -TaskPath "\Microsoft\Windows\Windows Defender" -TaskName "Windows Defender Scheduled Scan"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1
```
