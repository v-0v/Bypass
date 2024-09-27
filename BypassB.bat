
Set-MpPreference -DisableRealtimeMonitoring $true


Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent 2


Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1


Stop-Service -Name WinDefend -Force
Set-Service -Name WinDefend -StartupType Disabled


Write-Host "Windows Defender has been disabled."
