Linux: 
1. config
```
- chown -R note-fe. 
- chmod -R 750 /projects/note-fe
```

2. build project
```
- sử dụng user prj để triển khai 
- build project
```
3. run project <đảm bảo có mục build >
```
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
