#!/bin/bash
# Bash script for installing wordpress, configuring it and then running it

# Check to see if wordpress is installed. Look for the wp-admin directory in /var/www/html

    # Ensure in the ciorrect directory 
#    cd /usr/local/bin - This doees not work as wp config throws an error
    cd /var/www/

    # Download the specific version of wprdpress
    # TODO make the version number an env variable
    wp core download --path=/var/www/html --locale=en_US --version=4.5.2

    # # Extract the files from the tar ball into the correct location and then tidy up
    # tar -xf /usr/local/bin/wordpress-5.4.2.tar.gz -C /var/www/html
    # mv wordpress/* .
    # rmdir wordpress

    # Create the wordpress from the config file
    wp config create  --path=/var/www/html --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --locale=en_US --force

    wp core install  --path=/var/www/html --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email



wp core download [<download-url>] [--path=<path>]  [--version=<version>] [--skip-content] [--force]

# Need to determine if the files are installed before making changes
if ! $(wp core is-installed --path=/var/www/html); then
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --locale=en_US --force

    wp config create --dbname=wp --dbuser=root --dbpass=wpdbroot --dbhost=wp-cli-db --locale=ro_RO --force
      WORDPRESS_DB_HOST: wpdb
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: wpdbroot
      WORDPRESS_DB_NAME: wp


    wp core install --url=docker03.dest.internal:8090 --title="hi jon" --admin_user=joncatlin --admin_password=password --admin_email=jonc@destini.com --skip-email --path=/var/www/html --allow-root
    wp core install --url=$url --title=$title --admin_user=$admin-user --admin_password=$admin-password --admin_email=$admin-email --skip-email
fi


sleep 555555555555555






<download-url>]
Download directly from a provided URL instead of fetching the URL from the wordpress.org servers.
[--path=<path>]
Specify the path in which to install WordPress. Defaults to current directory.
[--locale=<locale>]
Select which language you want to download.
[--version=<version>]
Select which version you want to download. Accepts a version number, ‘latest’ or ‘nightly’.
[--skip-content]
Download WP without the default themes and plugins.
[--force]