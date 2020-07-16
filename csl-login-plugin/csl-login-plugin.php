<?php
/**
 * Plugin Name:       CSL Login Plugin
 * Description:       Handle the basics with this plugin.
 * Version:           0.1.0
 * Requires at least: 5.2
 * Requires PHP:      7.2
 * Author:            Jon Catlin
 * Author URI:        https://www.destini.com/
 * Text Domain:       csl-login-plugin
 * Domain Path:       /languages
 */



/*
Sample code from various places that will be needed for the solution

// Create a new user so that it can be passed back as part of the authentication hooks
// See code at https://developer.wordpress.org/reference/classes/wp_user/
$user = new WP_User( $id [, $name [, $blog_id ] ] );

// Adda role to a users meta data
WP_User::add_role( string $role )

// Hook to intercept the login screen and do things like create a user
function my_authenticate($user, $username, $password){
    // $user here will be null
    return $user;
}
add_filter('authenticate', 'my_authenticate', 10, 3);

// The  authenticate filter passes three arguments – user object, username and password. 
// If you hook to this filter with priority smaller than 20, the user object will be set to null.

// Example of including files to keep the main php file as clean as possible
require_once plugin_dir_path(__FILE__) . 'includes/mfp-functions.php';


*/
$csl_pluginlog = plugin_dir_path(__FILE__).'debug.log';
$message = 'In the main plugin file'.PHP_EOL;
error_log($message, 3, $csl_pluginlog);


// Example of including files to keep the main php file as clean as possible
require_once plugin_dir_path(__FILE__) . 'includes/csl-login-functions.php';



?>