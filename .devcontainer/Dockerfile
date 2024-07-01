# Use an official OpenJDK runtime based on Alpine as a parent image
FROM node:latest

# Install Node.js and Yarn
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Clean up the package lists to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy package.json and yarn.lock to the container
COPY package.json yarn.lock ./

# Install the dependencies
RUN yarn install

# Install Tailwind CSS
RUN yarn add -D tailwindcss postcss autoprefixer
RUN npx tailwindcss init -p

# Copy the rest of the application code to the container
COPY . .

# # Set working directory to ScalarDB
# WORKDIR /workspace/scalardb

# # Build ScalarDB
# RUN ./gradlew run

# Set the working directory to the root
WORKDIR /workspace

# Expose the port
EXPOSE 3000

