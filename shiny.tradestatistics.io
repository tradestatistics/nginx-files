server {
    server_name shiny.tradestatistics.io www.shiny.tradestatistics.io;

    access_log /var/log/nginx/shiny.access.log;
    error_log /var/log/nginx/shiny.error.log;

    location / {
      proxy_pass http://localhost:3838;
      proxy_redirect http://localhost:3838/ https://$host/;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      proxy_read_timeout 20d;
    }
}
