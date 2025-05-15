```
jenkins server
    nơi chạy các pipeline
    bản chất jenkins là ra lệnh cho các deploying server triển khai các dự án 
```

##### 1. connect jenkins server - deploying server
```
Phương pháp: 
    + ssh
    + jenkins agent
require: 
    java version = java version 
deploying server
    mkdir /var/lib/jenkins
    adduser jenkins
```
```
b1: setup jenkins agent on deploying server
    adduser jenkins
    mkdir /

# jenkins server
access http://jenkins.nnson128.tech
    - new node 
        Remote root directory: /var/lib/jenkins(on lab server)
        security(manage jenkins) -> TCP port: 8999 -> save -> netstat -plunt
            <!-- TCP port: port trên jenkins mở cho tất cả jenkins agent của deploying server -->
        save
    - visit node: 
    - cd && su jenkins /var/lib/jenkins (lab server)
    - run command: bỏ tùy chọn websocket
        + Vậy user được node xác định ở đây là user chạy lệnh java -jar agent.jar đúng ko
    - reload http://jenkins.nnson128.tech => connected
```

##### b2: kết nối jenkins server đến gitlab
    - Dashboard -> new item > new folder -> Action_in_lab -> save
    - manage jenkins > system > kéo xuống: Gitlab
        + connection name: gitlab server
        + URL: https://gitlab.nnson128.tech
        + credentials: add new credentials
            - Domain: Global credentials
            - kind: gitlab API token
            - token: ___ GET TOKEN ___
                # gitlab server
                + new user admin: jenkins
                + profile -> access token
                    - token name: token for jenkins server connection 
                    - scopes: api
                    - create personal access token
                    - copy token
            - ID: jenkins-gitlab-user
            - save
###### b3: create pipeline
3. create pipeline: > Action_in_lab > shoeshop (type = pipeline)
    + discard old builds: 
        - max # of builds to keep: 10
    + gitlab connection: 
        - gitlab server
    + triggers: 
        - build when a change is pushed to GitLab
            + push events: 
            + accept merge request 
    + Pipeline
        + pipeline script from SCM
            - SCM: git
                - id: jenkins-gitlab-user-account
                - description: jenkins gitlab user account
            - branch specifier: */main
            - save
###### b4: config webhook
4. webhook (gitlab server)
repo: settings > webhooks
    - admin > settings > network > outbound requests
        + allow request to the local network from webhooks and services
        + allow request to the local network from system hooks
    - URL: http://<user_admin_jenkins>:<token_user_jenkins>@<jenkins_server>:<port>/project/<name_job>
    - URL: http://nnson128:115479389b6e8c4178889d6d9b31bd7742@jenkins.nnson128.tech:80/project/Action_in_lab/shoeshop
        +: token_user_jenkins
        +: http://jenkins.nnson128.tech/user/nnson128/security/
        +: Nhớ add host 
    - push events
    - tab push event 
    - merge request events
    - bỏ chọn enable ssl verification
    - add webhook
    - test -> push event 

###### b5: new file Jenkinsfile on branch develop
5. add Jenkinsfile
jenkinsfile syntax

edit Jenkinsfile:
    commit -> build and deploy
build and run with pipeline - jenkins server

http://nnson128:115479389b6e8c4178889d6d9b31bd7742@jenkins.nnson128.tech/project/Action_in_lab/shoeshop
http://nnson128:11d5cbb53014dcab6b9286b3bc95a91d39@jenkins.nnson128.tech/project/Action_in_lab/shoeshop
http://nnson128:115479389b6e8c4178889d6d9b31bd7742@jenkins.nnson128.tech:80/project/Action_in_lab/shoeshop
http://nnson128:11286cc75c0b5784a90c6f9ec78e5e7db0@jenkins.nnson128.tech/project/Action_in_lab/shoeshop
