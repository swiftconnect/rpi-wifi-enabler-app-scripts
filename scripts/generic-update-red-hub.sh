initParamsFile=$1
source $initParamsFile

# sudo docker build -t swiftsense/red-hub $HOME/hub-admin-home/scripts/nodered-4swiftconnect
# echo 'Done building node-red installation...'

sudo docker stop mynodered
sudo docker rm mynodered

# If this node is associated with an org that has a default node red app - lets clone it from git into the projects folder
nodeRedProjFolder=/hub-admin-home/docker-composition/node-red/container-data/projects/app1
sudo rm -Rf $nodeRedProjFolder
sudo git clone $gitUrlForRedApp1Repo $nodeRedProjFolder

cd /hub-admin-home/docker-composition
sudo docker-compose up -d --build
echo 'Started off node-red container...' 
# sudo docker ps -a >> $HOME/hub-admin-home/scripts/re-init-log


