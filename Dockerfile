    FROM maven:3.9-eclipse-temurin-17
    RUN mkdir -p /home/app
    # COPY . /home/app we are not cpoing everything
    # WORKDIR /home/app
    COPY ./target/my-app-*.jar /home/app/
    WORKDIR /home/app
    CMD ["java", "-jar", "my-app-*.jar"] #command to start java application
