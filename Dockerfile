# Stage 1: Build the application
FROM maven:3-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests && ls -l /app/target

# Stage 2: Create the runtime image
FROM eclipse-temurin:17-alpine
WORKDIR /app
# Correct the COPY command to use the right path
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogsManagementSystem.jar"]
