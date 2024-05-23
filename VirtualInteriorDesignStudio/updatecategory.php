<?php
/*
    



*/
require_once 'dbconnect.php'; // Include the config.php file for database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = filter_var($_POST['category_id'], FILTER_SANITIZE_EMAIL);
    $column = filter_var($_POST['column'], FILTER_SANITIZE_STRING);
    $value = filter_var($_POST['value'], FILTER_SANITIZE_STRING);

    try {
        // Prepare the SQL query
        $sql = "UPDATE categories SET $column = ? WHERE category_id = ?";
        $stmt = $conn->prepare($sql);

        // Bind the parameters
        $stmt->bind_param("ss", $value, $id);

        // Execute the query
        $stmt->execute();

        // Check if any rows were affected
        $rowsAffected = $stmt->affected_rows;
        if ($rowsAffected > 0) {
            echo "<script>alert('category data updated successfully!'); window.location.href = 'landingcategory.php';</script>";
        } else {
            echo "<script>alert('No changes were made.'); window.location.href = 'landingcategory.php';</script>";
        }

    } catch(Exception $e) {
        echo "Error updating user data: " . $e->getMessage();
        error_log("Update user data error: " . $e->getMessage() . "\n", 3, "/path/to/error.log");
    }
}
?>