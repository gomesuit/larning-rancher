#!/bin/bash -ex

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
# apt-cache madison docker-ce
apt-get install -y docker-ce=17.03.2~ce-0~ubuntu-xenial
/etc/init.d/docker start
