#cd /vagrant_data/www/magento
cd /var/www/html/magento

modman clone git://github.com/colinmollenhour/Cm_RedisSession.git
modman clone https://github.com/GordonLesti/Lesti_Fpc.git

mv /var/www/html/magento/app/etc/fpc.xml.sample /var/www/html/magento/app/etc/fpc.xml
sed -i "s#<port>6379</port>#<port>6381</port>#" /var/www/html/magento/app/etc/fpc.xml

modman clone https://github.com/steverobbins/Magento-Redismanager.git
