#!/bin/bash
# Bash script for installing wordpress, configuring it and installing any themes and plugins needed

# Check to see if wordpress is installed. Look for the index.php file in /var/www/html
if ! $(wp core is-installed); then

    printf "WORDPRESS is not installed. Installing now!"
    wp core install  --path=/var/www/html --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email

    printf "\n\nInstalling Elementor and Elementor Pro."
    wp plugin install /var/www/plugins/elementor.2.9.12.zip --activate
    wp plugin install /var/www/plugins/elementor-pro-2.10.2.zip --activate
    wp plugin install /var/www/plugins/wp-analytify.3.0.0.zip --activate

    printf "\n\nDeactivating and deleting plugins that are shipped with WP but are not needed."
    wp plugin deactivate hello
    wp plugin delete hello
    wp plugin deactivate akismet
    wp plugin delete akismet

    printf "\n\nInstalling themes and actgivating the base theme."
    wp theme install /var/www/themes/hello-elementor.2.3.0.zip --activate
    wp theme install /var/www/themes/layers-elementor-1-0-3.zip

    printf "\n\nRemoving unwanted themes that are shipped with worpress."
    wp theme delete twentynineteen
    wp theme delete twentyseventeen
    wp theme delete twentytwenty

fi

printf "\n\nSleeping for a 120s before stopping and exiting the container"
sleep 120