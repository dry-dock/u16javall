#!/bin/bash -e

echo "============================ JDK versions ==============================="

shipctl jdk openjdk7
printf "\n"
java -version
printf "\n"

shipctl jdk openjdk8
printf "\n"
java -version
printf "\n"

shipctl jdk openjdk9
printf "\n"
java -version
printf "\n"

shipctl jdk oraclejdk8
printf "\n"
java -version
printf "\n"

shipctl jdk oraclejdk10
printf "\n"
java -version
printf "\n"
