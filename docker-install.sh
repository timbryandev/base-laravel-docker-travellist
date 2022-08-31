echo "docker: building"
docker-compose build app

echo
echo "docker: upping"
docker-compose up -d

echo
echo "docker: listing"
docker-compose ps
docker-compose exec app ls -l

echo
echo "composer: installing"
docker-compose exec app rm -rf vendor composer.lock
docker-compose exec app composer install

echo
echo "artisan: key:generate"
docker-compose exec app php artisan key:generate

echo
echo "our app should now be running on http://localhost:8000"