#!/bin/sh
dir1=/hub-admin-home/docker-composition/node-red/cfg
while inotifywait -e create "$dir1"; do
    logger SwiftSense Init param file was created...
    /hub-admin-home/scripts/generic-load-params-and-re-init.sh
done



