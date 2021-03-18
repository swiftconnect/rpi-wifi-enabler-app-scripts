initParamsFile=$1
source $initParamsFile

# sudo docker build -t swiftsense/red-hub $HOME/hub-admin-home/scripts/nodered-4swiftconnect
# echo 'Done building node-red installation...'

sudo docker stop mynodered
sudo docker rm mynodered

# If this node is associated with an org that has a default node red app - lets clone it from git into the projects folder
nodeRedProjFolder=/home/debian/hub-admin-home/red-hub-runtime/container-data/projects/app1
sudo rm -Rf $nodeRedProjFolder
git clone $gitUrlForRedApp1Repo $nodeRedProjFolder

/home/debian/hub-admin-home/red-hub-runtime/run.sh
echo 'Started off node-red container...' >> /home/debian/hub-admin-home/scripts/re-init-log
sudo docker ps -a >> /home/debian/hub-admin-home/scripts/re-init-log


