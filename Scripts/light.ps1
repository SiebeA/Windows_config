$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$regName1 = "SystemUsesLightTheme"
$regName2 = "AppsUseLightTheme"
$regName3 = "AppsUseDarkTheme"
$regValue1 = 1
$regValue2 = 0
Set-ItemProperty -Path $regPath -Name $regName1 -Value $regValue1
Set-ItemProperty -Path $regPath -Name $regName2 -Value $regValue1
Set-ItemProperty -Path $regPath -Name $regName3 -Value $regValue2

Get-Process explorer | Stop-Process -Force