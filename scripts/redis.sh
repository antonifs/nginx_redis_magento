echo 'Installing Redis...'
sudo apt-get install -y redis-server
sudo apt-get install -y php5-redis

echo 'Configure multiple instances redis'
sudo service redis-server stop
sudo cd /etc/init.d
sudo mv redis-server redis-server.old
sudo mv redis-server-new redis-server

sudo cd /etc/redis
sudo mkdir servers && cd "$_"
cp redis.conf ./servers/server1.conf
cp redis.conf ./servers/server1.conf
cp redis.conf ./servers/server1.conf
