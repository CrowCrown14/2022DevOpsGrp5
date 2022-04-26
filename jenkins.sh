#!/bin/bash

echo "apt-get update"
sudo apt-get update
sudo apt update

echo "install jenkins"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

echo "apt-get update"
sudo apt-get update

sudo add-apt-repository -y ppa:openjdk-r/ppa

echo "apt-get update"
sudo apt update -qq 
echo "install openjdk-11-jdk"
sudo apt install -yq openjdk-11-jdk

echo "apt-get install jenkins"
sudo apt-get install jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins