apt get update
apt-get install openssl
mkdir -p /tools/registry/ && cd /tools/registry
mkdir data certs
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -subj "/CN=192.168.227.100" -addext "subjectAltName = DNS:192.168.227.100,IP:192.168.227.100" -x509 -days 365 -out certs/domain.crt
vi docker-compose.yml


