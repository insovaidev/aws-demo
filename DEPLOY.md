# Deploying Mike's Macaroon Market to AWS EC2

This guide will walk you through setting up your Node.js application on an AWS EC2 instance.

## 1. Launch EC2 Instance
*   **AMI:** Ubuntu Server 22.04 LTS (HVM)
*   **Instance Type:** t2.micro (Free Tier eligible)
*   **Security Group:** 
    *   Allow SSH (Port 22) from your IP.
    *   Allow Custom TCP (Port 8080) from anywhere (or Port 80 if using Nginx).

## 2. Connect to your Instance
```bash
ssh -i "your-key.pem" ubuntu@your-ec2-public-ip
```

## 3. One-Click Setup (Run on EC2)
Copy and run this command on your EC2 terminal to install everything needed:

```bash
curl -sL https://raw.githubusercontent.com/nodesource/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs git nginx
sudo npm install -g pm2
```

## 4. Clone and Prepare
```bash
git clone <your-repo-url>
cd aws-demo
npm install
npm run build
```

## 5. Configure Environment
Create a `.env` file and add your credentials:
```bash
nano .env
```
Paste the following and fill in your details:
```env
PORT=8080
DB_HOST=your-rds-endpoint-or-localhost
DB_PORT=5432
DB_NAME=mikes_macaroon_market
DB_USER=postgres
DB_PASS=your-password
S3_BUCKET=your-bucket-name
S3_REGION=your-region
S3_ACCESS_KEY=your-access-key
S3_SECRET_KEY=your-secret-key
```

## 6. Run the App
```bash
pm2 start index.js --name "macaroon-market"
pm2 save
pm2 startup
```

## 7. (Optional) Nginx Reverse Proxy
To access the app on port 80 instead of 8080:
1. Edit Nginx config: `sudo nano /etc/nginx/sites-available/default`
2. Replace `location /` block with:
   ```nginx
   location / {
       proxy_pass http://localhost:8080;
       proxy_http_version 1.1;
       proxy_set_header Upgrade $http_upgrade;
       proxy_set_header Connection 'upgrade';
       proxy_set_header Host $host;
       proxy_cache_bypass $http_upgrade;
   }
   ```
3. Restart Nginx: `sudo systemctl restart nginx`


npm install && npm start &&
disown


http://35.172.229.7:3000/products