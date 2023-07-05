# this script is used to transfer files from the C:\ drive to the H:\ drive whicih I use to sync between my laptop and desktop

# TODO
# - only copy files that have changed


# check if H:\ drive exists and print if it does
if (Test-Path H:\) {
    Write-Host "H:\ drive which is USB exists"

    # record time 
    # $date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

    # remove all folders in H:\AppData\Roaming
    Remove-Item -Path "H:\AppData\Roaming\*" -Recurse -Force
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\Sublime Text 3" -Destination "H:\AppData\Roaming" -Recurse
    Write-Host "Sublime finished"
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\QTranslate" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\copyq" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\.vscode" -Destination "H:\AppData\Roaming" -Recurse
    Copy-Item -Path "C:\Users\Siebe\AppData\Roaming\Everything" -Destination "H:\AppData\Roaming" -Recurse

    # print time it took by subtracting the time it took to copy the files from the time it took to copy the files
    # $date2 = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    # Write-Host "Time it took to copy files: " ($date2 - $date)

} else {
    Write-Host "H:\ drive does not exist"
}

