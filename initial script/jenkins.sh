#Install epel-release
yum -y install epel-release

#Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

#Disable Firewalld
systemctl disable firewalld
systemctl stop firewalld

#Install java 
sudo yum -y install java-1.8.0-openjdk.x86_64 wget

#Import official yum to install
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

#Import rpm
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

#Install Jenkins
sudo yum -y install jenkins

#Start Jenkins
systemctl start jenkins.service

#Enable Jenkins
systemctl enable jenkins.service