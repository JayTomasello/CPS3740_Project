<?php

# Defines the details of the target database
$host = "localhost";
$username = "tomaselj";
$password = "1168753";
$dbname = "CPS3740";

# Makes the connection with the target database
$con = mysqli_connect($host, $username, $password, $dbname) 
    or die("<br>Cannot connect to DB:$dbname on $host\n");

?>
