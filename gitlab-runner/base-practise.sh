
II. 
1. config gitlab server
- settings -> CI/CD -> runner
- edit lab-server
    - close "Lock to current projects"
- save
2. write pipeline file
- branch develop 
- .gitlab-ci.yml
stages:
  - build
  - test
  - deploy
build:
    stage: build
    script:
        - whoami
        - pwd
        - ls -l
    tags:
        - lab-server
commit: config(pipeline): add pipeline file
-> click ci/cd -> pipelinesq -> pending -> build
- Reinitializing -> delete old repositories and create new repositories

script: 
    - mvn install -DskipTests=true

-> commiit: config(pipeline): add pipeline file
-> view build projects


stages:
  - build
  - test
  - deploy
build:
    stage: build
    script:
        - whoami
        - pwd
        - ls -l
    tags:
        - lab-server
deploy: 
    stage: deploy
    script:
        - whoami
        - pwd

# lab server
- mkdir /datas
- mkdir /datas/shoeshop
visudo
    - root ALL=(ALL:ALL) ALL
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/cp*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/chown*
    - gitlab-runner ALL=(ALL) NOPASSWD: /bin/su shoeshop*