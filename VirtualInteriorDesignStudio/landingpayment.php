<!DOCTYPE html>
<html lang="en">
<head>
    <!-----RUKUNDO VIVENS 222009780---->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stidio payment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
     <link rel="stylesheet" href="css/style5.css">
</head>
<header>
  
    <div>
            <button type="button" onclick="window.location.href='payment.html'">Back</button>
    </div> 
</header>

<?php
require_once "dbconnect.php";

// Display any alert messages
if(isset($_GET['msg'])){
    $msg = $_GET['msg'];
    echo '<div class="alert alert-warning alert-dismissible fade show" role="alert">' . $msg . '
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payment Management</title>
    <!-- Include any necessary CSS files -->
</head>
<body>
    <!-- Display the table -->
    <br><br><br>
    <table id="dataTable" class="table table-hover text-center">
        <tr>
            <th>ID</th>
            <th>order_id</th>
            <th>payment_method</th>
            <th>payment_date</th>
            <th>payment_amount</th>
            <th>payment_status</th>
            <th>Actions</th>
        </tr>
        <?php
        // Fetch data from the customers table
        $sql = "SELECT * FROM payments";
        $result = $conn->query($sql);

        // Output data of each row
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["payment_id"] . "</td>"; // payment_id
                echo "<td>" . $row["order_id"] . "</td>"; // order_id
                echo "<td>" . $row["payment_method"] . "</td>"; // payment_method
                echo "<td>" . $row["payment_date"] . "</td>"; // payment_date
                echo "<td>" . $row["payment_amount"] . "</td>"; // payment_amount
                echo "<td>" . $row["payment_status"] . "</td>";//payment_status
                echo "<td>";
                // Edit and delete actions
                echo "<a href='updatepayment.html?id=" . $row["payment_id"] . "'><i class='fas fa-edit'></i></a>";
                echo "<a href='deletepayment.html?id=" . $row["payment_id"] . "'><i class='fas fa-trash'></i></a>";
            
                echo "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='6'>No data found</td></tr>";
        }

        $conn->close();
        ?>
    </table>
    <!-- Include any necessary JavaScript files -->
</body>
</html>
