#!/bin/bash

fixedVal="armv6l"
paramVal=`uname -m`
PLATFORM=$(uname -m)
if [ $PLATFORM == "armv6l" ] ;then MACHINE="Raspberry Pi"
fi
if [ $PLATFORM == "x86_64" ] ;then MACHINE="PC" 
fi
if [ $PLATFORM == "armv7l" ] ;then  MACHINE="Beaglebone" 
fi
echo "$MACHINE"
