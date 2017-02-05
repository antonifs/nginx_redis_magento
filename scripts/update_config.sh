sed -i '/session_save/r redis_config.txt' /var/www/html/magento/app/etc/local.xml

rm server1.conf
rm server2.conf
rm server3.conf
rm -rf servers

echo "Done"