# PHP 容器化開發環境

#### Quick start

處理設定檔，依照自己的環境調整 .env 內的設定, 起碼 port 不要衝突到

``` shell
git clone --depth 1 https://github.com/dock4/dock4phpdev.git
cd ./dock4phpdev
cp .env-example .env
```

建立每個 service 的 image

``` shell
docker-compose build
```

啟動全部的 service 容器，並以確認容器狀態都是 Up。

``` shell
docker-compose up -d
docker-compose ps
```

開啟瀏覽器 http://127.0.0.1:2080/ 應該就可以看到 nginx 的預設畫面

停止全部的 service 容器。

``` shell
docker-compose down
```
