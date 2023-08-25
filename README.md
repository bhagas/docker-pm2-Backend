

secara default berjalan pada port 5000, bisa disesuaikan pada saat pembuatan container.

Build Image:
```
docker build -t nama_aplikasi .
```
Jalankan container:
```
docker run -d -t -i -v /path/ke/asset:/asset -e DB_HOST='172.17.0.2' -e DB_USER='root' -e DB_PASSWORD='password' -e DB_NAME='nama_db' -e DB_PORT=3306 -p 5000:5000 --name nama_container nama_aplikasi
```
atau
```
docker run -d -t -i -v /path/ke/asset:/asset -p 5000:5000 --name nama_container nama_aplikasi
```


untuk updating:
```
git pull origin main &&
docker cp ./.env nama_container:/ &&
docker cp ./src nama_container:/ &&
docker cp ./package.json nama_container:/ &&
docker exec -it nama_container npm install &&
docker exec -it nama_container pm2 reload all
```

untuk Jenkins:
```
cd /path/ke/directory; docker cp ./.env nama_container:/
cd /path/ke/directory; docker cp ./src nama_container:/
cd /path/ke/directory; docker cp ./package.json nama_container:/
cd /path/ke/directory; docker exec -it nama_container npm install
cd /path/ke/directory; docker exec -it nama_container pm2 reload all
```

untuk monitoring:
```
docker exec -it nama_container pm2 monit
```

untuk list process berjalan:
```
docker exec -it nama_container pm2 list
```

notes:
- jika backend terhubung ke redis pastikan configurasi sesuai untuk pm2 cluster
