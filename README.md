
# synopsis
This is a convenience setup for working with the:
    - Windows terminal
    - Powershell
    - Python

# folders and files
- `Microsoft.PowerShell_profile.ps1` is the main operating script; I like to think of it as the CEO of the project
- `Scripts` Include the folder with:
  - Powershell commands
  - Powershell scripts
  - Python Scripts

## for example
In the terminal, I only need to run `garmin`, which: 
- `garmin` is an alias defined in the `Microsof.Powershell_profile.ps1`:
  - Set-Alias -Name "garmin" -Value "C:\Users\Siebe\Documents\PowerShell\Scripts\get_Garmin.ps1" #py
- The `get_Garmin.ps1` sets conditions such as: 
  - loading the virtual environment that has the Python modules
  - Sourcing the environment variables: Email and login for my Garmin account
  - Run the [https://github.com/SiebeA/GarminConnect_physiologicalDataAnalysis/blob/master/garmin_automate.py](garmin.automate.py) script:
    - In the terminal, you can now easily import e.g. your steps of the last X days and having it automatically exported to `.xlsx`