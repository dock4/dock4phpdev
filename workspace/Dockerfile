FROM ubuntu:20.04

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

# ARG TZ
# ENV TZ=${TZ}

RUN set -xe; \
    apt-get update; \
    apt-get install -y software-properties-common curl git vim nano; \
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
            php7.2-zip;

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
            php7.4-zip;
