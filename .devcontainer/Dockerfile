# Use an official OpenJDK runtime based on Alpine as a parent image
FROM node:latest

# Install Node.js and Yarn
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    dos2unix

# Clean up the package lists to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy package.json and yarn.lock to the container
COPY package.json yarn.lock ./

# Install the dependencies
RUN yarn install
RUN yarn add axios

# Install Tailwind CSS
RUN yarn add -D tailwindcss postcss autoprefixer
RUN npx tailwindcss init -p

# Copy the rest of the application code to the container
COPY . .

# Convert line endings of gradlew to Unix format and ensure it has execution permissions
# this does not work
RUN dos2unix scalardb/gradlew

# set working directory
WORKDIR /workspace

# Expose the port
EXPOSE 3000

