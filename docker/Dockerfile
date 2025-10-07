# Use PHP with Apache
FROM php:7.4-apache

# Install mysqli extension for database connectivity
RUN docker-php-ext-install mysqli

# Copy application files to Apache web directory
COPY src/ /var/www/html/

# Update database connection to use Kubernetes service (replace placeholders)
ENV DB_HOST=mysql-service
ENV DB_USER=admin
ENV DB_PASSWORD=password
ENV DB_NAME=ecom_db

# Expose port 80 for web traffic
EXPOSE 80