# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the application files into the container
COPY . /var/www/html/

# Install any necessary dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libxml2-dev \
    zip \
    unzip

# Install any necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql gd xml zip

# Expose port 80 to allow outside access
EXPOSE 80

# Start the Apache web server when the container starts
CMD ["apache2-foreground"] 
