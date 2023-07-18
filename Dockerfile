# Build stage
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package

# Package stage
FROM tomcat:latest
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/*.war ./app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]