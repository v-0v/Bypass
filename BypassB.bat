# تعطيل الحماية في الوقت الحقيقي
Set-MpPreference -DisableRealtimeMonitoring $true

# تعطيل الحماية السحابية وإرسال العينات تلقائيًا
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent 2

# تعطيل Windows Defender من الريجستري
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1

# إيقاف خدمة Windows Defender وتعطيلها
Stop-Service -Name WinDefend -Force
Set-Service -Name WinDefend -StartupType Disabled

# تأكيد التنفيذ
Write-Host "Windows Defender has been disabled."
