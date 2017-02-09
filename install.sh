#!/bin/bash -e

sudo apt-get clean
sudo mv /var/lib/apt/lists/* /tmp
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get clean
sudo apt-get update

echo "================ Installing gradle ================="
sudo wget https://services.gradle.org/distributions/gradle-3.1-all.zip
unzip -qq gradle-3.1-all.zip -d /usr/local && rm -f gradle-3.1-all.zip
ln -fs /usr/local/gradle-3.1/bin/gradle /usr/bin
echo 'export PATH=$PATH:/usr/local/gradle-3.1/bin' >> $HOME/.bashrc

echo "================ Installing apache-maven-3.3.9 ================="
sudo wget http://redrockdigimark.com/apachemirror/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar xzf apache-maven-3.3.9-bin.tar.gz -C /usr/local && rm -f apache-maven-3.3.9-bin.tar.gz
ln -fs /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin
echo 'export PATH=$PATH:/usr/local/apache-maven-3.3.9/bin' >> $HOME/.bashrc

echo "================ Installing apache-ant-1.10.1 ================="
wget http://redrockdigimark.com/apachemirror/ant/binaries/apache-ant-1.10.1-bin.tar.gz
tar xzf apache-ant-1.10.1-bin.tar.gz -C /usr/local && rm -f apache-ant-1.10.1-bin.tar.gz
ln -fs /usr/local/apache-ant-1.10.1/bin/ant /usr/bin
echo 'export ANT_HOME=/usr/local/apache-ant-1.10.1' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/apache-ant-1.10.1/bin' >> $HOME/.bashrc

echo "deb http://security.ubuntu.com/ubuntu xenial main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
sudo apt-get update

for file in /u16javall/version/*.sh;
do
  $file
done
