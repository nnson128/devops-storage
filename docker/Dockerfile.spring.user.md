```

##### Dockerfile #####
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn install -DskipTests=true

FROM alpine:3.19

RUN adduser -D shoeshop
RUN apk add openjdk8

RUN unlink /etc/localtime;ln -s  /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
COPY --from=build app/target/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar /run/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar

RUN chown -R shoeshop:shoeshop /run
USER shoeshop

EXPOSE 8080

ENV JAVA_OPTIONS="-Xmx2048m -Xms256m"
ENTRYPOINT ["java", "-jar", "/run/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar"]

```
