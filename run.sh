#!/bin/bash
# wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
docker run -ti --rm \
        --privileged \
       -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
       --device /dev/dri \
       --device /dev/video0 \
       -e DISPLAY=:1 \
       --cap-add=NET_ADMIN \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /dev/shm:/dev/shm \
       dockerimage-windowmanager
      #  --security-opt seccomp=$HOME/chrome.json \
