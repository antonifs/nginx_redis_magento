# Installation Nginx, PHP-FPM and Redis for Magento

Command of Nginx, PHP-FPM installation
```sh
$ sudo sh nginx.sh
```

Command of Redis, Backend Cache installation
- Install redis
- Create three instances redis run in port: 6379/ 6380/ 6381
- 6379 -> Instance of Magento backend cache
- 6380 -> Instance of Magento session cache
- 6381 -> Instance of magento full page chache
```sh
$ sudo sh redis.sh
$ sudo sh backend_cache.sh
```



