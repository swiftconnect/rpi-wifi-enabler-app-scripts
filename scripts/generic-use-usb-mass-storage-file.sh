logger SwiftLog - Setting up usb_mass_storage at /hub-admin-home/usb-mass-storage
sudo losetup -o1048576 /dev/loop0 /hub-admin-home/scripts/loop.fs         
sudo losetup -a
sudo mkdir -p /hub-admin-home/usb-mass-storage
sudo mount -t vfat /dev/loop0 /hub-admin-home/usb-mass-storage
logger SwiftLog - Success Setting up usb_mass_storage at /hub-admin-home/usb-mass-storage

