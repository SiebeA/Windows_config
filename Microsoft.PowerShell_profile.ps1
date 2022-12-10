# Requires -RunAsAdministrator              # This is how you ensure that the script is run as administrator

                                                                # in powershell Double quotes are required for strings and new lines !!!

#===========================================================================
# Custimize the prompt                 
# ==========================================================================
$shell = $Host.UI.RawUI # necessary for the next lines
$shell.WindowTitle = "Default"
# $shell.BackgroundColor = "Blue"
# $shell.ForegroundColor = "White"

#===========================================================================
#  Settings           
# ==========================================================================
# Set Default location
Set-Location "C:\Users\Siebe\Documents\PowerShell"

# add the following paths to the $env:PSModulePath
$env:Path += ";C:\Users\Siebe\Documents\WindowsPowerShell\Powershell_scripts_Siebe" 
$env:Path += ";C:\Program Files\Google\Drive File Stream\67.0.2.0"                      # google drive
$env:Path += ";C:\Users\Siebe\AppData\Local\Programs\Microsoft VS Code\Code.exe"        # vscode
# add a program to the list of programs that can be run from the command line
$env:Path += "C:\Program Files\Google\Drive File Stream\67.0.2.0\GoogleDriveFS.exe"


# # synchronize the time  # not working anymore, did before
# echo "Syncing the time...`n"
# w32tm /config /syncfromflags:manual "/manualpeerlist:0.pool.ntp.org,0x1 1.pool.ntp.org,0x1 2.pool.ntp.org,0x1 3.pool.ntp.org,0x1" /reliable:yes
# w32tm /config /update # not working


#%===========================================================================
#"     Scripts to run at startup"             
# ===========================================================================

# ask user input whether they want to run or edit a script y/n/e
Function ask {param($script) # needs to be in string format
    $answer = Read-Host "Do you want to run or edit the script $script? (y/n/e)"
    if ($answer -eq "y") {
        . $script
    }
    elseif ($answer -eq "e") {
        notepad $script
    }
    else {
        Write-Host "Script $script is not run"
    }
}

#%===========================================================================
#         Aliases       
# ===========================================================================

Set-Alias -Name "leftoff" -Value "C:\Users\Siebe\Documents\PowerShell\leftoff.ps1"
Set-Alias -Name "siebe" -Value "notepad C:\Users\Siebe\Documents\WindowsPowerShell\Powershell_scripts_Siebe\leftoff.ps1" # not working
    
        ## start a program
# google drive
Function CD01 {start "C:\Program Files\Google\Drive File Stream\67.0.2.0\GoogleDriveFS.exe"}
Set-Alias -Name drive -Value CD01
Function CD02 {start "C:\Program Files\Sublime Text 3\sublime_text.exe"}
Set-Alias -Name subl -Value CD02

#===========================================================================
#     Messages on startup of powershell             
# ==========================================================================
write-host "This script is executed from: " -nonewline
write-host "$profile " -foreground green