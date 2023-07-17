FROM adoptopenjdk:17-jdk-hotspot

WORKDIR /app

COPY pom.xml .

RUN mvn package -DskipTests

COPY target/Finterest-1.0-SNAPSHOT.war .

EXPOSE 8080

CMD ["java", "-jar", "Finterest-1.0-SNAPSHOT.war"]
