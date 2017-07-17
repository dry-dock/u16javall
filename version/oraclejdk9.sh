#!/bin/bash -e

echo "================ Installing oracle-java9-installer ================="
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java9-installer
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-9-oracle' >> $HOME/.bashrc
sudo echo 'export PATH=$PATH:/usr/lib/jvm/java-9-oracle/jre/bin' >> $HOME/.bashrc


