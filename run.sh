#!/bin/bash

docker run --name viewvc-test --rm \
    -p 80:80 \
    -e repository=http://svn.osdn.net/svnroot/ttssh2 \
    yoshihide1981/viewvc:latest
