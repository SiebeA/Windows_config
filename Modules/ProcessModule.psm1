
function tSearch { # aka "text-file search function"
        param(
            [string]$FilePath,
            [string]$SearchPattern
        )
    
        Get-Content $FilePath | Select-String $SearchPattern
    }

function hSearch {
    <#
        aka "history search function"
Synopsis
    This function searches the history.txt file for a given string

    #>
    param(
        [string]$SearchPattern
    )

    Get-Content "C:\Users\Siebe\Documents\PowerShell\history.txt" | Select-String $SearchPattern
}

# function htaill 
function htail {
    param(
        [Parameter(Mandatory=$false, Position=1)]
        [string]$FilePath = "C:\Users\Siebe\Documents\PowerShell\history.txt",
        
        [Parameter(Mandatory=$false, Position=0)]
        [int]$Lines = 10
    )

    Get-Content -Tail $Lines $FilePath

}

function stopProcess {
    param(
        [string]$ProcessName
    )

    Stop-Process -Name $ProcessName
}

