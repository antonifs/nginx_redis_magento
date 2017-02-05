echo 'update package'
sudo apt-get update

sudo service apache2 stop

echo 'Install Nginx'
sudo apt-get install -y nginx

echo 'Install PHP FPM'
sudo apt-get install -y php5-fpm php5-mysql

# Let's tune the config
# cgi.fix_pathinfo=0
# realpath_cache_size = 32k
# realpath_cache_ttl = 7200
# max_execution_time = 90
# max_input_time = 90
# memory_limit = 256M
# default_socket_timeout = 90
# pdo_mysql.cache_size = 2000
# output_buffering = 4096
sudo cp php.ini /etc/php5/fpm/php.ini
sudo service php5-fpm restart

# change the root directory
# host
# static file 
sudo cd /etc/nginx/sites-available/
sudo echo 'server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    #root /var/www/html/magento;
    root /vagrant_data/www/magento;
    index index.php index.html index.htm;

    server_name localhost;

    location / {
        # try_files $uri $uri/ =404;
        try_files $uri $uri/ @handler;
        expires 30d;
    }

    location /app/                       { deny all; }
    location /includes/                  { deny all; }
    location /lib/                       { deny all; }
    location /media/downloadable/        { deny all; }
    location /pkginfo/                   { deny all; }
    location /report/config.xml          { deny all; }
    location /var/                       { deny all; }

    location /var/export/ {
        auth_basic              "Restricted";
        auth_basic_user_file    htpasswd;
        autoindex               on;
    }

    location  /. {
        return 404;
    }

    location @handler {
        rewrite / /index.php;
    }

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        rewrite ^(.*.php)/ $1 last;
    }

    location ~* ^.+\.(css|js|jpg|jpeg|gif|png|ico|gz|svg|svgz|ttf|otf|woff|eot|mp4|ogg|ogv|webm)$ {
        expires max;
        access_log off;
    }    

    rewrite ^/minify/([0-9]+)(/.*.(js|css))$ /lib/minify/m.php?f=$2&d=$1 last;
    rewrite ^/skin/m/([0-9]+)(/.*.(js|css))$ /lib/minify/m.php?f=$2&d=$1 last;

    location /lib/minify/ {
        allow all;
    }

    gzip on;

    #gzip_comp_level 9;
    gzip_min_length  1000;
    gzip_proxied any;
    gzip_types       text/plain application/xml text/html text/css text/js application/x-javascript;
}' > default
sudo service nginx restart

echo 'Done'