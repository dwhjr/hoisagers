# Hoisagers.com

## Project Overview
Hoisagers.com is a splash page template for an upcoming experience. The site is hosted in a Dockerized environment and served using Nginx.

## File Structure
```
├── Dockerfile
├── docker-compose.yml
├── hoisagers-com
├── hoisagers-structure.txt
├── images
│   └── img-splash.png.webp
└── index.html
```

## Technologies Used
- HTML/CSS
- Docker & Docker Compose
- Nginx
- AWS Lightsail* (or any hosting area)

## Setup & Deployment
### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/hoisagers.com.git
cd hoisagers.com
```

### 2. Build and Run the Docker Container
```bash
docker-compose up -d --build
```

### 3. Verify the Running Container
```bash
docker ps
```
You should see a running container named `hoisagers`.

### 4. Configure Nginx Reverse Proxy (If Needed)
If using Nginx as a reverse proxy, update `/etc/nginx/sites-available/hoisagers` with:
```nginx
server {
    listen 80;
    server_name hoisagers.com www.hoisagers.com;

    location / {
        proxy_pass http://hoisagers:80;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```
Reload Nginx:
```bash
sudo systemctl restart nginx
```

### 5. Obtain an SSL Certificate
Use Let's Encrypt to secure the site:
```bash
sudo certbot --nginx -d hoisagers.com -d www.hoisagers.com
```

## Updating the Splash Page
Modify `index.html` and restart the container:
```bash
docker-compose restart
```

## Acknowldgements and Parting Thoughts
Hoisagers.com is part of the Solo-Orbit ecosystem, developed for . Stay tuned!</br>
Be Kind</br>
Pals

