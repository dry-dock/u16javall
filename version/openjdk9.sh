#!/bin/bash -e

echo "================ Installing openjdk-9-jdk ================="


sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get remove openjdk-9-jdk-headless
sudo apt-get update
sudo apt-get remove openjdk-9-jdk-headless
sudo apt install openjdk-9-jre
sudo apt-get remove openjdk-9-jdk-headless
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk/bin/java" 1
sudo update-alternatives --set java /usr/lib/jvm/java-9-openjdk-amd64/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-9-openjdk-amd64/bin/javac
sudo add-apt-repository ppa:maarten-fonville/ppa
sudo apt-get update
sudo apt-get install icedtea-9-plugin
sudo update-alternatives --set javaws /usr/lib/jvm/java-9-openjdk-amd64/jre/bin/javaws
echo 'export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-amd64' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-9-openjdk-amd64/jre/bin' >> $HOME/.bashrc
