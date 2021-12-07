#Install epel-release
yum -y install epel-release

#Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

#Disable Firewalld
systemctl disable firewalld
systemctl stop firewalld

#Install required packages
yum -y install git python3-pip python-docker

#Add docker repo
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Install latest docker
yum -y install docker-ce

#Start and enable docker
systemctl start docker
systemctl enable docker

#Upgrade pip using pip3
pip3 install --upgrade pip
pip3 install packaging

#Install docker-compose
pip3 install docker-compose

#Copy to /usr/bin
cp /usr/local/bin/docker-compose /usr/bin/

#Download jumpserver
git clone -b v2.13.2 https://github.com/jumpserver/installer.git /etc/opt/jumpserver

#Change Version
sed -i 's|export VERSION=.*|export VERSION=v2.13.2|g' /etc/opt/jumpserver/static.env

#Install Jumpserver
/etc/opt/jumpserver/jmsctl.sh install

#all no for default

#Start Jumpserver
#cd /etc/opt/jumpserver/
#./jmsctl start