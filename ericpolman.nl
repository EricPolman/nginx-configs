server {
	listen 80;
	server_name www.ericpolman.nl ericpolman.nl;
	return 301 https://ericpolman.com$request_uri;
}

