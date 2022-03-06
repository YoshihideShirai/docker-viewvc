#!/bin/bash

VIEWVC_VERSION="1.2.1"

#docker build -t yoshihide1981/viewvc:${VIEWVC_VERSION} \
    #--build-arg VIEWVC_REFS=tags \
    #--build-arg VIEWVC_VERSION=${VIEWVC_VERSION} \
    #.
docker build -t yoshihide1981/viewvc:latest \
    --build-arg VIEWVC_REFS=heads \
    --build-arg VIEWVC_VERSION=master \
    .
