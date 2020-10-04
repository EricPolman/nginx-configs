server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/vhosts/ericpolman.com/current;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name ericpolman.com;

    location ^~ / {
        proxy_pass http://127.0.0.1:3742;
    }
}
