#!/bin/bash -e

apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
echo "source $HOME/.sdkman/bin/sdkman-init.sh" >> /etc/drydock/.env

sdk install gradle 4.10.3
yes | sdk install gradle 5.1

sdk install maven 3.6.0

sdk install ant 1.9.9
yes | sdk install ant 1.10.1

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

echo 'export ANDROID_HOME=/opt/android-sdk' >> /etc/drydock/.env
echo 'export ANDROID_SDK=/opt/android-sdk/tools/bin' >> /etc/drydock/.env

echo 'export PATH=$PATH:/opt/android-sdk/tools/bin' >> /etc/drydock/.env

wget http://central.maven.org/maven2/com/github/triplet/gradle/play-publisher/1.2.0/play-publisher-1.2.0.jar
mkdir -p /opt/android-plugins
mv play-publisher-1.2.0.jar /opt/android-plugins/

popd
