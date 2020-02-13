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
}
