docker volume -- docker compose -- docker network

: -v: thư mục kết nối giữa container và server
- volume là một thư mục riêng của docker
- khi dùng docker -v thì sẽ chỉ định mount volume ra container giữa container:server (ví dụ server là mariadb:latest)
- khi volume được mount ra container thì sẽ backup được data


docker run --rm -v `pwd`:/app --workdir="/app" maven:3.5.3-jdk-8-alpine mvn install -DskipTests=true 
