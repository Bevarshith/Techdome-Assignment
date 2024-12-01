# Use a base image (Node.js)
FROM node:16

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Install netcat (nc)
RUN apt-get update && apt-get install -y netcat

# Download and install the wait-for-it script
RUN curl -sSL https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -o /usr/local/bin/wait-for-it && chmod +x /usr/local/bin/wait-for-it

# Copy the rest of the application code
COPY . .

# Expose port
EXPOSE 5000

# Command to run my app
CMD [ "sh", "-c", "wait-for-it db:27017 -- npm start" ]


