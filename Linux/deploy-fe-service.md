1. run project <đảm bảo có mục build >
```
build project
vi /lib/systemd/system/<noteapp>.service
```

```
[Service]
Type=simple
User=<noteapp>
Restart=on-failure
WorkingDirectory=/projects/<noteapp>
ExecStart=/usr/bin/npm run start --port=3000
```

```
systemctl daemon-reload
systemctl enable <noteapp>
systemctl restart <noteapp>
```
