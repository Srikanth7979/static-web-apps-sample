# Use Node.js LTS image as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code to the working directory
COPY . .

# Generate static files
RUN npm run generate

# Expose port 3000 (or any other port your Nuxt.js application is listening on)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
