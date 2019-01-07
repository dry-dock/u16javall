#!/bin/bash -e

apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update

GRADLE_VERSION="5.1"
echo "================ Installing gradle $GRADLE_VERSION ================="
wget -nv https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip
unzip -qq gradle-$GRADLE_VERSION-all.zip -d /usr/local && rm -f gradle-$GRADLE_VERSION-all.zip
ln -fs /usr/local/gradle-$GRADLE_VERSION/bin/gradle /usr/bin
echo 'export PATH=$PATH:/usr/local/gradle-$GRADLE_VERSION/bin' >> /etc/drydock/.env

APACHE_MAVEN="3.6.0"
echo "================ Installing apache-maven $APACHE_MAVEN ================="
wget http://www-eu.apache.org/dist/maven/maven-3/$APACHE_MAVEN/binaries/apache-maven-$APACHE_MAVEN-bin.tar.gz
tar xzf apache-maven-$APACHE_MAVEN-bin.tar.gz -C /usr/local && rm -f apache-maven-$APACHE_MAVEN-bin.tar.gz
ln -fs /usr/local/apache-maven-$APACHE_MAVEN/bin/mvn /usr/bin
echo 'export PATH=$PATH:/usr/local/apache-maven-$APACHE_MAVEN/bin' >> /etc/drydock/.env

APACHE_ANT=1.9.13
echo "================ Installing apache-ant $APACHE_ANT ================="
wget -nv https://archive.apache.org/dist/ant/binaries/apache-ant-$APACHE_ANT-bin.tar.gz
tar xzf apache-ant-$APACHE_ANT-bin.tar.gz -C /usr/local && rm -f apache-ant-$APACHE_ANT-bin.tar.gz
ln -fs /usr/local/apache-ant-$APACHE_ANT/bin/ant /usr/bin
echo 'export ANT_HOME=/usr/local/apache-ant-$APACHE_ANT' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/local/apache-ant-$APACHE_ANT/bin' >> /etc/drydock/.env

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
