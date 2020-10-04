server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/vhosts/ericpolman.com/current;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name ericpolman.com;

    location ^~ /blog/ {
        proxy_pass http://127.0.0.1:3742/;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}