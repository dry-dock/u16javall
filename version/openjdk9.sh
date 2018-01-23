#!/bin/bash -e

echo "================ Installing openjava9-installer ================="

OPENJDK9_VER=9.0.4
cd /usr/lib/jvm
wget http://download.java.net/java/GA/jdk9/"$OPENJDK9_VER"/binaries/openjdk-"$OPENJDK9_VER"_linux-x64_bin.tar.gz
tar -xzf openjdk-"$OPENJDK9_VER"_linux-x64_bin.tar.gz
mv jdk-"$OPENJDK9_VER" java-9-openjdk-amd64
update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-9-openjdk-amd64/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-9-openjdk-amd64/bin/javac 1
