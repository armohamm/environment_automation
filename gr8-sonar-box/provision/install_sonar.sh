#!/usr/bin/env bash

# Installing Sonar
# http://docs.codehaus.org/display/SONAR/Installing+Sonar

wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.1.2.zip
unzip sonarqube-5.1.2.zip
mkdir /usr/sonarqube
sudo mv sonarqube-5.1.2 /usr/sonarqube

echo "Installing Gr8 plugin..."
sudo wget https://sonarsource.bintray.com/Distribution/org.sonarsource.sonar-groovy-plugin/sonar-groovy-plugin-1.2.jar -P /usr/sonarqube/sonarqube-5.1.2/extensions/plugins/

echo "Copying sonar.properties with postgresql support..."
sudo cp -rf /vagrant/provision/sonar/sonar.properties /usr/sonarqube/sonarqube-5.1.2/conf/sonar.properties

echo "Bringing up sonarqube..."
/usr/sonarqube/sonarqube-5.1.2/bin/linux-x86-64/sonar.sh start
echo "sonarqube is running!"

#clean up
rm -rf ./sonarqube-5.1.2.zip