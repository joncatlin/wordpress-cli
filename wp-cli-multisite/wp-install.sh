#!/bin/bash
# Bash script for installing wordpress, configuring it and installing any themes and plugins needed

# Check to see if wordpress is installed. Look for the index.php file in /var/www/html
if ! $(wp core is-installed); then

    printf "WORDPRESS is not installed. Installing now!\n"
    # wp core install  --path=/var/www/html --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email
    wp core multisite-install  --path=/var/www/html --url=$URL --subdomains --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email
    wp core version --extra

    printf "\n\nInstalling Elementor and Elementor Pro.\n"
    wp plugin install /var/www/plugins/elementor.2.9.12.zip --activate
    wp plugin install /var/www/plugins/elementor-pro-2.10.2.zip --activate
    wp plugin install /var/www/plugins/wp-analytify.3.0.0.zip --activate

    printf "\n\nDeactivating and deleting plugins that are shipped with WP but are not needed.\n"
    wp plugin deactivate hello
    wp plugin delete hello
    wp plugin deactivate akismet
    wp plugin delete akismet

    printf "\n\nInstalling themes and actgivating the base theme.\n"
    wp theme install /var/www/themes/hello-elementor.2.3.0.zip --activate
    wp theme install /var/www/themes/layers-elementor-1-0-3.zip

    printf "\n\nRemoving unwanted themes that are shipped with wordpress.\n"
    wp theme delete twentynineteen
    wp theme delete twentyseventeen
    wp theme delete twentytwenty

    printf "\n\nThe following themese are installed:\n"
    wp theme list

    printf "\nUpdating .htaccess for multisite installation.\n"
    cp ../.htaccess ./

    printf "\n\nCreating the various sites for clients.\n"
    wp site create --slug=client_a --title="Client A MAI Site"
    wp site create --slug=client_b --title="Client B MAI Site"
    wp site create --slug=client_c --title="Client C MAI Site"

    printf "\n\nThe following sites were created.\n"
    wp site list

    printf "\n\nCreating users for the sites.\n"
    wp user create aadmin client_a_admin@concordservicing.com --role=administrator --user_pass=password --display_name=client_a_admin --url=http://client_a.wpms.test
    wp user create badmin client_b_admin@concordservicing.com --role=administrator --user_pass=password --display_name=client_b_admin --url=http://client_b.wpms.test
#    wp user create cadmin client_c_admin@concordservicing.com --role=administrator --user_password=password --display_name=client_c_admin

    printf "\n\nThe following users were created.\n"
    wp user list

    printf "\n\nActivating themes for sites.\n"
    wp theme activate layers-elementor --url=http://client_a.wpms.test
    wp theme activate hello-elementor --url=http://client_b.wpms.test
    wp theme activate layers-elementor --url=http://client_c.wpms.test




fi

printf "\n\nSleeping for a 120s before stopping and exiting the container"
sleep 120