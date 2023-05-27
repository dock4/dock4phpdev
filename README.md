# PHP 容器化開發環境

#### Service default port list

- 2080 Nginx HTTP
- 2443 Nginx HTTPS
- 3306 MySQL 5.7
- 3307 MySQL 8.0
- 5432 PostgreSQL
- 6379 Redis
- 7700 MeiliSearch
- 13306 phpMyAdmin
- 23306 Adminer
- 9000 Minio
- 9001 Minio Console
- 1025 MailHog SMTP
- 8025 MailHog Web UI

#### Quick start

處理設定檔，依照自己的環境調整 .env 內的設定, 起碼 port 不要衝突到

``` shell
git clone --depth 1 https://github.com/dock4/dock4phpdev.git
cd ./dock4phpdev
cp .env.example .env
```

建立每個 service 的 image

``` shell
docker-compose build
```

調整 .env 設定 (密碼的預設值建議都改掉)

建立 nginx sites *.conf (對 server_name, root, error_log, access_log 參數做適當設定)

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

## Local DNS

設定 hosts 檔配合 nginx sites 設定

在 Windows 編輯 `C:\Windows\System32\drivers\etc\hosts` 要用管理者權限


## Todo

- 處理 host ssh key 掛入 workspace 讓 git 套用

## 服務
### MeileSearch

進入 workspace 容器後可用 `curl http://meilisearch:7700/health | jq` 指令測試，回傳 `{ "status": "available" }` 就是正常。

測試 KEY

```shell
curl http://meilisearch:7700/indexes -H 'Authorization: Bearer masterKey' | jq
```
