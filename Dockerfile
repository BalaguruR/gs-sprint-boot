FROM openjdk:17-jdk-slim
COPY complete/target/*.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]
