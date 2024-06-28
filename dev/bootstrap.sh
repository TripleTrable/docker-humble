#!/usr/bin/env bash

set -o errexit
set -o pipefail

[ ! -d "$(pwd)/packages" ] && mkdir -p "$(pwd)/packages"


usage() {
    echo " --rid=<ROS_ID>   start container with the given ROS_ID env set"
    echo " --name=<name>    assign a name to the container"
    echo " --update         Pull update from github"
}

while [ -n "$1" ] ; do
    case "$1" in
        --name=*)
            CONTAINER_NAME="--name $(echo $1 | cut -f 2 -d '=')"
            ;;
        --rid=*)
            ROS_ID_ENV="-e ROS_DOMAIN_ID=$(echo $1 | cut -f 2 -d '=')"
            ;;
        --update)
            DOCKER_PULL="1"
            ;;

        *)
            usage
            exit 1
            ;;
    esac
    shift
done

[ -n "${DOCKER_PULL}" ] && docker pull ghcr.io/tripletrable/docker-ros:humble

docker run -it \
    -v $(pwd)/packages:/home/humble/src \
    -v $(pwd)/dev:/home/humble/dev \
    ${ROS_ID_ENV}\
    ${CONTAINER_NAME} \
    --network host \
    --ipc host \
    ghcr.io/tripletrable/docker-ros:humble \
