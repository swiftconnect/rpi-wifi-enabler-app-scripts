#!/bin/bash
FILE=/hub-admin-home/docker-composition/node-red/cfg/init.params
logger SwiftSense Checking if $FILE exists...
if [ -f $FILE ]; then

   # STEP1
   logger SwiftSense $FILE exists - use it to reinitialize the certs, node
   source $FILE
   sudo mv /hub-admin-home/docker-composition/node-red/cfg/init.params /hub-admin-home/docker-composition/node-red/cfg/.env 
   curl -X POST -H "Content-Type: application/json" \
    -d '{"totalSteps": 6, "lastExecutedStepDetails": {"index": 1, "name": "Process init params", "error": "", "description": "Received init params - saved..."}}' \
    http://localhost:1880/api/v1/init-process/status

   # STEP2
   logger SwiftSense Setting up wireless networking... 
   sudo rm /etc/wpa_supplicant/wpa_supplicant.conf
   logger SwiftSense Removed any exising wpa_supplicant file
   sudo sed -e "s/#WIFI_SSID/$param0/g" -e  "s/#WIFI_PSSWD/$param1/g" /hub-admin-home/scripts/wpa_supplicant.conf.template | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
   logger SwiftSense Created new wpa_supplicant file based on template...
   sudo /hub-admin-home/scripts/auto-hotspot.sh
   logger SwiftSense Wifi hotspot setup done... 
   curl -X POST -H "Content-Type: application/json" \
    -d '{"totalSteps": 6, "lastExecutedStepDetails": {"index": 2, "name": "Wifi Setup", "error": "", "description": "Executed wifi setup steps..."}}' \
    http://localhost:1880/api/v1/init-process/status

   # STEP3
   /hub-admin-home/scripts/generic-set-hostname.sh $accountName $nodeName
   logger SwiftSense  "Done changing hostname..."
   curl -X POST -H "Content-Type: application/json" \
    -d '{"totalSteps": 6, "lastExecutedStepDetails": {"index": 3, "name": "Hostname Change", "error": "", "description": "Hostname changed..."}}' \
    http://localhost:1880/api/v1/init-process/status

else
   logger SwiftSense File $FILE does not exist. Nothing to do...
fi


