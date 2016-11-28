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
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update

# install java 8
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer -y

# install utilities
sudo apt-get install unzip git python-pip -y

# install jenkins
sudo apt-get install jenkins -y
sudo service jenkins restart

# install docker
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install docker-engine -y
sudo usermod -aG docker vagrant
sudo usermod -aG docker jenkins

# install docker-compose
sudo pip install docker-compose

# cleanup
sudo rm -rf *.zip *.gz *.jar
