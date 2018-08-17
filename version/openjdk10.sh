#!/bin/bash -e
echo "================ Installing openjdk-10-jdk ================="
export OPENJDK_VERSION="10.0.2"
mkdir -p /usr/lib/jvm && cd /usr/lib/jvm
wget "https://download.java.net/java/GA/jdk10/$OPENJDK_VERSION/19aef61b38124481863b1413dce1855f/13/openjdk-"$OPENJDK_VERSION"_linux-x64_bin.tar.gz"
tar -xzf openjdk-"$OPENJDK_VERSION"_linux-x64_bin.tar.gz
mv jdk-"$OPENJDK_VERSION"/ java-10-openjdk-amd64

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-10-openjdk-amd64/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-10-openjdk-amd64/bin/javac 1
sudo update-alternatives --set java /usr/lib/jvm/java-10-openjdk-amd64/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-10-openjdk-amd64/bin/javac

