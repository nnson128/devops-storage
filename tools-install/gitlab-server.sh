___ Gitlab server install and configure ___

# install gitlab server
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee=14.4.1-ee.0 -y

# gitlab server
vi /etc/hosts: 192.168.227.100 | git.nnson128.tech
vi /etc/gitlab/gitlab.rb | external_url 'http://git.nnson128.tech'
gitlab-ctl reconfigure
vi /etc/gitlab/initial_root_password | 88888888

# macos server
macos: 
vi /etc/hosts | 192.168.227.100 git.nnson128.tech

# lab server
vi /etc/hosts | 192.168.227.100 git.nnson128.tech

