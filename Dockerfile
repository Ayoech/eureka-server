# Use a lightweight Java image
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the built JAR from your local machine
COPY build/libs/*.jar app.jar

EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]
