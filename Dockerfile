FROM openjdk:17-jdk-slim
COPY complete/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","/app.jar"]
