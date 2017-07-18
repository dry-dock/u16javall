#!/bin/bash -e

echo "================ Installing openjdk-8-jdk ================="
add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
apt-get install -y openjdk-8-jdk
add-apt-repository ppa:maarten-fonville/ppa
apt-get update
apt-get install icedtea-8-plugin
