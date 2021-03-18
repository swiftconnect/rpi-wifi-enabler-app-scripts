#------------SETUP HOTSPOT:START----
sudo apt-get install hostapd
sudo apt-get install dnsmasq

sudo systemctl unmask hostapd
sudo systemctl disable hostapd
sudo systemctl disable dnsmasq

sudo cp /hub-admin-home/scripts/default-hostapd.template /etc/default/hostapd
sudo cp /hub-admin-home/scripts/etc-dnsmasq.conf.template /etc/dnsmasq.conf
sudo cp /hub-admin-home/scripts/auto-hotspot.service /etc/systemd/system/
sudo cp /hub-admin-home/scripts/dhcpcd.conf /etc/dhcpcd.conf

sudo systemctl enable auto-hotspot.service

#------------SETUP HOTSPOT:END----

