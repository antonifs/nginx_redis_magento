echo "Install modman"
sudo bash < <(curl -s -L https://raw.github.com/colinmollenhour/modman/master/modman-installer)
sudo mv ~/bin/modman /usr/bin/modman
sudo export PATH=/usr/bin/modman:$PATH

echo "Modman init"
cd /vagrant_data/www
modman init
cd .modman
sudo echo magento > .basedir
cd ../magento

modman clone git://github.com/colinmollenhour/Cm_Cache_Backend_Redis.git

sed -i '/session_save/redis_config.txt' /vagrant_data/www/magento/app/etc/local.xml

echo "Done"