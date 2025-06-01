Linux: 
1. đảm bảo có mục build or dist
``` 
install nginx
vi /etc/nginx/sites-available/default
    port: 8999
systemctl restart nginx
vi /etc/nginx/conf.d/note-fe.conf
```
2
```
server {
    listen 80;
    root /projects/note-fe/dist/;
    index index.html;
    try_files $uri $uri/ /index.html;
}
nginx -t
usermod -aG note-fe www-data
nginx -s reload
```
