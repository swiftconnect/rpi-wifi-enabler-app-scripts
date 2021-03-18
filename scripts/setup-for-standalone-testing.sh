# FILE=/home/dev/init.params     
FILE=/home/debian/hub-admin-home/red-hub-runtime/env.list
if [ -f $FILE ]; then
   date >> /home/debian/hub-admin-home/scripts/re-init-log

   echo "File $FILE exists." >> /home/debian/hub-admin-home/scripts/re-init-log 
   source $FILE
   echo "Sourced...starting re-init.sh..." >> /home/debian/hub-admin-home/scripts/re-init-log
   /home/debian/hub-admin-home/scripts/re-init.sh $accountName $nodeName $orgName $orgCountry $orgState $orgUnit $orgLocality $deviceSlNum 

   cat $FILE >> /home/debian/hub-admin-home/scripts/re-init-log 
   # sudo rm /home/dev/init.params
   echo "all-done" >> /home/debian/hub-admin-home/scripts/re-init-log
else
   echo "File $FILE does not exist. Nothing to do..." >> /home/debian/hub-admin-home/scripts/re-init-log
fi
