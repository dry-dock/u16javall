#!/bin/bash -e

echo "================ Installing openjdk-10-jdk ================="
add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
apt-get install -y -q openjdk-10-jdk

update-alternatives --set java /usr/lib/jvm/java-10-oracle/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-10-oracle/bin/javac
update-alternatives --set javaws /usr/lib/jvm/java-10-oracle/jre/bin/javaws

echo 'export JAVA_HOME=/usr/lib/jvm/java-10-oracle' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/lib/jvm/java-10-oracle/bin' >> /etc/drydock/.env

