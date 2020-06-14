# WARNING
# This does not work. The WP cli does not create the config file correctly. It seems to think that there is no WP installation.
# Even if that worked the wp config command needs a DB up and running in order to be able to configure correctly



#FROM wordpress:php7.3-apache
FROM wordpress:cli-php7.4

ENV url wp-cli.dest.internal
ENV title test website
ENV admin-user joncatlin
ENV admin-password password
ENV admin-email jonc@destini.com

ENV rubbish delete

#WORKDIR /var/www/html

#USER www-data

COPY wp-startup.sh .

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
