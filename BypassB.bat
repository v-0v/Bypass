@echo off
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -Command "Set-MpPreference -MAPSReporting Disabled"
powershell -Command "Set-MpPreference -SubmitSamplesConsent 2"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -Value 1"
powershell -Command "Stop-Service -Name WinDefend -Force"
powershell -Command "Set-Service -Name WinDefend -StartupType Disabled"
echo Windows Defender has been disabled.
