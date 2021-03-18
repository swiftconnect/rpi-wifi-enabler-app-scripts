df -ahm | grep /dev/mmcblk1p1 | awk '{OFS="";print $3,0,0,0,0,0,0}' > /home/debian/hub-admin-home/red-hub-runtime/container-data/host-used-storage
df -ahm | grep /dev/mmcblk1p1 | awk '{OFS="";print $2,0,0,0,0,0,0}' > /home/debian/hub-admin-home/red-hub-runtime/container-data/host-total-storage
