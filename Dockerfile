# Stage 1: Build the application
FROM node:18-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the application port (Medusa typically uses 9000)
EXPOSE 9000

# Set environment variables
ENV NODE_ENV=production

# Start the Medusa server
CMD ["npm", "run", "start"]

