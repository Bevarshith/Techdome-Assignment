# First stage: Build the frontend
FROM node:16 as build-stage

WORKDIR /frontend
COPY ./frontend/package.json ./frontend/package-lock.json ./
RUN npm install
COPY ./frontend /frontend
RUN npm run build

# Second stage: Serve the app using Nginx
FROM nginx:alpine

# Copy the build output from the build stage
COPY --from=build-stage /frontend/build /usr/share/nginx/html

# Expose port for the web server
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

