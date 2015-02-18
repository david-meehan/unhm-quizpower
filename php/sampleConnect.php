<?php

/*
 * Gets connection to the database with given credentials. 
 * @return $connection resource OR terminates execution if connection fails.
 */
function connect() {
	$host = '';
	$username = '';
	$password = '';
	$database = '';
	
	$connection = new mysqli($host, $username, $password, $database);
	if(mysqli_connect_errno()) {
		exit();
	}
	return $connection;
}

?>