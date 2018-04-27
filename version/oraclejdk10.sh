#!/bin/bash -e

echo "================ Installing oracle-java10-installer ================="
echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
sudo add-apt-repository -y ppa:linuxuprising/java
sudo apt-get update
sudo apt-get install -y oracle-java10-installer

echo 'export JAVA_HOME=/usr/lib/jvm/java-10-oracle' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/lib/jvm/java-10-oracle/bin' >> /etc/drydock/.env

