
# gs-rest-service-maven

## Local Build

```bash
mvn clean package -s settings.xml
```

## Automated Build

```bash
mvn clean package -s settings.xml -U -B
```

## Build Docker Image

```bash
chmod u+x docker-build.sh
./docker-build.sh demo v1
```

## Run Application

### Run SpringBoot with Maven

```bash
mvn spring-boot:run
```

### Run with Docker Container

```bash
docker run -p 8080:8080 demo:v1

```