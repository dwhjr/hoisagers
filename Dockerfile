# Use an Nginx base image
FROM nginx:latest

# Remove default Nginx config
RUN rm -rf /usr/share/nginx/html/*

# Copy the splash page files to the container
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

