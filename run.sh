#!/bin/bash

# See: https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/
# See: http://blog.ctaggart.com/2016/03/gnu-octave-via-docker-x11.html

ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

open -a XQuartz
xhost + $ip

docker run --rm -t \
    -e DISPLAY=$ip:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    epflsti/octave-x11-novnc-docker:latest \
    octave
