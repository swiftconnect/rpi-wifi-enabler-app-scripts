sudo route add default gw 192.168.7.1
sudo echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
sudo /etc/init.d/networking force-reload
