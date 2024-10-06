#!/bin/bash

# Install SSM Agent
yum install -y amazon-ssm-agent

# Start and enable the SSM Agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Install NGINX
# Update the package list
sudo yum update -y

# Install NGINX
sudo yum install nginx-1.24.0 -y

# Start NGINX
sudo systemctl start nginx

# Ensure NGINX starts on boot
sudo systemctl enable nginx