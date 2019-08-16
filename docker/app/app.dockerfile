FROM php:7.1-fpm

# Update dos pacotes e instalação dos pacotes necessários
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl \
  libmemcached-dev \
  libz-dev \
  libpq-dev \
  libssl-dev \
  libmcrypt-dev \
  zlib1g-dev \
  vim \
  gettext-base \
  && rm -rf /var/lib/apt/lists/*

# Instalando composer e deixando disponível globalmente
RUN cd /home && curl -s https://getcomposer.org/installer | php

RUN mv /home/composer.phar /usr/local/bin/composer

# Instalando a extensão do PHP mcrypt
RUN docker-php-ext-install mcrypt \
  # Instalando a mbstring
  && docker-php-ext-install mbstring \
  # Instalando a extensão ZIP
  && docker-php-ext-install zip \
  # Instalando a extensão do PHP pdo_mysql
  && docker-php-ext-install pdo_mysql \
  # Instalando a extensão do PHP pdo_pgsql
  && docker-php-ext-install pdo_pgsql

# Copiando scripts necessários para dentro da imagem.
COPY ./docker/app/docker-entrypoint.sh /docker/docker-entrypoint.sh

# Permissão de execução para os scripts
RUN chmod +x /docker/docker-entrypoint.sh

WORKDIR /var/www/html
VOLUME /var/www/html
EXPOSE 9000

# Script de inicialização do container
ENTRYPOINT ["/docker/docker-entrypoint.sh"]