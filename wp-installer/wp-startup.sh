#!/bin/bash
# Bash script for installing wordpress, configuring it and then running it

# Check to see if wordpress is installed. Look for the index.php file in /var/www/html
if ! $(wp core is-installed); then

#if [[ ! -f /var/www/html/index.php ]]; then

    echo "WORDPRESS is not installed. Installing now!"

    # Download the specific version of wprdpress
    # TODO make the version number an env variable
#    wp core download --path=/var/www/html --locale=en_US --version=4.5.2

    # This replaces the wp core download as it cannot download from a file. It needs a url
    # Extract the files from the tar ball into the correct location and then tidy up
    tar -xf /usr/local/bin/wordpress-5.4.2.tar.gz -C /var/www/html
    mv wordpress/* .
    rmdir wordpress

    # Create the wordpress from the config file
    wp config create  --path=/var/www/html --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --locale=en_US --force

    wp core install  --path=/var/www/html --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email

fi