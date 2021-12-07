#Install epel-release
yum -y install epel-release

#Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

#Disable Firewalld
systemctl disable firewalld
systemctl stop firewalld

#Install required packages
yum -y install git gcc gcc-c++ ansible nodejs gettext device-mapper-persistent-data lvm2 bzip2 python3-pip python-docker

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

#Download ansible awx
git clone -b 17.1.0 https://github.com/ansible/awx.git /etc/opt/awx

#Create pgdocker and projects directory
mkdir /var/lib/awx
mkdir /var/lib/awx/pgdocker
mkdir /var/lib/awx/projects

#Change admin password, secret key and dns server
sed -i 's|# admin_password=.*|admin_password=moe47@12345|g' /etc/opt/awx/installer/inventory
sed -i 's|admin_user=.*|admin_user=moe47|g' /etc/opt/awx/installer/inventory
sed -i 's|secret_key=.*|secret_key=QPqYQVU4HlPCW9Lq3w6FXsHZrwr0OxjFfollPMk7|g' /etc/opt/awx/installer/inventory
sed -i 's|#awx_alternate_dns_servers=.*|awx_alternate_dns_servers="8.8.8.8,8.8.4.4"|g' /etc/opt/awx/installer/inventory

#Change Project Directory
sed -i 's|#project_data_dir=/var/lib/awx/projects|project_data_dir=/var/lib/awx/projects|g' /etc/opt/awx/installer/inventory
sed -i 's|postgres_data_dir=.*|postgres_data_dir=/var/lib/awx/pgdocker|g' /etc/opt/awx/installer/inventory

#Install AWX
ansible-playbook -i /etc/opt/awx/installer/inventory /etc/opt/awx/installer/install.yml