ARG PHP_VERSION_ARG="7.4"

FROM php:${PHP_VERSION_ARG}-fpm

# Set Environment Variables
ENV DEBIAN_FRONTEND=noninteractive

# ARG TZ
# ENV TZ=${TZ}

ARG PHP_VERSION_ARG

RUN set -eux; \
    groupmod -o -g 1000 www-data; \
    usermod -o -u 1000 -g www-data www-data; \
    apt-get update; \
    pecl channel-update pecl.php.net; \
    apt-get install -yqq \
        git \
        # bz2
        libbz2-dev \
        # dom
        libxml2-dev \
        # enchant
        # libenchant-dev \
        # gmp
        libgmp-dev \
        # ldap
        libldap2-dev \
        # imap
        libc-client-dev libkrb5-dev \
        # pgsql pdo_pgsql
        libpq-dev \
        # readline
        libedit-dev \
        # xsl
        libxslt1-dev \
        # zip
        libzip-dev zip unzip \
    ;
RUN set -xe; \
        # pdo_dblib
        apt-get install -qq freetds-dev libsybdb5; \
        ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/;
RUN set -xe; \
    docker-php-ext-configure \
        imap --with-kerberos --with-imap-ssl \
    ; \
    docker-php-ext-install \
        bcmath \
        bz2 \
        calendar \
        ctype \
        # curl \ ### bundled
        dba \
        dom \
        # enchant \
        exif \
        fileinfo \
        # filter \
        # ftp \
    ;
RUN set -xe; \
    apt-get install -yqq libfreetype6-dev libjpeg-dev libpng-dev; \
    if [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") < "70400" ]; then \
        # PHP 7.4 GD no need config options
        docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr; \
    fi; \
    docker-php-ext-install \
        gd \
        gettext \
    ; \
    php -m | grep -q 'gd'; \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h; \
    fi; \
    docker-php-ext-install \
        gmp \
    ; \
    php -m | grep -q 'gmp'; \
    docker-php-ext-install \
        # hash \
        iconv \
        # imap \
        # interbase \
        # intl \
        json \
        # ldap \
        ### mbstring \ # need 'oniguruma'
        mysqli \
        # oci8 \
        # odbc \
        # opcache \
        # pcntl \
        pdo \
        pdo_dblib \
        # pdo_firebird \
        pdo_mysql \
        # pdo_oci \
        # pdo_odbc \
        pdo_pgsql \
        ### pdo_sqlite \
        pgsql \
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
        soap \
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
        ### bundled
        # xml \
        # xmlreader \
        # xmlwriter \
        ### bundled
        xmlrpc \
        xsl \
        # zend_test \
        zip \
    ; \
    pecl install -o -f redis; \
    docker-php-ext-enable redis; \
    php -m;

# RUN set -xe; \
#     apt-get install -yqq libsnmp-dev; \
#     docker-php-ext-install \
#         iconv \
#     ; \
#     php -m | grep -q 'iconv' \
#     ;

WORKDIR /var/www
