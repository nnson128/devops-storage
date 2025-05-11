___ base practise ___
I. write pipeline file - .gitlab-ci.yml
- branch develop - new file: .gitlab-ci.yml
``` .practise1-gitlab-ci#1.sh -> commit

1. touch sample.txt
2. new commit 
3. auto run pipeline

``` .practise1-gitlab-ci#2.sh -> commit

# lab server
- mkdir /datas
- mkdir /datas/shoeshop

visudo
    - root ALL=(ALL:ALL) ALL
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/cp*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/chown*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/su shoeshop*

``` .practise1-gitlab-ci#3.sh -> commit
``` .practise1-gitlab-ci#4.sh -> commit
