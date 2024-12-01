# Stage 1: Build the application
FROM node:16 AS build

WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the frontend application
RUN npm run build

# Stage 2: Serve the production build
FROM node:16

WORKDIR /usr/src/app

# Copy only the build folder from the previous stage
COPY --from=build /usr/src/app/build ./build

# Install a static server to serve the frontend (for production)
RUN npm install -g serve

# Expose the port that the frontend app will run on (e.g., 3000)
EXPOSE 3000

# Command to serve the frontend app
CMD ["serve", "-s", "build"]

