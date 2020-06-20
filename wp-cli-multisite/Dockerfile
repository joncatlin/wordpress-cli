FROM wordpress:cli-php7.4

USER root

# Modify the uid and gid of www-data to be consistent between this container and the one running wordpress. 
# This prevents any permission errors between the two containers as this one tries to modify files in the other one
RUN apk --no-cache add shadow && \
    usermod -u 1000 www-data && \
    groupmod -g 1000 www-data

USER www-data

# Copy the resources needed intot he image
COPY wp-install.sh ./wait-for .htaccess /var/www/
COPY ./plugins/ /var/www/plugins/
COPY ./themes/ /var/www/themes/

# Set up env vars for use in the WP install
ENV URL http://wpms.test
ENV TITLE main-website
ENV ADMIN_USER joncatlin
ENV ADMIN_PASSWORD password
ENV ADMIN_EMAIL jonc@destini.com

VOLUME /var/www/html

#CMD ["sleep", "555555555555555"]
CMD ["../wait-for", "wp:80", "-t", "30", "--", "/var/www/wp-install.sh"]
