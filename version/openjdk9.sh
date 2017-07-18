#!/bin/bash -e

echo "================ Installing openjdk-9-jdk ================="

add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
sudo apt-get -o Dpkg::Options::="--force-overwrite" install openjdk-9-jdk
