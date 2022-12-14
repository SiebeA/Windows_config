
echo "drive will be started to sync changed files" 


# ============================================
#   Sync and backup#
# ============================================

drive # start drive
cp -Path "C:\Users\Siebe\AppData\Roaming\Everything" -Destination "X:\My Drive\Programs\1. New Pc machine setup\Appdata" -Recurse -Force # everything
# copyq
# sublime




echo "pc will shut down in 15 minutes" 

# shutdown after 15 minutes
shutdown -s -t 900 

# wait 10 seconds then echo "wait is over"
sleep 600 
echo "shutdown in 5 minutes" 

exit

# cancel the shutdown
# shutdown -a