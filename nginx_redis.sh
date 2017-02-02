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
sudo cp default /etc/nginx/sites-available/default
sudo service nginx restart

echo 'Done'