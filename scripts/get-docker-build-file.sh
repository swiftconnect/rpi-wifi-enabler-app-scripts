

PLATFORM=$(./get-platform.sh)
DOCKERFILE=" Docker file not found"
if [ "$PLATFORM" == "PC" ] ;then DOCKERFILE="Dockerfile.x86"
fi
if [ "$PLATFORM" == "Beaglebone" ] ;then DOCKERFILE="Dockerfile.bb"
fi
if [ "$PLATFORM" == "Raspberry Pi" ]  ;then DOCKERFILE="Dockerfile.4rpi"
fi
echo $DOCKERFILE
