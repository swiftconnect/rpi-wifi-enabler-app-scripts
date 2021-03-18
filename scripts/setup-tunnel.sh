#!/bin/bash

logger SwiftSense Setting up tunnel...
source /hub-admin-home/docker-composition/node-red/cfg/.env
TUNNEL_PORT=$param2
logger SwiftSense Configured to start remote tunnels on port [$TUNNEL_PORT]

# Find any existing tunnel process and kill it before starting a new one
CURRENT_TUNNEL_PID=$(netstat -nputw | grep 35.213.188.89:22 | awk '{print $7}' | cut -d '/' -f 1)
sudo kill -9 $CURRENT_TUNNEL_PID
logger SwiftSense Tried killing any existing tunnel process [$CURRENT_TUNNEL_PID]
ssh -nNT -R $TUNNEL_PORT:localhost:22 -i /hub-admin-home/ssh/id_rsa -o UserKnownHostsFile=/hub-admin-home/ssh/known_hosts -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes swiftsense0@35.213.188.89 
logger SwiftSense Ran tunnel command...
