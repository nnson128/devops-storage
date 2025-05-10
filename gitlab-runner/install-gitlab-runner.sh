___ install and config gitlab-runner ___
I. install gitlab-runner
``` apt-get update
``` curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | bash
``` apt-get install gitlab-runner
``` gitlab-runner -version
``` user vi /etc/passwd

II. connect to gitlab server
- access git.nnson128.tech
- settings -> CI/CD -> runner
# lab server:
``` gitlab-runner register
    + cop url && token
    + desc: lab server
    + tag: lab server
    + optional: enter
    + executor: shell, docker, kubernetes - just use shell
``` vi /etc/gitlab-runner/config.toml
    + concurrent = 4: Số lượng job tối đa mà gitlab-runner có thể chạy song song
``` nohup gitlab-runner run --working-directory /home/gitlab-runner --config /etc/gitlab-runner/config.toml --service gitlab-runner --user gitlab-runner 2 >&1 & 
``` ps -ef | grep gitlab-runner

III. config gitlab server
- settings -> CI/CD -> runner
- understabd option of ci/cd on gitlab server
- edit lab-server
    - close "Lock to current projects"
- save
