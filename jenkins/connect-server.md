```
jenkins server
    nơi chạy các pipeline
    bản chất jenkins là ra lệnh cho các deploying server triển khai các dự án 
```

1. connect jenkins server - deploying server: setup jenkins agent: node
```
Phương pháp: 
    + ssh
    + jenkins agent
require: 
    java version = java version 
deploying server
    mkdir /var/lib/jenkins
    adduser jenkins
new node 
    Remote root directory: none. 
        Chỉ cần chỉ định workdir bước chạy java -jar là được
cd && su jenkins /var/lib/jenkins
run command: <ignore websocket> + workdir /var/lib/jenkinss
    - user được node xác định là user run command java -jar
connected
```
2. kết nối jenkins server đến gitlab

```
- manage jenkins > system > kéo xuống: Gitlab
    + connection name: gitlab server
    + credentials: 
        - token: 
            gitlab server(user jenkins role admin)
            profile -> access token
                token name: token for jenkins server connection 
                scopes: api
                create personal access token
        - ID = desc: jenkins-gitlab-user
success
```
b3: create pipeline
```
3. dashboard > Action_in_lab > shoeshop (type = pipeline)
    + discard old builds: 
        - max # of builds to keep: 10
    + gitlab connection: 
        - gitlab server
    + triggers: 
        - build when a change is pushed to GitLab
            + push events: chạy khi có push lên branch
            + accept merge request: chạy khi có accept merge request lên branch
    + Pipeline
        + pipeline script from SCM
            - SCM: git
                - id: jenkins-gitlab-user-account
                - description: jenkins gitlab user account
            - branch specifier: */main
success
```
b4: config webhook
```
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
success

b5: new file Jenkinsfile on branch develop
5. add Jenkinsfile
jenkinsfile syntax

edit Jenkinsfile:
    commit -> build and deploy
build and run with pipeline - jenkins server

http://nnson128:115479389b6e8c4178889d6d9b31bd7742@jenkins.nnson128.tech/project/Action_in_lab/shoeshop
http://nnson128:11d5cbb53014dcab6b9286b3bc95a91d39@jenkins.nnson128.tech/project/Action_in_lab/shoeshop
http://nnson128:115479389b6e8c4178889d6d9b31bd7742@jenkins.nnson128.tech:80/project/Action_in_lab/shoeshop
http://nnson128:11286cc75c0b5784a90c6f9ec78e5e7db0@jenkins.nnson128.tech/project/Action_in_lab/shoeshop
2. create workspace
```
Dashboard > new item > folder: Action_in_lab 
```
```

6. Khi nào pipeline chạy ??
```
Cấu hình khi tạo pipeline: 
    + triggers: 
        - build when a change is pushed to GitLab
            + push events: chạy khi có push lên branch
            + accept merge request: chạy khi có accept merge request lên branch
config webhook trên dự án gitlab:  
    "thông báo" cho Jenkins rằng có sự kiện xảy ra (push, merge, tag, v.v.).
```