### git work flow ###
1. create branches
    - develop
    - feature/frontend/login
    - feature/backend/login
2. authorize user
    - setting -> repositories -> default branch -> develop
    "protected branch"
    - main: maintainer - maintainer
    - develop: maintainer - maintainer | devops: commit config(database): modify connection
    - staging: maintainer - maintainer
    - push commit to main || cannot push commit to main
# 3. create tags: Đánh dấu phiên bản triển khai dự án
    - develop branch: 
        + Repo -> tags 
            + name: dev_0.0.1
            + ``` create tag



2. create user dev1
    - invite dev1
88888888
# user dev1
    - git commit
    - new merge request
    - assign: leader 
    - reviewer: leader
    - close "Delete source branch when merge request is accepted"
    ``` create merge request