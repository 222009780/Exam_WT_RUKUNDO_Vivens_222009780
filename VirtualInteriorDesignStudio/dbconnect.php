<?php
// <!-----RUKUNDO VIVENS 222009780---->
$servername = "localhost";
$username = "RUKUNDO";
$password = "222009780";
$dbname = "virtual_interior_design_studio";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
