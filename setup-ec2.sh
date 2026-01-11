#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js (v18)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install Git and Nginx
sudo apt install -y git nginx

# Install PM2 globally
sudo npm install -g pm2

# Check versions
echo "Installed versions:"
node -v
npm -v
pm2 -v

echo "------------------------------------------------"
echo "Setup complete! Now you can clone your repo and run: npm install && pm2 start index.js"
echo "------------------------------------------------"
