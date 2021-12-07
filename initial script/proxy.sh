#Install epel-release
yum -y install epel-release

#Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

#Disable Firewalld
systemctl disable firewalld
systemctl stop firewalld

#Install Nginx
sudo yum -y install nginx

#Start Nginx
systemctl start nginx.service

#Enable Nginx
systemctl enable nginx.service