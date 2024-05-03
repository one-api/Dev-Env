Disable-ScheduledTask -TaskPath "\Microsoft\Windows\Windows Defender" -TaskName "Windows Defender Scheduled Scan"

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1
