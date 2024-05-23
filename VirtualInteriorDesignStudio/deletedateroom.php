<?php
require_once "dbconnect.php";
//<!-----RUKUNDO VIVENS 222009780---->

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['room_id'])) {
    try {
        // Sanitize the input
        $room_id = $conn->real_escape_string($_POST['room_id']);

        // Delete query
        $sql = "DELETE FROM rooms WHERE room_id='$room_id'";

        // Execute the query
        if ($conn->query($sql) === TRUE) {
            // Redirect to landing page after successful deletion
            header("Location: landingroom.php");
            exit(); // Terminate script execution after redirection
        } else {
            // If deletion fails, show an error message
            throw new Exception("Error deleting record: " . $conn->error);
        }
    } catch (Exception $e) {
        // Handle exceptions
        echo "Error: " . $e->getMessage();
        error_log("Delete room data error: " . $e->getMessage() . "\n", 3, "/path/to/error.log");
    }

    // Close the database connection
    $conn->close();
} else {
    // If the form is not submitted via POST method or room_id is not set, redirect or show an error message
    echo "Invalid request.";
}
?>
