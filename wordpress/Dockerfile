# WARNING
# This does not work. The WP cli does not create the config file correctly. It seems to think that there is no WP installation.
# Even if that worked the wp config command needs a DB up and running in order to be able to configure correctly



#FROM wordpress:php7.3-apache
FROM wordpress:cli-php7.4

ENV URL wp-cli.dest.internal
ENV TITLE "test website"
ENV ADMIN_USER joncatlin
ENV ADMIN_PASSWORD password
ENV ADMIN_EMAIL jonc@destini.com

#WORKDIR /usr/local/bin

#USER www-data

COPY wp-startup.sh /usr/local/bin/
#COPY wordpress-5.4.2.tar.gz .

# RUN pwd

# RUN wp core download --path=/var/www/html && \
#     wp config create --dbname=wp --dbuser=root --dbpass=wpdbroot --locale=ro_RO --force && \
#     ls -l && \
#     wp core install --url=$url --title=$title --admin_user=$admin-user --admin_password=$admin-password --admin_email=$admin-email --skip-email && \
#     ls -l
#
CMD ["sleep", "555555555555555"]


# TODO
# 1. Remove any installation files that are not needed
