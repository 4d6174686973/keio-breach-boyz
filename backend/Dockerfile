# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /workspace

# Copy the project files to the working directory
COPY . /workspace

# Package the application
RUN ./gradlew bootJar

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "build/libs/your-app-name.jar"]
