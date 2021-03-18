# accountName=$1
# nodeName=$2

cd /hub-admin-home/docker-composition
# Create an empty init.params file to allow the build to proceed
# sudo mkdir -p /hub-admin-home/docker-composition/node-red/build/src/app1 
sudo -E docker-compose build
echo 'Done building node-red installation...'
# sudo rm -Rf /hub-admin-home/docker-composition/node-red/build/src/app1
sudo rm init.params
sudo rm .env

# $HOME/hub-admin-home/scripts/generic-update-red-hub.sh $accountName $nodeName
#
# $HOME/hub-admin-home/red-hub-runtime/generic-run.sh
# echo 'Started off node-red container...':

