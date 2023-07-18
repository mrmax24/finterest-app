FROM tomcat:latest
COPY /Finterest/target/Finterest-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/Finterest.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
