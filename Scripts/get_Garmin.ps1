
& "C:\Users\Siebe\venvs\.requests\Scripts\Activate.ps1" #activate the virtual environment


$env:EMAIL="siebealbers@hotmail.com"
$env:PASSWORD="Bobobalto45!"

# execute the Python script
# change the dir to : X:\My Drive\Engineering\Development\python-garminconnect
cd "X:\My Drive\Engineering\Development\python-garminconnect"

clear

python ./example.py


# while inside the example.py script:
# 8: get the step data for today
