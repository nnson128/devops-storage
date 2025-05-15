Linux: 
1. config
```
install tool build + run
- chown -R note-fe. 
- chmod -R 750 /projects/note-fe
```

2. build project
- sử dụng user prj để triển khai 
- build project
3. run project <đảm bảo có mục build >
vi /etc/nginx/conf.d/note-fe.conf
server {
    listen 80;
    root /projects/note-fe/dist/;
    index index.html;
    try_files $uri $uri/ /index.html;
}
usermod -aG note-fe www-data
<!-- add user www-data to group note-fe -->


