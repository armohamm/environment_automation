#!/usr/bin/env bash

if [ -d "/usr/lib/jvm/" ]; then
	echo "Just skipping this step bcz there's already an installation of J7 in /usr/lib/jvm"
	exit 0
fi


curl -L --cookie "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz -o jdk-7-linux-x64.tar.gz
tar -xvf jdk-7-linux-x64.tar.gz

sudo mkdir -p /usr/lib/jvm
sudo mv ./jdk1.7.* /usr/lib/jvm/

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_65/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0_65/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.7.0_65/bin/javaws" 1

sudo chmod a+x /usr/bin/java 
sudo chmod a+x /usr/bin/javac 
sudo chmod a+x /usr/bin/javaws
sudo chown -R root:root /usr/lib/jvm/jdk1.7.0_65

rm jdk-7-linux-x64.tar.gz