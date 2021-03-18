DOCKER_INSTALLED=$(sudo docker -v)
if [[ $DOCKER_INSTALLED == Docker* ]]
then
    echo Docker Installed
else
    echo Docker NOT installed
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
fi

sudo apt-get update

sudo cp /hub-admin-home/scripts/startup-cron-tasks /etc/cron.d/
sudo cp /hub-admin-home/scripts/miscellaneous-cron-tasks /etc/cron.d/

sudo apt-get install inotify-tools -y

sudo /hub-admin-home/scripts/setup-auto-hostspot-service.sh
sudo cp /hub-admin-home/scripts/wpa_supplicant.conf /boot/

# The following cmd sets the wifi country and actually enabled wlan0 as well
sudo raspi-config nonint do_wifi_country IN

sudo docker volume create mynode-red-vol
sudo docker login docker.swiftsense.biz
source /hub-admin-home/docker-composition/composition.env
sudo docker pull $NODE_RED_IMAGE_TAG
sudo docker logout docker.swiftsense.biz

sudo ./generic-set-hostname.sh ACCOUNTNAME BASE



