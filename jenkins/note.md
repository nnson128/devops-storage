jenkins server: 
    + tập hợp các node: node là các server - deploying server (lab-server)

khi triển khai dự án với jenkins server thì:
    + deploying server: java, 

delevery: 
thẳng vào production: 

java -jar agent.jar -url http://jenkins.nnson128.tech/ -secret @secret-file -name "lab-server" -workDir "/var/lib/jenkins" > nohup.out 2>&1 &
[Unit] Description=Jenkins Agent
After=network.target

[Service] User=jenkins WorkingDirectory=/var/lib/jenkins ExecStart=/usr/bin/java -jar /var/lib/jenkins/agent.jar -url http://jenkins.nnson128.tech/ -secret @/var/lib/jenkins/secret-file -name "lab-server" -workDir "/var/lib/jenkins" 
Restart=always 
RestartSec=10

[Install] WantedBy=multi-user.target