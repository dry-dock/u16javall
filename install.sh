#!/bin/bash -e

apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update

echo "================ Installing gradle ================="
wget -nv https://services.gradle.org/distributions/gradle-4.2.1-all.zip
unzip -qq gradle-4.2.1-all.zip -d /usr/local && rm -f gradle-4.2.1-all.zip
ln -fs /usr/local/gradle-4.2.1/bin/gradle /usr/bin
echo 'export PATH=$PATH:/usr/local/gradle-4.2.1/bin' >> $HOME/.bashrc

echo "================ Installing apache-maven-3.3.9 ================="
wget -nv http://redrockdigimark.com/apachemirror/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xzf apache-maven-3.3.9-bin.tar.gz -C /usr/local && rm -f apache-maven-3.3.9-bin.tar.gz
ln -fs /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin
echo 'export PATH=$PATH:/usr/local/apache-maven-3.3.9/bin' >> $HOME/.bashrc

echo "================ Installing apache-ant-1.10.1 ================="
wget -nv http://redrockdigimark.com/apachemirror/ant/binaries/apache-ant-1.10.1-bin.tar.gz
tar xzf apache-ant-1.10.1-bin.tar.gz -C /usr/local && rm -f apache-ant-1.10.1-bin.tar.gz
ln -fs /usr/local/apache-ant-1.10.1/bin/ant /usr/bin
echo 'export ANT_HOME=/usr/local/apache-ant-1.10.1' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/apache-ant-1.10.1/bin' >> $HOME/.bashrc

echo "deb http://security.ubuntu.com/ubuntu xenial main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
apt-get update

for file in /u16javall/version/*.sh;
do
  $file
done

echo "================ Install android sdk & plugin ================"
pushd /tmp

wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
unzip -q sdk-tools-linux-3859397.zip
mkdir -p /opt/android-sdk
mv tools/ /opt/android-sdk/

ln -fs /opt/android-sdk/tools/bin/sdkmanager /usr/bin

export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK=/opt/android-sdk/tools/bin

mkdir -p ~/.android
touch /root/.android/repositories.cfg
yes | sdkmanager --licenses

echo 'export ANDROID_HOME=/opt/android-sdk' >> $HOME/.bashrc
echo 'export ANDROID_SDK=/opt/android-sdk/tools/bin' >> $HOME/.bashrc

echo 'export PATH=$PATH:/opt/android-sdk/tools/bin' >> $HOME/.bashrc

wget http://central.maven.org/maven2/com/github/triplet/gradle/play-publisher/1.2.0/play-publisher-1.2.0.jar
mkdir -p /opt/android-plugins
mv play-publisher-1.2.0.jar /opt/android-plugins/

popd
