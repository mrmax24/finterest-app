# Stage 1: Build the project and create the WAR file
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Stage 2: Copy the WAR file to Tomcat image and configure it
FROM tomcat:latest
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/Finterest-1.0-SNAPSHOT.war ./app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
