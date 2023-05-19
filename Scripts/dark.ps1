$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$regName1 = "SystemUsesLightTheme"
$regName2 = "AppsUseLightTheme"
$regValue = 0

Set-ItemProperty -Path $regPath -Name $regName1 -Value $regValue
Set-ItemProperty -Path $regPath -Name $regName2 -Value $regValue

Get-Process explorer | Stop-Process -Force
