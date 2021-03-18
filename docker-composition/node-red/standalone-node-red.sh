#!/bin/bash
source /hub-admin-home/docker-composition/composition.env
sudo docker stop mynodered
sudo docker rm mynodered

hostIpAddress=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | tr "\n" "," | sed 's/,$/ /' | tr " " "\n")
echo Assigned IP addresses: $hostIpAddress

logger SwiftSense Starting node-red image:$NODE_RED_IMAGE_TAG

sudo docker run -d \
        --log-driver json-file \
        --restart=no \
        --net=host \
        --log-opt max-size=10m \
        --privileged=true \
        -e HOST_IP_ADDRESSES=$hostIpAddress \
        --env-file /hub-admin-home/docker-composition/node-red/cfg/.env \
        -p 1880:1880 \
        -v /hub-admin-home/docker-composition/node-red/cfg:/cfg \
        -v /hub-admin-home/certs:/certs:ro \
        -v /etc/timezone:/etc/timezone \
        -v /etc/localtime:/etc/localtime \
        -v /run/udev:/run/udev:ro \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -e mqttCmdReqTopic=$mqttCmdReqTopic \
        -e mqttGetConfigsReqTopic=$mqttGetConfigsReqTopic \
        -e mqttSetConfigReqTopic=$mqttSetConfigReqTopic \
        --name=mynodered $NODE_RED_IMAGE_TAG

        # -v mynode-red-vol:/data \
        # --name=mynodered docker.swiftsense.biz/swiftsense/skanlife-dixe:1.0.0


