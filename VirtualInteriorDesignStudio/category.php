<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $category_name = $_POST['category_name'];
    $category_description = $_POST['category_description'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO categories (category_name,category_description) VALUES (?, ?)");
    $stmt->bind_param("ss", $category_name,$category_description);

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
