<?php
$servername = "localhost";
$username = "RUKUNDO";
$password = "222009780";
$dbname = "VirtualInteriorDesignStudio";
//RUKUNDO Vivens_222009780_15_April_2024
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
