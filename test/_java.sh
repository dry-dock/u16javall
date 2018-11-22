#!/bin/bash -e

echo "============================ JDK versions ==============================="

shipctl jdk set openjdk7
printf "\n"
java -version
printf "\n"

shipctl jdk set openjdk8
printf "\n"
java -version
printf "\n"

shipctl jdk set openjdk10
printf "\n"
java -version
printf "\n"

shipctl jdk set openjdk11
java -version
printf "\n"shipctl jdk set openjdk11
java -version
printf "\n"

shipctl jdk set oraclejdk8
printf "\n"
java -version
printf "\n"

shipctl jdk set oraclejdk11
printf "\n"
java -version
printf "\n"
