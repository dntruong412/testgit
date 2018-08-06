FROM php:5.6-apache
MAINTAINER TruongDinh <d.truong@evolableasia.com>

RUN pecl install xdebug-2.5.5 \
	&& docker-php-ext-enable xdebug
RUN docker-php-ext-install pdo_mysql mysqli

RUN a2enmod rewrite

# Install app
RUN mkdir -p /var/www/vhost/

# Configure apache 80
ADD ./config/000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
