` docker build -t image_name:v1 .

` docker run --name container_name -dp 8888:8080 image_name:v1

` docker exec -it

` docker rm -f $(docker ps -aq)

` docker system df

` docker tag todolist:v1 sonta28122004/todolist:v1

` docker push sonta28122004/todolist:v1