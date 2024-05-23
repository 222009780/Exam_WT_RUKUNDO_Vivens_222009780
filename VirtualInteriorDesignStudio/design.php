<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $user_id = $_POST['user_id'];
    $style_id = $_POST['style_id'];
    $design_name = $_POST['design_name'];
    $description = $_POST['description'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO designs (user_id, style_id, design_name,description) VALUES (?, ?, ?,?)");
    $stmt->bind_param("ssss",$user_id, $style_id, $design_name,$description);

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
