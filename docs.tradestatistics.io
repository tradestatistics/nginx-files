server {
    server_name docs.tradestatistics.io www.docs.tradestatistics.io;
    root /www/tradestatistics/docs;
    index index.html;
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/docs.tradestatistics.io/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/docs.tradestatistics.io/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
server {
    if ($host = www.docs.tradestatistics.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    if ($host = docs.tradestatistics.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen 80;
    server_name docs.tradestatistics.io www.docs.tradestatistics.io;
    return 404; # managed by Certbot
}
