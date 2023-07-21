# Build stage
FROM maven:3.8.3-openjdk-11 AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package

# Package stage
FROM tomcat:9.0.50
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/*.war ./app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
