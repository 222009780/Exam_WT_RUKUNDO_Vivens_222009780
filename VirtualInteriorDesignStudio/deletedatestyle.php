<?php
require_once "dbconnect.php";
//<!-----RUKUNDO VIVENS 222009780---->

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['style_id'])) {
    try {
        // Sanitize the input
        $style_id = $conn->real_escape_string($_POST['style_id']);

        // Delete query
        $sql = "DELETE FROM styles WHERE style_id='$style_id'";

        // Execute the query
        if ($conn->query($sql) === TRUE) {
            // Redirect to landing page after successful deletion
            header("Location: landingstyle.php");
            exit(); // Terminate script execution after redirection
        } else {
            // If deletion fails, show an error message
            throw new Exception("Error deleting record: " . $conn->error);
        }
    } catch (Exception $e) {
        // Handle exceptions
        echo "Error: " . $e->getMessage();
        error_log("Delete style data error: " . $e->getMessage() . "\n", 3, "/path/to/error.log");
    }

    // Close the database connection
    $conn->close();
} else {
    // If the form is not submitted via POST method or style_id is not set, redirect or show an error message
    echo "Invalid request.";
}
?>
