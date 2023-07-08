# this script is used to transfer files from the C:\ drive to the H:\ drive whicih I use to sync between my laptop and desktop

# TODO
# - only copy files that have changed


# check if H:\ drive exists and print if it does
if (Test-Path H:\) {
    Write-Host "H:\ drive which is USB exists"

    # record time 
    # $date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

    Write-Host "first copying the scripts"
    # check if the folder exists and if not create it
    if (!(Test-Path "H:\Documents\PowerShell")) {
        New-Item -Path "H:\Documents\PowerShell" -ItemType Directory
    }
    Copy-Item -Path "C:\Users\Siebe\Documents\PowerShell\Scripts" -Destination "H:\Documents\PowerShell" -Recurse


    Write-Host "Now on to the powershell profile"
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")# press enter to continue
    Write-Host 'continuing...'
    Write-Host "copying the powershell profile"
    Copy-Item -Path "C:\Users\Siebe\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Destination "H:\Documents\PowerShell" -Recurse
    
    # remove all folders in H:\AppData\Roaming
    Write-Host "Now on to the AppData\Roaming folder"
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")# press enter to continue
    Write-Host 'continuing...'
    Remove-Item -Path "H:\AppData\Roaming\*" -Recurse -Force
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\Sublime Text 3" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\QTranslate" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\copyq" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\.vscode" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\Everything" -Destination "H:\AppData\Roaming" -Recurse
    
    Write-Host "All finished"

    # print time it took by subtracting the time it took to copy the files from the time it took to copy the files
    # $date2 = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    # Write-Host "Time it took to copy files: " ($date2 - $date)


} else {
    Write-Host "H:\ drive does not exist"
}

