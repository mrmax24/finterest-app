# Build stage
FROM maven:4.0.0-openjdk-17 AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package

# Package stage
FROM tomcat:latest
COPY --from=build /app/target/Finterest-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]