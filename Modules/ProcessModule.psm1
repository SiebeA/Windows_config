
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
        Synopsis:
            This function searches the history.txt file for a given string
        #>
        param(
            [string]$SearchPattern
        )
    
        $matches = Get-Content "C:\Users\Siebe\Documents\PowerShell\history.txt" | Select-String $SearchPattern
    
        # Check if there are more than 20 matches, then output only the last 20 matches
        if ($matches.Count -gt 20) { # gt = greater than
            $matches | Select-Object -Last 20
        } else {
            $matches
        }
    }

function stopProcess {
    param(
        [string]$ProcessName
    )

    Stop-Process -Name $ProcessName
}

