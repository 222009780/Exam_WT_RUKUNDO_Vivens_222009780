<!DOCTYPE html>
<html lang="en">
<head>
    <!-----RUKUNDO VIVENS 222009780---->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stidio furniture</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
     <link rel="stylesheet" href="css/style5.css">
</head>
<header>
  
    <div>
            <button type="button" onclick="window.location.href='furnitures.html'">Back</button>
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
    <title>furniture Management</title>
    <!-- Include any necessary CSS files -->
</head>
<body>
    <!-- Display the table -->
    <br><br><br>
    <table id="dataTable" class="table table-hover text-center">
        <tr>
            <th>ID</th>
            <th>design_id</th>
            <th>room_id</th>
            <th>categort_id</th>
            <th>furniture_name</th>
            <th>furniture_dimensions</th>
            <th>furniture_description</th>
            <th>Actions</th>
        </tr>
        <?php
        // Fetch data from the customers table
        $sql = "SELECT * FROM furniture";
        $result = $conn->query($sql);

        // Output data of each row
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["furniture_id"] . "</td>"; // furniture_id
                echo "<td>" . $row["design_id"] . "</td>"; // design_id
                echo "<td>" . $row["room_id"] . "</td>"; // room_id
                 echo "<td>" . $row["category_id"] . "</td>"; // category_id
                echo "<td>" . $row["furniture_name"] . "</td>"; // furniture_name
                echo "<td>" . $row["furniture_dimensions"] . "</td>"; // furniture_dimensions
                echo "<td>" . $row["furniture_description"] . "</td>";//furniture_description
                echo "<td>";
                // Edit and delete actions
                echo "<a href='updatefurniture.html?id=" . $row["furniture_id"] . "'><i class='fas fa-edit'></i></a>";
                echo "<a href='deletefurniture.html?id=" . $row["furniture_id"] . "'><i class='fas fa-trash'></i></a>";
            
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
