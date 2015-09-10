# jenkins-vm vagrant

A simple vagrant vm with jenkins.

Installed:
- oracle java 8
- apache maven 3.3.3
- gradle 2.6
- git

Jenkins plugins:
- git 
- gradle 
- jacoco 
- publish-over-ssh 
- github 
- repository-connector

#### 1 install vagrant plugins
```sh
$ vagrant plugin install vagrant-cachier
$ vagrant plugin install vagrant-hostmanager
```

#### 2 run vagrant
```sh
$ vagrant up
$ vagrant ssh
```

#### 3 access
[http://jenkins/](http://jenkins/)