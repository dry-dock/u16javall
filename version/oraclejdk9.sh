#!/bin/bash -e

echo "================ Installing oracle-java9-installer ================="

echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

add-apt-repository -y ppa:webupd8team/java
apt-get update
apt install oracle-java9-installer

