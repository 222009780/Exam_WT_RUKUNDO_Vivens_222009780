<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $design_id = $_POST['design_id'];
    $color_id = $_POST['color_id'];
    $room_name = $_POST['room_name'];
    $room_dimensions = $_POST['room_dimensions'];
    $room_description = $_POST['room_description'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO rooms (design_id, color_id, room_name, room_dimensions,room_description) VALUES (?, ?, ?, ?,?)");
    $stmt->bind_param("sssss",$design_id, $color_id, $room_name, $room_dimensions,$room_description);

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
