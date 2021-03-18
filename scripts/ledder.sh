#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

LED3_PATH=/sys/class/leds/beaglebone:green:usr3
LED2_PATH=/sys/class/leds/beaglebone:green:usr2
LED1_PATH=/sys/class/leds/beaglebone:green:usr1
LED0_PATH=/sys/class/leds/beaglebone:green:usr0

# Example bash function
function removeTrigger3 {
  echo "none" >> "$LED3_PATH/trigger"
}
function removeTrigger2 {
  echo "none" >> "$LED2_PATH/trigger"
}
function removeTrigger1 {
  echo "none" >> "$LED1_PATH/trigger"
}
function removeTrigger0 {
  echo "none" >> "$LED0_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash or status  \n e.g. bashLED on "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger3
  removeTrigger2
  removeTrigger1
  removeTrigger0
  echo "1" >> "$LED3_PATH/brightness"
  echo "1" >> "$LED2_PATH/brightness"
  echo "1" >> "$LED1_PATH/brightness"
  echo "1" >> "$LED0_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger3
  removeTrigger2
  removeTrigger1
  removeTrigger0
  echo "0" >> "$LED3_PATH/brightness"
  echo "0" >> "$LED2_PATH/brightness"  
  echo "0" >> "$LED1_PATH/brightness"
  echo "0" >> "$LED0_PATH/brightness"  
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger3
  removeTrigger2
  removeTrigger1
  removeTrigger0
  echo "timer" >> "$LED3_PATH/trigger"
  echo "timer" >> "$LED2_PATH/trigger"
  echo "timer" >> "$LED1_PATH/trigger"
  echo "timer" >> "$LED0_PATH/trigger"  
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
  echo "100" >> "$LED2_PATH/delay_off"
  echo "100" >> "$LED2_PATH/delay_on"
  echo "100" >> "$LED1_PATH/delay_off"
  echo "100" >> "$LED1_PATH/delay_on"
  echo "100" >> "$LED0_PATH/delay_off"
  echo "100" >> "$LED0_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
  cat "$LED2_PATH/trigger";
  cat "$LED1_PATH/trigger";
  cat "$LED0_PATH/trigger";  
fi
echo "End of the LED Bash Script"
