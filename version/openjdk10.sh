#!/bin/bash -e

echo "================ Installing openjdk-10-jdk ================="
add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
apt-get install -y -q openjdk-10-jdk

update-alternatives --set java /usr/lib/jvm/java-10-openjdk-amd64/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-10-openjdk-amd64/bin/javac
