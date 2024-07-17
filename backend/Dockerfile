# # Use an official Gradle image as a parent image to build the project
# FROM gradle:7.6.0-jdk17 AS build
# # Set the working directory inside the container
# WORKDIR /workspace

# # Copy the project files into the container
# COPY . .

# # Package the application
# RUN ./gradlew clean bootJar

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /workspace

# Copy the built jar file from the build stage to the run stage
# COPY /backend/build/libs/app.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "backend/build/libs/app.jar"]
