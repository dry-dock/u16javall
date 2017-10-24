#!/bin/bash -e

echo "================ Installing oracle-java9-installer ================="

wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.tar.gz
tar -xzf jdk-9.0.1_linux-x64_bin.tar.gz
mv jdk-9.0.1 java-9-oracle

update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-9-oracle/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-9-oracle/bin/javac 1
echo 'export JAVA_HOME=/usr/lib/jvm/java-9-oracle' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-9-oracle/bin' >> $HOME/.bashrc
