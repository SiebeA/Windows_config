## Requires -RunAsAdministrator              # This is how you ensure that the script is run as administrator

              # in powershell Double quotes are required for strings and new lines !!!


# ============================================
#   New commands for testing      
# ============================================

# cleaning up the history file
(Get-Content -Path $env:USERPROFILE\Documents\PowerShell\history.txt) -replace 'alias|leftoff', '' | Set-Content -Path $env:USERPROFILE\Documents\PowerShell\history.txt # deleting common commands; perhaps sourcing from a text file is better
(Get-Content -Path $env:USERPROFILE\Documents\PowerShell\history.txt) -replace 'hsearch .+', '' | Set-Content -Path $env:USERPROFILE\Documents\PowerShell\history.txt
(Get-Content -Path $env:USERPROFILE\Documents\PowerShell\history.txt) -replace '.+\#.*', '' | Set-Content -Path $env:USERPROFILE\Documents\PowerShell\history.txt
(Get-Content -Path "c:\Users\Siebe\Documents\PowerShell\history.txt" | Where-Object { $_.Trim() -ne "" }) | Set-Content -Path "c:\Users\Siebe\Documents\PowerShell\history.txt" # replace all empty lines with ''

#===========================================================================
# Custimize the prompt                 
# ==========================================================================
$shell = $Host.UI.RawUI # necessary for the next lines
$shell.WindowTitle = "Default"

#===========================================================================
#  Settings           
# ==========================================================================
# Set-Location "C:\Users\Siebe\Documents\PowerShell"

Set-PSReadlineOption -HistorySavePath "C:\Users\Siebe\Documents\PowerShell\history.txt" # saves the history of commands to a file

Clear-Host # remove the warning message at the beginning

# add the following paths to the $env:PSModulePath
$env:Path += ";C:\Users\Siebe\Documents\WindowsPowerShell\Powershell_scripts_Siebe" 
$env:Path += ";C:\Program Files\Google\Drive File Stream\67.0.2.0"                      # google drive
$env:Path += ";C:\Users\Siebe\AppData\Local\Programs\Microsoft VS Code\Code.exe"        # vscode

# add a program to the list of programs that can be run from the command line
$env:Path += ";C:\Program Files\Google\Drive File Stream\67.0.2.0\GoogleDriveFS.exe"    # google drive

# ============================================
#  Housekeeping ; cleaning       
# ============================================
# this removes the commands that contain a space, just like shell does automatically
$filePath = "C:\Users\Siebe\Documents\PowerShell\history.txt"
$regex = "^ .+$"
(Get-Content -Path $filePath) | Where-Object { $_ -notmatch $regex } | Set-Content -Path $filePath


###
$filePath = "C:\Users\Siebe\Documents\PowerShell\history.txt"
$lines = Get-Content -Path $filePath # read the file into an array of strings

# loop through the lines and remove the duplicates
$filteredLines = for ($i = 0; $i -lt $lines.Count; $i++) { # loop through the lines
    $currentLine = $lines[$i] # get the current line
    $nextLine = $lines[$i + 1]  # get the next line

    if ($currentLine -ne $nextLine) {   # if the current line is different from the next line
        $currentLine  # Add the current line to the filtered lines if it is different from the next line
    }
}

$filteredLines | Set-Content -Path $filePath


# ============================================
#     Import Modules    
# ============================================

Import-Module PSReadLine # for 'ctrl-r' back search etc to work
Import-Module -Name "C:\Users\Siebe\Documents\PowerShell\Modules\ProcessModule.psm1" # includes my custom made functions

#%===========================================================================
#         Aliases       
# ===========================================================================


# aliases for 2 value commands cannot be created without an intermediate function
Function gitFunction { Clear-Host; git status }
Set-Alias -Name "gs" -Value gitFunction

# allow for a parameter to be passed to the function
Function startEdge { Clear-Host; start 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' $args } # $args is the parameter that is passed to the function it is not necessary to use it
Set-Alias -Name "edge" -Value startEdge


############                Set-Alias for PROJECT-MANAGEMENT
Set-Alias -Name "aliases" -Value "X:\My Drive\Engineering\Development\SP_Project_Management\shortcuts.ps1"
Set-Alias -Name "gwrite" -Value "X:\My Drive\Engineering\Development\SP_Project_Management\write.ps1"

############                Set-Alias for COMMANDS
Set-Alias -Name "rm" -value Remove-Item
Set-Alias -Name "whereis" -value Get-Command


############                Set-Alias for custom functions
Set-Alias -Name "ts" -value tSearch
Set-Alias -Name "hs" -value hSearch
Set-Alias -Name "size-appdata" -value "X:\My Drive\Engineering\Development\SP_Project_Management\output-appData-folderSize.ps1"

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



        ## start a program

#===========================================================================
#     Messages on startup of powershell             
# ==========================================================================
write-host "This script is executed from: " -nonewline
write-host "$profile " -foreground green


Get-ChildItem | Sort-Object LastWriteTime -Descending # show the last edited files