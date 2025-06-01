Linux: 
1. config
```
    install nginx
```
3. đảm bảo có mục build or dist
``` 
vi /etc/nginx/sites-available/default
    port: 8999
systemctl restart nginx
vi /etc/nginx/conf.d/note-fe.conf

```

```
server {
    listen 80;
    root /projects/note-fe/dist/;
    index index.html;
    try_files $uri $uri/ /index.html;
}
```

```
usermod -aG note-fe www-data
nginx -s reload
```
