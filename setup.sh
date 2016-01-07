#/bin/bash

#configure locale
sudo locale-gen pt_BR pt_BR.UTF-8
sudo echo America/Sao_Paulo > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata
sudo dpkg-reconfigure -f noninteractive locales

# added repositories
sudo add-apt-repository ppa:webupd8team/java -y
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update

# install java 8
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer -y

# install utilities
sudo apt-get install unzip git -y

# install gradle
cd /opt
sudo wget https://downloads.gradle.org/distributions/gradle-2.6-all.zip
sudo unzip gradle-2.6-all.zip
sudo ln -s /opt/gradle-2.6/bin/gradle /usr/local/bin/

# install maven
sudo wget http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
sudo tar -xvf apache-maven-3.3.3-bin.tar.gz
sudo echo "export M2_HOME=/opt/apache-maven-3.3.3" >> /etc/profile
sudo source /etc/profile
sudo ln -s /opt/apache-maven-3.3.3/bin/* /usr/local/bin/

# install jenkins
sudo apt-get install jenkins -y
sudo service jenkins restart
wget http://jenkins:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin git gradle jacoco publish-over-ssh github repository-connector
sudo service jenkins restart

# cleanup
sudo rm -rf *.zip *.gz *.jar
