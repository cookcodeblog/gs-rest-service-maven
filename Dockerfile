FROM openjdk:8-jdk-alpine

ARG jar_file=*.jar
ARG http_port=8080

# Copy jar from current directory
COPY ${jar_file} app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

EXPOSE ${http_port}