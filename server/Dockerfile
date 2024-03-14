# Use the official Node.js image as base
#FROM node:14
FROM node:20.11.0-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Use an environment variable for the port
ENV PORT=3000

# Expose the port your app runs on
EXPOSE $PORT

# Command to run your application
CMD ["node", "index.js"]
