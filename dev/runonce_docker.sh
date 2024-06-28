#!/bin/sh

set -o errexit
set -o pipefail
set -o nounset

USERNAME="$(logname)"
echo "${USERNAME}:$(id -u ${USERNAME}):65536" >> /etc/subuid
echo "${USERNAME}:$(id -g ${USERNAME}):65536" >> /etc/subgid
