# lab server
- mkdir /datas
- mkdir /datas/shoeshop

visudo
    - root ALL=(ALL:ALL) ALL
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/cp*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/chown*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/su shoeshop*

file: ```.gitlab-ci.yml
file: ```continuous-deployment.yml
