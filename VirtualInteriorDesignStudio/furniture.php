<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $design_id = $_POST['design_id'];
    $room_id = $_POST['room_id'];
    $category_id = $_POST['category_id'];
    $furniture_name = $_POST['furniture_name'];
    $furniture_dimensions = $_POST['furniture_dimensions'];
    $furniture_description = $_POST['furniture_description'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO furniture (design_id, room_id,category_id, furniture_name, furniture_dimensions,furniture_description) VALUES (?, ?, ?, ?,?,?)");
    $stmt->bind_param("ssssss",$design_id, $room_id,$category_id, $furniture_name, $furniture_dimensions,$furniture_description);

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
