
echo "drive will be started to sync changed files" 


# ============================================
#   Sync and backup#
# ============================================

drive # start drive

# copy all .ps1 files in the C:\Users\Siebe\Documents\PowerShell folder
# Copy-Item -Recurse -Filter "*.ps1" -path "C:\Users\Siebe\Documents\PowerShell" -destination "X:\My Drive\Programs\1. New Pc machine setup\Appdata"      # powershell # not working, also copies folders

# remove all the files and folderes in the X:\My Drive\Programs\1. New Pc machine setup\Appdata\ folder:
# Remove-Item -Recurse -Path "X:\My Drive\Programs\1. New Pc machine setup\Appdata\*" -Force    

cp -Path "C:\Users\Siebe\AppData\Roaming\Everything" -Destination "X:\My Drive\Programs\1. New Pc machine setup\Appdata" -Recurse -Force # everything
Copy-Item -Recurse -path "C:\Users\Siebe\AppData\Roaming\copyq" -destination "X:\My Drive\Programs\1. New Pc machine setup\Appdata\copyq"     # copyq
# TODO leftoff only copy ps1 files, not any folders
# alternatively remove all folders in a dir, not the files


echo "pc will shut down in 15 minutes" 

# shutdown after 15 minutes
shutdown -s -t 900 

# wait 10 seconds then echo "wait is over"
sleep 600 
echo "shutdown in 5 minutes" 

exit

# cancel the shutdown
# shutdown -a