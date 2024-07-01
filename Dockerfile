# Use an official OpenJDK runtime based on Alpine as a parent image
FROM openjdk:24-jdk-slim

# Install Node.js and Yarn
RUN apt-get update && apt-get install -y \
    nodejs \
    git \
    npm \
    && npm install -g yarn

# Clean up the package lists to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy package.json and yarn.lock to the container
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Install Tailwind CSS
RUN yarn add -D tailwindcss postcss autoprefixer
RUN npx tailwindcss init -p

# Set the working directory in the container
WORKDIR /workspace

# Copy the rest of the application code to the container
COPY . .

# Set working directory to ScalarDB
WORKDIR /workspace/scalardb

# Build ScalarDB
RUN git pull --rebase
RUN ./gradlew run

# Set the working directory back to the root
WORKDIR /workspace

# Expose the port
EXPOSE 3000

# Command to run the React application
CMD ["yarn", "start"]
