#!/bin/bash -e

echo "================ Installing openjdk-7-jdk ================="
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
apt-get install -y openjdk-7-jdk
#icedtea-7-plugin not supported on ubuntu 16.04
