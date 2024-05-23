<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";
//<!-----RUKUNDO VIVENS 222009780---->
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $order_id = $_POST["order_id"]; 
    $payment_method = $_POST["payment_method"]; 
    $payment_date = $_POST["payment_date"];
    $payment_amount = $_POST["payment_amount"];
    $payment_status = $_POST["payment_status"];

    // Prepare and bind parameters
    $sql = "INSERT INTO payments (order_id, payment_method, payment_amount, payment_date,payment_status) VALUES (?, ?, ?, ?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $order_id, $payment_method, $payment_amount, $payment_date,$payment_status);

    // Execute SQL statement
    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

// Close connection
$conn->close();
?>
