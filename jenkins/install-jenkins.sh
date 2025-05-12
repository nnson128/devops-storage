- change netplan
- vi /etc/hostname -> netplan apply -> reboot
___ install jenkins.sh ___
chmod +x install_jenkins.sh

#!/bin/bash
[ "$EUID" -ne 0 ] && exit 1
sed -i '/cdrom/d' /etc/apt/sources.list
apt-get update --fix-missing
apt-get install -y openjdk-17-jdk openjdk-17-jre || {
  add-apt-repository ppa:openjdk-r/ppa -y
  apt-get update
  apt-get install -y openjdk-17-jdk openjdk-17-jre
}
java -version || exit 1
grep -q JAVA_HOME /etc/environment || echo "JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64" >> /etc/environment
source /etc/environment
[ -f /usr/sbin/policy-rc.d ] && mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.bak
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
apt-get update
apt-get install -y jenkins
systemctl daemon-reload
systemctl start jenkins
systemctl enable jenkins
ufw allow 8080



___ install nginx và cho jenkins chạy trên cổng 80 ___
vi /etc/nginx/conf.d/jenkins.nnson128.tech.conf