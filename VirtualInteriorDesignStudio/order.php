<?php
// Database connection parameters
// Include database connection file
require_once "dbconnect.php";=  
//<!-----RUKUNDO VIVENS 222009780---->
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $user_id = $_POST["user_id"]; 
    $design_id = $_POST["design_id"];
    $order_date = $_POST["order_date"]; 
    $total_price = $_POST["total_price"];
    $payment_status = $_POST["payment_status"];
    $delivery_address = $_POST["delivery_address"];

    // Prepare and bind parameters
    $sql = "INSERT INTO orders (user_id,design_id, order_date, payment_status, total_price,delivery_address) VALUES (?, ?, ?, ?,?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $user_id,$design_id, $order_date, $total_price,$payment_status,$delivery_address);

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
