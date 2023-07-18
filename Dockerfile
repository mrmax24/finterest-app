# Stage 1: Build stage
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package

# Stage 2: Package stage
FROM tomcat:latest
WORKDIR /usr/local/tomcat/webapps
COPY ./target/Finterest-1.0-SNAPSHOT.war ./Finterest.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
