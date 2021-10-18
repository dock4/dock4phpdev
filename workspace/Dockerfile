FROM ubuntu:20.04

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

# ARG TZ
# ENV TZ=${TZ}

RUN set -xe; \
    apt-get update; \
    apt-get install -y software-properties-common sudo wget curl git vim nano unzip iputils-ping; \
    # dblib
    apt-get install -y freetds-dev freetds-bin libsybdb5; \
    ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/; \
    # Add the "PHP 7" ppa
    add-apt-repository -y ppa:ondrej/php; \
    apt-get update

RUN set -xe; \
    apt-get install -y \
            php7.2-bcmath \
            php7.2-bz2 \
            php7.2-cli \
            php7.2-common \
            php7.2-curl \
            php7.2-dev \
            php7.2-fpm \
            php7.2-gd \
            php7.2-gmp \
            php7.2-imap \
            php7.2-intl \
            php7.2-json \
            php7.2-ldap \
            php7.2-mbstring \
            php7.2-mysql \
            php7.2-opcache \
            php7.2-pgsql \
            php7.2-readline \
            php7.2-snmp \
            php7.2-soap \
            php7.2-sqlite3 \
            php7.2-xml \
            php7.2-xmlrpc \
            php7.2-xsl \
            php7.2-zip; \
    curl -L -o /tmp/php-7.2.tar.gz https://github.com/php/php-src/archive/PHP-7.2.tar.gz; \
    mkdir /tmp/php-7.2-src; \
    tar --strip 1 -zxvf /tmp/php-7.2.tar.gz -C /tmp/php-7.2-src; \
    cd /tmp/php-7.2-src/ext/pdo_dblib/; \
    phpize7.2; \
    ./configure; \
    make; \
    make install; \
    echo "extension=pdo_dblib.so" > /etc/php/7.2/mods-available/pdo_dblib.ini; \
    ln -s /etc/php/7.2/mods-available/pdo_dblib.ini /etc/php/7.2/cli/conf.d/20-pdo_dblib.ini; \
    ln -s /etc/php/7.2/mods-available/pdo_dblib.ini /etc/php/7.2/fpm/conf.d/20-pdo_dblib.ini; \
    rm -rf /tmp/php-7.2.tar.gz /tmp/php-7.2-src

RUN set -xe; \
    apt-get install -y \
            php7.4-bcmath \
            php7.4-bz2 \
            php7.4-cli \
            php7.4-common \
            php7.4-curl \
            php7.4-dev \
            php7.4-fpm \
            php7.4-gd \
            php7.4-gmp \
            php7.4-imap \
            php7.4-intl \
            php7.4-json \
            php7.4-ldap \
            php7.4-mbstring \
            php7.4-mysql \
            php7.4-opcache \
            php7.4-pgsql \
            php7.4-readline \
            php7.4-snmp \
            php7.4-soap \
            php7.4-sqlite3 \
            php7.4-xml \
            php7.4-xmlrpc \
            php7.4-xsl \
            php7.4-zip; \
    curl -L -o /tmp/php-7.4.tar.gz https://github.com/php/php-src/archive/PHP-7.4.tar.gz; \
    mkdir /tmp/php-7.4-src; \
    tar --strip 1 -zxvf /tmp/php-7.4.tar.gz -C /tmp/php-7.4-src; \
    cd /tmp/php-7.4-src/ext/pdo_dblib/; \
    phpize7.4; \
    ./configure; \
    make; \
    make install; \
    echo "extension=pdo_dblib.so" > /etc/php/7.4/mods-available/pdo_dblib.ini; \
    ln -s /etc/php/7.4/mods-available/pdo_dblib.ini /etc/php/7.4/cli/conf.d/20-pdo_dblib.ini; \
    ln -s /etc/php/7.4/mods-available/pdo_dblib.ini /etc/php/7.4/fpm/conf.d/20-pdo_dblib.ini; \
    rm -rf /tmp/php-7.4.tar.gz /tmp/php-7.4-src

RUN curl -s https://getcomposer.org/installer | php; \
    mv composer.phar /usr/local/bin/composer

RUN composer global require "laravel/envoy=~1.0"

RUN curl -LO https://deployer.org/deployer.phar; \
    mv deployer.phar /usr/local/bin/dep; \
    chmod +x /usr/local/bin/dep

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

RUN set -xe; \
    # minio client
    # https://min.io/download#/linux
    curl -L -o mcli_amd64.deb https://dl.min.io/client/mc/release/linux-amd64/mcli_20211007041958.0.0_amd64.deb; \
    dpkg -i mcli_amd64.deb; \
    rm -rf mcli_amd64.deb

RUN set -xe; \
    groupadd -g 1000 worker; \
    useradd -l --uid 1000 -g worker -G sudo --create-home worker; \
    usermod -p "*" worker -s /bin/bash; \
    echo 'worker ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/99-worker

WORKDIR /var/www/
