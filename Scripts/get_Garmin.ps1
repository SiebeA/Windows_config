& "C:\Users\Siebe\venvs\.requests\Scripts\Activate.ps1" # Activate the virtual environment that contains the modules used in the python script

# Source the configuration file for the email and password
. .\config.ps1

Set-Location "X:\My Drive\Engineering\Development\python-garminconnect"

Clear-Host

# Set the environment variables from the configuration file
$env:EMAIL = $EMAIL
$env:PASSWORD = $PASSWORD

python ./garmin_automate.py
# python ./example.py

# While inside the example.py script:
# 8: get the step data for today
