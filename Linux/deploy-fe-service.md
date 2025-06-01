1. run project <đảm bảo có mục build >
```
build project
vi /lib/systemd/system/noteapp.service
```

```
[Service]
Type=simple
User=noteapp
Restart=on-failure
WorkingDirectory=/projects/noteapp
ExecStart=/usr/bin/npm run dev 
```

```
systemctl daemon-reload
systemctl restart noteapp
```
