1. require domain + vps:
```
search ec2 -> select -> 
lanch instance: 
    - name: registry server
    - os: ubuntu 22.04
    - create new keypari: 
        + name: key-registry
        + save
    - allow http && https
    -> lanch instance
    - click instance
install /tools/docker/docker-install.sh
```

2. Cài đặt Harbor
```
apt update -y
apt install certbot -y
mkdir -p /tools/harbor && cd /tools/harbor
curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '.tgz$' | wget -i -
tar xvzf harbor-offline-installer*.tgz
cd harbor/
cp harbor.yml.tmpl harbor.yml
export DOMAIN="registry.nnson128.io.com"
export EMAIL="sonvipkl04@gmail.com"
sudo certbot certonly --standalone -d $DOMAIN --preferred-challenges http --agree-tos -m $EMAIL --keep-until-expiring
vi harbor.yml
    + hostname: registry.nnson128.io.vn
    + Certificate: Certificate is saved at: /etc/letsencrypt/live/registry.nnson128.io.vn/fullchain.pem
    + private_key: Key is saved at: /etc/letsencrypt/live/registry.nnson128.io.vn/privkey.pem
./prepare
./install.sh
docker-compose ps
access : registry.nnson128.io.vn
```
```

click server:
    + connect
    + public ip: 3.107.192.160
    + connect
```
