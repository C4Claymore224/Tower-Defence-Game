# Use the official Node.js 18 Alpine image as the base image
FROM node:18-alpine

# Add metadata about the image source
LABEL org.opencontainers.image.source https://github.com/luc14n/tower-defence-game

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Ensure the directory for static files (e.g., Godot game) exists
RUN mkdir -p public/game

# Copy the Godot game files into the static files directory
COPY ./app/game ./public/game

# Install SQLite database utility
RUN apk add --no-cache sqlite

# Create a directory for the SQLite database
RUN mkdir -p /usr/src/app/data

# Set permissions for the database directory
RUN chmod -R 777 /usr/src/app/data

# Copy the SQLite initialization script into the container
COPY ./app/data/init.sql /usr/src/app/data/init.sql

# Initialize the SQLite database using the provided script
RUN sqlite3 /usr/src/app/data/database.db < /usr/src/app/data/init.sql

# Declare the database directory as a volume for data persistence
VOLUME ["/usr/src/app/data"]

# Expose port 8000 for the application
EXPOSE 8000

# Define the default command to start the application
CMD [ "npm", "start" ]