#!/bin/bash -e

echo "================ Installing openjdk-9-jdk ================="

add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
sudo apt-get -o Dpkg::Options::="--force-overwrite" install openjdk-9-jdk
update-alternatives --set java /usr/lib/jvm/java-9-openjdk-amd64/bin/java
update-alternatives --set javac /usr/lib/jvm/java-9-openjdk-amd64/bin/javac
echo 'export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-amd64' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-9-openjdk-amd64/bin' >> $HOME/.bashrc
