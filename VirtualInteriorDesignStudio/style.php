<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $style_name = $_POST['style_name'];
    $style_description = $_POST['style_description'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO styles (style_name,style_description) VALUES (?, ?)");
    $stmt->bind_param("ss", $style_name,$style_description);

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
