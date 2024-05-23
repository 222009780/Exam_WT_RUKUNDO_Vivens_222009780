<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $color_name = $_POST['color_name'];
    $color_hex_code = $_POST['color_hex_code'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO colors (color_name,color_hex_code) VALUES (?, ?)");
    $stmt->bind_param("ss", $color_name,$color_hex_code);

    // Execute the statement
    if ($stmt->execute() === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
