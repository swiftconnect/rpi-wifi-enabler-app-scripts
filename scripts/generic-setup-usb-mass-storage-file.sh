#-----------------------------------
# Tear down a previously setup file
#-----------------------------------
sudo umount /dev/loop0
sudo losetup -d /dev/loop0
sudo rm /hub-admin-home/scripts/loop.fs
sudo rm -Rf /hub-admin-home/usb-mass-storage
logger SwiftLogger Done trying to tear down an existing sparse file

sudo dd if=/dev/zero of=/hub-admin-home/scripts/loop.fs bs=1M count=1

sudo losetup loop0 /hub-admin-home/scripts/loop.fs
# sudo losetu /dev/loop0 /hub-admin-home/scripts/loop.fs
sudo losetup -a
sudo mkfs.vfat /dev/loop0
logger SwiftLogger Done creating loop device and formatted for DOS
