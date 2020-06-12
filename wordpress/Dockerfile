#FROM wordpress:php7.3-apache
FROM wordpress:cli-php7.4

ENV url wp-cli.dest.internal
ENV title test website
ENV admin-user joncatlin
ENV admin-password password
ENV admin-email jonc@destini.com

RUN wp core download
RUN wp core install --url=${url} --title=${title} --admin_user=${admin-user} --admin_password=${admin-password} --admin_email=${admin-email} --skip-email
#
CMD ["sleep", "555555555555555"]


# TODO
# 1. Remove any installation files that are not needed
