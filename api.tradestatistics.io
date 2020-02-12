server {
    server_name api.tradestatistics.io www.api.tradestatistics.io;

    access_log /var/log/nginx/api.access.log;
    error_log /var/log/nginx/api.error.log;

    location / {
      proxy_pass http://localhost:8080;
      proxy_redirect http://localhost:8080/ https://$host/;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      proxy_read_timeout 20d;
    }
    
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/api.tradestatistics.io/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/api.tradestatistics.io/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
server {
    if ($host = www.api.tradestatistics.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    if ($host = api.tradestatistics.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    server_name api.tradestatistics.io www.api.tradestatistics.io;
    listen 80;
    return 404; # managed by Certbot
}
