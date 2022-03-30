# Setup

Put these files in `/etc/nginx/sites-available`. In order to make https work, follow this guide: https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04

Example:
```bash
cd /etc/nginx/sites-enabled
ln -s /etc/nginx/sites-available/api.tradestatistics.io
sudo certbot --nginx -d api.tradestatistics.io -d www.api.tradestatistics.io
```
