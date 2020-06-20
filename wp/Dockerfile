FROM wordpress:5.4.2

# Modify the uid and gid of www-data to be consistent between this container and the one running wordpress. 
# This prevents any permission errors between the two containers as this one tries to modify files in the other one
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

