FROM php:8.2-fpm

LABEL maintainer="Bug Report <bugreport@bugreport.com>"

WORKDIR /var/www

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd exif zip imagick gmp mysqli pdo_mysql

RUN apt-get update \
   && apt install -y apt-utils \ 
   vim nano \
   --no-install-recommends build-essential \
   mariadb-client \
   libfreetype6-dev \
    libjpeg-dev \
   libpng-dev \
   libwebp-dev \
   zlib1g-dev \
   libzip-dev \
   libsodium-dev \
   libmagickwand-dev \
   gcc \
   g++ \
   make \
   vim \
   unzip \
   git \
   jpegoptim \
   optipng \
   pngquant \
   gifsicle \
   locales \
   libonig-dev \
	&& apt-get autoclean -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/pear/


COPY . /var/www

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd --force laravel-group
RUN useradd  -ms /bin/bash -g www-data hpt
RUN chown -R hpt:laravel-group /var/www/

RUN chown -R hpt:laravel-group \
   /var/www/storage/app/public \
   /var/www/public/ \
  /var/www/storage \
  /var/www/bootstrap/cache \
  ~/.composer

USER hpt

RUN chmod +x ./docker/development/8.1/start-container.sh
ENTRYPOINT [ "./docker/development/8.1/start-container.sh" ]

RUN echo 'alias phpunit="vendor/bin/phpunit"' >> ~/.bashrc


CMD ["php-fpm"]