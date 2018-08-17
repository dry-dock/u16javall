#!/bin/bash -e

echo "================ Installing oracle-java10-installer ================="
echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
sudo add-apt-repository -y ppa:linuxuprising/java
sudo apt-get update
sudo apt-get install -y oracle-java10-installer
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-10-oracle/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-10-oracle/bin/javac 1
sudo update-alternatives --set java /usr/lib/jvm/java-10-oracle/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-10-oracle/bin/javac
