
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
./docker-build.sh 0.1.0
```

## Run Application

### Run SpringBoot with Maven

```bash
mvn spring-boot:run -s settings.xml
```

### Run with Docker Container

```bash
docker run -p 8080:8080 gs-rest-service:0.1.0

```

> Use another port if 8080 is already in use

## Test Application

http://192.168.87.151:8080/greeting

http://192.168.87.151:8080/greeting?name=William