# Use an official OpenJDK runtime based on Alpine as a parent image
FROM openjdk:17-alpine

# Install Node.js and Yarn
RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    && npm install -g yarn

# Set the working directory in the container
WORKDIR /workspace

# Copy package.json and yarn.lock to the container
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Install Tailwind CSS
RUN yarn add -D tailwindcss postcss autoprefixer
RUN npx tailwindcss init -p

# Copy the rest of the application code to the container
COPY . .

# Build ScalarDB
# RUN mkdir scalardb
# RUN cd scalardb
# RUN git clone https://github.com/scalar-labs/scalardb
# WORKDIR /workspace/scalardb
# RUN git pull --rebase
# RUN ./gradlew run 

# Set the working directory back to the root
# WORKDIR /workspace

# Expose the port
EXPOSE 3000

# Command to run the React application
CMD ["yarn", "start"]
