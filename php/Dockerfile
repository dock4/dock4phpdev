ARG PHP_VERSION_ARG

FROM php:${PHP_VERSION_ARG}-fpm

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

# ARG TZ
# ENV TZ=${TZ}

ARG PHP_VERSION_ARG

RUN set -xe; \
    apt-get update; \
    pecl channel-update pecl.php.net; \
    apt-get install -yqq \
            # bz2
            libbz2-dev \
            # zip
            libzip-dev zip unzip;

RUN set -xe; \
    docker-php-ext-install \
            bcmath \
            bz2 \
            calendar \
            ctype \
            # curl \
            # dba \
            # dom \
            # enchant \
            # exif \
            # fileinfo \
            # filter \
            # ftp \
            # gd \
            # gettext \
            # gmp \
            # hash \
            # iconv \
            # imap \
            # interbase \
            # intl \
            # json \
            # ldap \
            # mbstring \
            # mysqli \
            # oci8 \
            # odbc \
            # opcache \
            # pcntl \
            # pdo \
            # pdo_dblib \
            # pdo_firebird \
            # pdo_mysql \
            # pdo_oci \
            # pdo_odbc \
            # pdo_pgsql \
            # pdo_sqlite \
            # pgsql \
            # phar \
            # posix \
            # pspell \
            # readline \
            # recode \
            # reflection \
            # session \
            # shmop \
            # simplexml \
            # snmp \
            # soap \
            # sockets \
            # sodium \
            # spl \
            # standard \
            # sysvmsg \
            # sysvsem \
            # sysvshm \
            # tidy \
            # tokenizer \
            # wddx \
            # xml \
            # xmlreader \
            # xmlrpc \
            # xmlwriter \
            # xsl \
            # zend_test \
            # ; php -m;
            zip; php -m;

# php -m | grep -q 'zip'

WORKDIR /var/www
