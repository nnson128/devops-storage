1. git work flow 
```
1. create branches
    - develop
    - feature/frontend/login
    - feature/backend/login
    - staging (from developer)
```
```
2. protected branches
    default branch -> develop
    - protected
        main: maintainer - no one
        staging: maintainer - maintainer
        develop: maintainer - maintainer
            + devops: commit config(database): modify connection
        test commit
            + push commit to main 
            + cannot push commit to main
```
```

3. create user dev1
    - git commit
    - new merge request
    - assign: leader 
    - reviewer: leader
    - close "Delete source branch when merge request is accepted"
    create merge request
```
