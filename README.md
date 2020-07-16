# Wordpress Multisite & CLI in Docker

This project deploys wordpress and a database for it to use, then configures WP and installs various themese and plugins. The project shows how wordpress CLI can be used to automatically tailor the configuration on startup.

## Goals
1.  Create a mechanism to build and configure wordpress so that it is easy to deploy without the use of a browser to configure it. 
1.  Automatically install wordpress multisite, along with any themes and plugins
1.  Automatically create various sites and users

## Flow
When the containers are deployed the following things happen
1.  The database container creates the DB files in the bind mount volume so all data is persisted outside of the DB
1.  The wordpress container starts and copies the wordpress files to the bind mounted volume, so WP is persisted outside of the container
1.  The wp-cli-multisite container starts. This is a transient container and stops after it has served its purpose.
1.  The wp-cli-multisite container waits for the WP container to have started and copied the wordpress files, so it is ready for configuring.
1.  The wp-cli-multisite container then installs WP multisite along with various themese and plugins, after which the container dies.

## Things to be aware of
1.  With the base WP containers from Docker Hub the www-data user had a different UID and GID. This prevented the cli container from being able to manipulate the wordpress installation created by the other container. To solve this the solution changes the UID and GID in both containers to common values.
1.  There is a limit to what wp-cli can do. It does not seem to be able to configure plugins and hence some plugin setup has to be finished by using the browser and the plugin UI to complete.
## TODO
1.  Determine how to install wordpress cli into the same container as wordpress. This is needed if we want to create a wordpress plugin that can create a new wp site, activate all the plugins, activate all of the themes and configure everything.
1.  Create a WP plugin that uses WPCLI to create a new wp site, activate all the plugins, activate all of the themes and configure everything.
1.  Register the new plugin on the main site so that an admin can login to the main site and use it to create all the other sites.
1.  Investigate if WP CLI is needed or if there is an API tht can be used to create sites, activate plugins etc. 
