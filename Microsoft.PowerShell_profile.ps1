## Requires -RunAsAdministrator              # This is how you ensure that the script is run as administrator

                                                                # in powershell Double quotes are required for strings and new lines !!!


#===========================================================================
# Custimize the prompt                 
# ==========================================================================
$shell = $Host.UI.RawUI # necessary for the next lines
$shell.WindowTitle = "Default"

#===========================================================================
#  Settings           
# ==========================================================================
# Set Default location
# Set-Location "C:\Users\Siebe\Documents\PowerShell"

# for 'ctrl-r' back search etc to work
Import-Module PSReadLine
Clear-Host # remove the warning message at the beginning


# add the following paths to the $env:PSModulePath
$env:Path += ";C:\Users\Siebe\Documents\WindowsPowerShell\Powershell_scripts_Siebe" 
$env:Path += ";C:\Program Files\Google\Drive File Stream\67.0.2.0"                      # google drive
$env:Path += ";C:\Users\Siebe\AppData\Local\Programs\Microsoft VS Code\Code.exe"        # vscode

# add a program to the list of programs that can be run from the command line
$env:Path += ";C:\Program Files\Google\Drive File Stream\67.0.2.0\GoogleDriveFS.exe"    # google drive



# # synchronize the time  # not working anymore, did before
# echo "Syncing the time...`n"
# w32tm /config /syncfromflags:manual "/manualpeerlist:0.pool.ntp.org,0x1 1.pool.ntp.org,0x1 2.pool.ntp.org,0x1 3.pool.ntp.org,0x1" /reliable:yes
# w32tm /config /update # not working



#%===========================================================================
#         Aliases       
# ===========================================================================

############ Set-Alias for MISC
# Set-Alias -Name "profile" -Value "C:\Users\Siebe\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

###                     Set-Alias for information / text output

# Set-Alias -Name "shortcuts" -Value "Get-Content 'C:\Users\Siebe\Documents\shortcuts_for_terminal and WIN R.txt'"

# Set-Alias -Name "search" -Value Get-Content 'C:\Users\Siebe\Documents\PowerShell\history.txt') | Select-String '{}'

## not working
# function search([string]$input)
# {
#     Get-Content 'C:\Users\Siebe\Documents\PowerShell\history.txt' | Select-String {$input}
# }

############                Set-Alias for PROJECT-MANAGEMENT
Set-Alias -Name "aliases" -Value "X:\My Drive\Engineering\Development\SP_Project_Management\shortcuts.ps1"
Set-Alias -Name "leftoff" -Value "X:\My Drive\Engineering\Development\SP_Project_Management\leftoff_windows.ps1"
Set-Alias -Name "gwrite" -Value "X:\My Drive\Engineering\Development\SP_Project_Management\write.ps1"

############                Set-Alias for COMMANDS
Set-Alias -Name "rm" -value Remove-Item
Set-Alias -Name "whereis" -value Get-Command

############                Set-Alias for PROGRAMS
Set-Alias -Name "gd" -Value GoogleDriveFS
Set-Alias -Name "tm" -value Taskmgr
Set-Alias -Name "subl" -Value sublime_text

############                Set-Alias for PROCESSES
Set-Alias -Name "sync" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\sync-shutdown.ps1"

############                Set-Alias for WORK-SPACES
Set-Alias -Name "spanish" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\spanish.ps1"  # runs a script that starts programs and opens file relevant to spanish
############                Set-Alias for PYTHON-SCRIPTS
# howto: create a ps1 file that runs the python script, and add that to the path
Set-Alias -Name "verbos" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\verbos.ps1"  #py
Set-Alias -Name "translate" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\.translate.ps1" #py

Set-Alias -Name "garmin" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\get_Garmin.ps1" #py

# TODO I need to redo: problem is that I cannot provide the argument to the extension, when I'm in a differnet folder from which the script is positioned (even when it's added to the path)
Set-Alias -Name "underscore" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\.replace_underscores_for_extension.ps1" #py
Set-Alias -Name "findall" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\findall.ps1" #py
## Automated process to make a python script executionable anywhere in the terminal:
# "python 'X:\My Drive\Engineering\Python\custom_scripts\siebe_customfunctions\EDIT.py'" | Out-File "C:\Users\Siebe\Documents\PowerShell\Scripts\EDIT.ps1"


#%===========================================================================
#"     Scripts to run at startup"             
# ===========================================================================

## ask for user input
# $request = Read-Host "Enter whether you want to see the TODO or Edit: {y}"

# if ($request -eq 'y') { 
#     code "C:\Users\Siebe\Documents\PowerShell\Leftoff\todo.md"
# }



        ## start a program

#===========================================================================
#     Messages on startup of powershell             
# ==========================================================================
write-host "This script is executed from: " -nonewline
write-host "$profile " -foreground green

# write-host "
# Expiration-date:

# leftoff at:


# " -foreground blue

Set-PSReadlineOption -HistorySavePath "C:\Users\Siebe\Documents\PowerShell\history.txt"