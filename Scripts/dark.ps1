$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$regName = "SystemUsesLightTheme"
$regValue = 0
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue

Get-Process explorer | Stop-Process -Force
