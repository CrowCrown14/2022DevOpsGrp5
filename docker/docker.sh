#!/bin/bash

echo "apt-get update";
sudo apt-get update;

echo "Uninstall old version of docker";
sudo apt-get remove docker docker-engine docker.io;

echo "allow apt to use https"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common;

echo "Add docker GPG key";
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;

echo "add-apt-repository";
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";

echo "sudo apt update";
sudo apt update;

echo "Install docker-ce";
echo yes | sudo apt install docker-ce;

docker volume create gitlab-runner-config

sudo docker run -d --name gitlab-runner --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v gitlab-runner-config:/etc/gitlab-runner \
    gitlab/gitlab-runner:latest