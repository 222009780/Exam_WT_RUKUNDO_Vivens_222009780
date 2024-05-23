<?php
session_start();
//<!-----RUKUNDO VIVENS 222009780---->
// Include database connection file
require_once "dbconnect.php";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"]; // Note: You should hash passwords for security
    

    // Validate form data (you may add more validation as needed)
    if (empty($username) || empty($email) ||  empty($password)) {
        // Handle validation errors
        echo "All fields are required.";
    } else {
        // Prepare SQL statement to insert data into the user table
        $sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

        // Prepare the SQL statement
        $stmt = $conn->prepare($sql);

        if ($stmt) {
            // Bind parameters to the statement
            $stmt->bind_param("sss", $username, $email, $password);

            // Execute the statement
            if ($stmt->execute()) {
                // Data inserted successfully
                echo "User registered successfully.";
                header("Location: login.html");
                exit();
            } else {
                // Handle execution error
                echo "Error: " . $conn->error;
            }

            // Close statement
            $stmt->close();
        } else {
            // Handle statement preparation error
            echo "Error preparing statement: " . $conn->error;
        }
    }
}

// Close database connection
$conn->close();
?>
