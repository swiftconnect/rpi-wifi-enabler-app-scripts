#--------------
# Remove node-red
#---------------
# sudo systemctl stop node-red.service
# sudo systemctl disable node-red.service
# sudo systemctl disable node-red.socket
# sudo systemctl stop node-red.socket


#-------------------------------------
# Remove cloud9
#-------------------------------------
sudo systemctl stop cloud9.service
sudo systemctl stop cloud9.socket
sudo systemctl disable cloud9.service
sudo systemctl disable cloud9.socket
sudo rm -rf /var/lib/cloud9
sudo rm -rf /opt/cloud9
sudo rm /etc/default/cloud9
sudo rm /lib/systemd/system/cloud9.*

#-------------------------------------------
# Remove bonescript
#------------------------------------------
sudo systemctl stop bonescript-autorun.service
sudo systemctl stop bonescript.service
sudo systemctl stop bonescript.socket
sudo systemctl disable bonescript.service
sudo systemctl disable bonescript.socket
sudo systemctl disable bonescript-autorun.service
sudo rm /lib/systemd/system/bonescript*
sudo rm -rf /usr/local/lib/node_modules/bonescript

# echo 'Removed stuff that may interfere with our nodered installation...'

sudo apt-get purge xrdp
sudo apt-get purge apache2 apache2-mpm-worker apache2-utils apache2.2-bin apache2.2-common
sudo apt-get autoremove

