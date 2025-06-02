1. install gitlab-runner: robot
```
apt-get update
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | bash
apt-get install gitlab-runner
gitlab-runner -version
user vi /etc/passwd
```
2. connect to gitlab server
```
- access git.nnson128.tech
- settings -> CI/CD -> runner
gitlab-runner register
    + cop url && token
    + desc = tag: lab server
    + executor: shell, docker, kubernetes - just use shell
vi /etc/gitlab-runner/config.toml
    + concurrent = 4: Số lượng job tối đa mà gitlab-runner có thể chạy song song
nohup gitlab-runner run --working-directory /home/gitlab-runner --config /etc/gitlab-runner/config.toml --service gitlab-runner --user gitlab-runner 2 >&1 & 
ps -ef | grep gitlab-runner
``` 

3. config gitlab runner on gitlab server: cấu hình con runner chạy khi nào
``` 
- settings -> CI/CD -> runner
- edit lab-server
    - close "Lock to current projects"
- save
- Việc tự động chạy pipeline hay ko sẽ tùy thuộc hoàn toàn vào file .gitlab-ci.yml
``` 
