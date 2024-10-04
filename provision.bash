#!/bin/bash

##
## this is a simple bash script to install basic server config
##
##     OS target: docker-first debian-based linux
##
##     Overview: update and upgrade the system, install troubleshooting tools, vim, and docker compose
##

##

set -e

reset

clear

##

echo
echo "## "
echo "## routine / provision-ubuntu-basic / starting"
echo "## "
echo

##

apt-get update

##

apt-get upgrade -y

apt-get dist-upgrade -y

##

apt-get install -y net-tools

apt-get install -y vim

##
##

#set -e;

#set -x;

## updating apt

sudo apt-get update;

##

sudo apt -y install ca-certificates curl;

### APT package dependency setup

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

## docker engine install

sudo apt update

sudo apt purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose docker docker.io

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

echo "finished provision..."

