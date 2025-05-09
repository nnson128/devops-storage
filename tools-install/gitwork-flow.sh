### git work flow ###
1. create branches
    - develop
    - feature/frontend/login
    - feature/backend/login
    - staging
2. protected branches
    - default branch -> develop

    - main: maintainer - no one
    - develop: maintainer - maintainer
        + devops: commit config(database): modify connection
    - staging: maintainer - maintainer
    - push commit to main 
        + cannot push commit to main

3. create user dev1
    - git commit
    - new merge request
    - assign: leader 
    - reviewer: leader
    - close "Delete source branch when merge request is accepted"
    ``` create merge request
4. create tags: Đánh dấu phiên bản triển khai dự án
    - develop branch: 
        + Repo -> tags 
            + name: dev_0.0.1
            + ``` create tag