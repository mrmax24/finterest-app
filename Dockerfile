FROM adoptopenjdk:17-jdk-jammy

RUN apt-get update && apt-get install -y maven

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN ./mvnw dependency:resolve

COPY src ./src

RUN ./mvnw package

RUN cp target/Finterest-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
