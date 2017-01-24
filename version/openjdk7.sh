#!/bin/bash -e

echo "================ Installing openjdk-7-jdk ================="
apt-get install -y openjdk-7-jdk
update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-7-openjdk-amd64/bin/javac
#icedtea-7-plugin not supported on ubuntu 16.04
echo 'export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/bin' >> $HOME/.bashrc
