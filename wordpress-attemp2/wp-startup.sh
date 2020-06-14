# Bash script for checking whether WordPress is installed or not
if ! $(wp core is-installed); then
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --locale=ro_RO --force

    wp config create --dbname=wp --dbuser=root --dbpass=wpdbroot --dbhost=wp-cli-db --locale=ro_RO --force
      WORDPRESS_DB_HOST: wpdb
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: wpdbroot
      WORDPRESS_DB_NAME: wp


    wp core install --url=docker03.dest.internal:8090 --title="hi jon" --admin_user=joncatlin --admin_password=password --admin_email=jonc@destini.com --skip-email --path=/var/www/html --allow-root
    wp core install --url=$url --title=$title --admin_user=$admin-user --admin_password=$admin-password --admin_email=$admin-email --skip-email
fi


sleep 555555555555555