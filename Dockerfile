FROM php:7.4-fpm-alpine

RUN apk update \
	&& apk add --no-cache bash openssh-server openssh-keygen git \
	git-daemon subversion mercurial freetype libpng libjpeg-turbo libzip \
	py-pygments sudo sed procps zlib imagemagick \
	&& apk add --no-cache --virtual .build-deps \
	$PHPIZE_DEPS freetype-dev libpng-dev libjpeg-turbo-dev libzip-dev \
	&& docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
	&& docker-php-ext-configure opcache --enable-opcache \
	&& docker-php-ext-install gd opcache mysqli pcntl zip \
	&& pecl install apcu \
	&& docker-php-ext-enable apcu \
	&& apk del .build-deps \
	&& mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini \
	&& adduser -D vcs \
	&& passwd -u vcs \
	&& adduser -D phuser \
	&& ln -s /usr/local/bin/php /bin/php \
	&& ln -s /usr/libexec/git-core/git-http-backend /usr/bin/git-http-backend \
	&& mkdir -p /usr/src/docker_ph/

COPY env_secrets_expand.sh wait-for.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/env_secrets_expand.sh \
	&& chmod +x /usr/local/bin/wait-for.sh

CMD ["php-fpm", "-F"]
