# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /workspace

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install
RUN yarn add axios

# Copy the rest of the application files to the working directory
COPY . .

# Build the React app
RUN yarn build

# Install serve to serve the built app
RUN yarn global add serve

# Expose the port serve runs on
EXPOSE 3000

# Run the application
CMD ["serve", "-s", "build"]
