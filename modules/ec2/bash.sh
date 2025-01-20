#!/bin/bash

# Install nginx
sudo yum update -y
sudo yum install nginx -y

# Start nginx and enable it on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a "Hello, World" page
echo "Hello, World!!!" | sudo tee /var/www/html/index.html