accountName=$1
nodeName=$2
newHostName=$nodeName-$accountName

sudo hostnamectl set-hostname $newHostName

cd /hub-admin-home/scripts
sudo cp etc-hosts-template hosts
sudo sed -e "s/\${newHostName}/$newHostName/g" --in-place hosts
sudo mv hosts /etc/

