```

##### Dockerfile #####
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn install -DskipTests=true

FROM eclipse-temurin:17.0.8.1_1-jre-ubi9-minimal

RUN unlink /etc/localtime;ln -s  /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
COPY --from=build app/target/chat-server-0.0.1-SNAPSHOT.jar /run/chat-server-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENV JAVA_OPTIONS="-Xmx2048m -Xms256m"
ENTRYPOINT ["java", "-jar", "/run/chat-server-0.0.1-SNAPSHOT.jar"]
```
