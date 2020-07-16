<?php
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

*/
$message = 'In the functions plugin file executing at 10'.PHP_EOL;
error_log($message, 3, $csl_pluginlog);

// Hook to intercept the login screen and do things like create a user
function csl_login_authenticate($user, $username, $password){

    $message = 'In csl_login_authenticate 10'.PHP_EOL;
    error_log($message, 3, $csl_pluginlog);
    
    // $user here will be null
    return $user;
}
add_filter('authenticate', 'csl_login_authenticate', 10, 3);


add_action ('wp_uthenticate', 'csl_authenticate');

function csl_authenticate ($username) {
    $message = 'In csl_authenticate'.PHP_EOL;
    error_log($message, 3, $csl_pluginlog);
    
    // $user here will be null
//    return $user;

}


/*
function html_form_code() {
	echo '<form action="' . esc_url( $_SERVER['REQUEST_URI'] ) . '" method="post">';
	echo '<p>';
	echo 'Your Name (required) <br/>';
	echo '<input type="text" name="cf-name" pattern="[a-zA-Z0-9 ]+" value="' . ( isset( $_POST["cf-name"] ) ? esc_attr( $_POST["cf-name"] ) : '' ) . '" size="40" />';
	echo '</p>';
	echo '<p>';
	echo 'Your Email (required) <br/>';
	echo '<input type="email" name="cf-email" value="' . ( isset( $_POST["cf-email"] ) ? esc_attr( $_POST["cf-email"] ) : '' ) . '" size="40" />';
	echo '</p>';
	echo '<p>';
	echo 'Subject (required) <br/>';
	echo '<input type="text" name="cf-subject" pattern="[a-zA-Z ]+" value="' . ( isset( $_POST["cf-subject"] ) ? esc_attr( $_POST["cf-subject"] ) : '' ) . '" size="40" />';
	echo '</p>';
	echo '<p>';
	echo 'Your Message (required) <br/>';
	echo '<textarea rows="10" cols="35" name="cf-message">' . ( isset( $_POST["cf-message"] ) ? esc_attr( $_POST["cf-message"] ) : '' ) . '</textarea>';
	echo '</p>';
	echo '<p><input type="submit" name="cf-submitted" value="Send"></p>';
	echo '</form>';
}

function deliver_mail() {

	// if the submit button is clicked, send the email
	if ( isset( $_POST['cf-submitted'] ) ) {

		// sanitize form values
		$name    = sanitize_text_field( $_POST["cf-name"] );
		$email   = sanitize_email( $_POST["cf-email"] );
		$subject = sanitize_text_field( $_POST["cf-subject"] );
		$message = esc_textarea( $_POST["cf-message"] );

		// get the blog administrator's email address
		$to = get_option( 'admin_email' );

		$headers = "From: $name <$email>" . "\r\n";

		// If email has been process for sending, display a success message
		if ( wp_mail( $to, $subject, $message, $headers ) ) {
			echo '<div>';
			echo '<p>Thanks for contacting me, expect a response soon.</p>';
			echo '</div>';
		} else {
			echo 'An unexpected error occurred';
		}
	}
}

function csl_shortcode() {
	ob_start();
	deliver_mail();
	html_form_code();

	return ob_get_clean();
}

add_shortcode( 'csl_login_form', 'csl_shortcode' );
*/
?>