    FROM maven:3.9-eclipse-temurin-17
    RUN mkdir -p /home/app
    COPY . /home/app
    WORKDIR /home/app
    CMD ["java", "target/my-app-1.0-SNAPSHOT.jar"]
