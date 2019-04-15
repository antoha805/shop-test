# shop-test
```
cp app/.env.example app/.env
docker-compose up -d
docker exec -it shop-test-php-fpm /bin/bash
composer install
php artisan migrate --seed
chmod 777 -R storage
chmod 777 -R public
chmod 777 -R bootstrap
npm install
npm run watch
exit
```

Open localhost:8012
