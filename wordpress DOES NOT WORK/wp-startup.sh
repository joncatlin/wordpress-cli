# Bash script for checking whether WordPress is installed or not
if ! $(wp core is-installed); then
    wp config create --dbname=wp --dbuser=root --dbpass=wpdbroot --locale=ro_RO --force
    wp core install --url=$url --title=$title --admin_user=$admin-user --admin_password=$admin-password --admin_email=$admin-email --skip-email
fi


sleep 555555555555555