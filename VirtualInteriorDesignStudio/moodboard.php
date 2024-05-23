<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $design_id = $_POST['design_id'];
    $moodboard_name = $_POST['moodboard_name'];
    $moodboard_description = $_POST['moodboard_description'];
    $moodboard_image_url = $_POST['moodboard_image_url'];

    // Prepare and bind parameters
    $stmt = $conn->prepare("INSERT INTO moodboards (design_id, moodboard_name, moodboard_image_url,moodboard_description) VALUES (?, ?, ?,?)");
    $stmt->bind_param("ssss",$design_id, $moodboard_name, $moodboard_image_url,$moodboard_description);

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
