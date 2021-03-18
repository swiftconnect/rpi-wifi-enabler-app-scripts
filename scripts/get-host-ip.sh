#!/bin/bash
# export hostIpAddress=$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{print $2}')
# export hostIpAddress=${ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'}
# export  hostIpAddress=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
# hostIpAddress=192.168.1.101
# export hostIpAddress



hostIpAddress=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | tr "\n" "," | sed 's/,$/ /' | tr " " "\n")
echo $hostIpAddress




