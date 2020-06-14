# WARNING
# This does not work. The WP cli does not create the config file correctly. It seems to think that there is no WP installation.
# Even if that worked the wp config command needs a DB up and running in order to be able to configure correctly



#FROM wordpress:php7.4-apache
FROM wordpress:5.4.2

# ENV url wp-cli.dest.internal
# ENV title test website
# ENV admin-user joncatlin
# ENV admin-password password
# ENV admin-email jonc@destini.com


RUN apt-get update && apt-get upgrade -y && apt install iputils-ping -y

#WORKDIR /var/www/html

COPY wp-startup.sh .

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp --info

# RUN pwd

# RUN wp core download --path=/var/www/html && \
#     wp config create --dbname=wp --dbuser=root --dbpass=wpdbroot --locale=ro_RO --force && \
#     ls -l && \
#     wp core install --url=$url --title=$title --admin_user=$admin-user --admin_password=$admin-password --admin_email=$admin-email --skip-email && \
#     ls -l
#

#USER www-data
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["sleep", "555555555555555"]

# Commands from the wp image
#CMD ["apache2-foreground"]


# TODO
# 1. Remove any installation files that are not needed
