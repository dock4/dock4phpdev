FROM nginx:alpine

# ARG TZ
# ENV TZ=${TZ}

RUN set -eux; \
    # echo "upstream php56-upstream { server php56-fpm:9000; }" > /etc/nginx/conf.d/upstream56.conf; \
    # echo "upstream php72-upstream { server php72-fpm:9000; }" > /etc/nginx/conf.d/upstream72.conf; \
    # echo "upstream php73-upstream { server php73-fpm:9000; }" > /etc/nginx/conf.d/upstream73.conf; \
    echo "upstream php74-upstream { server php74-fpm:9000; }" > /etc/nginx/conf.d/upstream74.conf; \
    ### 先保留 nginx 預設頁面
    # rm /etc/nginx/conf.d/default.conf; \
    apk update; \
    apk upgrade; \
    apk add --no-cache bash zsh

COPY nginx.conf /etc/nginx/
