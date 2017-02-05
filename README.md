# Installation Nginx, PHP-FPM and Redis for Magento

Command of Nginx, PHP-FPM installation
```sh
$ sudo sh nginx.sh
```
What this script does is install Nginx, PHP-FPM and configure Nginx config so that match with Magento need, also configure php.ini 

Command of Redis, Backend Cache installation
- Install redis
- Create three instances redis run in port: 6379/ 6380/ 6381
- 6379 -> Instance of Magento backend cache
- 6380 -> Instance of Magento session cache
- 6381 -> Instance of magento full page chache
- Install modman 
- Install and configure redis backend cache 

```sh
$ sudo sh redis.sh
$ sudo sh backend_cache.sh
```



