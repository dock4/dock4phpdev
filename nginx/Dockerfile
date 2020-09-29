FROM nginx:alpine

# ARG TZ
# ENV TZ=${TZ}

RUN echo "upstream php72-upstream { server php72-fpm:9000; }" > /etc/nginx/conf.d/upstream72.conf; \
    echo "upstream php74-upstream { server php74-fpm:9000; }" > /etc/nginx/conf.d/upstream74.conf; \
    rm /etc/nginx/conf.d/default.conf; \
    apk update; \
    apk upgrade; \
    apk add --no-cache bash zsh

COPY nginx.conf /etc/nginx/
