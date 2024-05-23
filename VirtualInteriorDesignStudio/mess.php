<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "dbconnect.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_POST['user_id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];

    // Prepare and bind the SQL statement
    $sql = "INSERT INTO contactus (user_id,name, email, subject, message) VALUES (?,?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $user_id,$name, $email, $subject, $message);

    // Execute the statement
    if ($stmt->execute()) {
        // Success message
        $response = "<p style='color: green;'>Thank you for your response.</p>";
    } else {
        // Error message
        $response = "<p style='color: red;'>Error adding record: " . $stmt->error . "</p>";
    }

    // Output the response
    echo $response;
    exit; // Stop further execution
}
?>