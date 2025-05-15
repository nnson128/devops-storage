1. lab server
``` 
- mkdir /datas/shoeshop
``` 
``` 
visudo
    - root ALL=(ALL:ALL) ALL
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/cp*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/chown*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/su shoeshop*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/kill -9*
``` 
``` 
.gitlab-ci.yml
cd.yml
``` 
