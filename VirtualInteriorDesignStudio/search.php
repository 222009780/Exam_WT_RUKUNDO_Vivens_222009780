<?php
require_once "dbconnect.php";

if (isset($_GET['query'])) {
    $searchTerm = $conn->real_escape_string($_GET['query']);
    $output = "";
//<!-----RUKUNDO VIVENS 222009780---->
    $queries = [
        'styles' => "SELECT style_id, style_name, style_description,created_at, updated_at FROM styles WHERE style_id LIKE '%$searchTerm%'",
        ' rooms' => "SELECT room_id,design_id,color_id,room_name,room_dimensions,room_description  FROM  rooms WHERE  room_id LIKE '%$searchTerm%'",
        'users' => "SELECT user_id ,username, email, password FROM users WHERE user_id LIKE '%$searchTerm%'",
        'categories' => "SELECT category_id, category_name, category_description FROM categories WHERE category_id LIKE '%$searchTerm%'",
        'colors' => "SELECT color_id,color_name, color_hex_code FROM colors WHERE color_id LIKE '%$searchTerm%'",
        'designs' => "SELECT design_id, user_id, style_id, design_name, description FROM designs WHERE design_id LIKE '%$searchTerm%'",
        'payments' => "SELECT payment_id, order_id, payment_method, payment_date, payment_amount,payment_status FROM payments WHERE payment_id LIKE '%$searchTerm%'",
        'furniture' => "SELECT furniture_id, design_id, room_id,category_id ,furniture_name,furniture_dimensions,furniture_description  FROM furniture WHERE furniture_id LIKE '%$searchTerm%'",
        'moodboards' => "SELECT moodboard_id,design_id, moodboard_name, moodboard_description,  moodboard_image_url FROM moodboards WHERE moodboard_id LIKE '%$searchTerm%'",
        'profile' => "SELECT profile_id, user_id, full_name, bio, profile_picture_url,social_media_links,website_url FROM profile WHERE profile_id LIKE '%$searchTerm%'",
        'contactus' => "SELECT message_id, user_id, name,email, subject, message FROM contactus WHERE message_id LIKE '%$searchTerm%'",
        'orders' => "SELECT order_id,user_id,design_id,order_date,total_price,payment_status,delivery_address  FROM orders WHERE order_id LIKE '%$searchTerm%'"
    ];

    $output .= "<h2><u>Search Results:</u></h2>";

    foreach ($queries as $table => $sql) {
        $result = $conn->query($sql);
        $output .= "<h3>Table of $table:</h3>";
        
        if ($result) {
            if ($result->num_rows > 0) {
                $output .= "<table border='1'>";
                // Output table header
                $output .= "<tr>";
                $row = $result->fetch_assoc(); // Fetch first row to get column names
                foreach ($row as $key => $value) {
                    $output .= "<th>$key</th>";
                }
                $output .= "</tr>";
                
                // Output table data
                do {
                    $output .= "<tr>";
                    foreach ($row as $value) {
                        $output .= "<td>$value</td>";
                    }
                    $output .= "</tr>";
                } while ($row = $result->fetch_assoc());
                
                $output .= "</table>";
            } else {
                $output .= "<p>No results found in $table matching the search term: '$searchTerm'</p>";
            }
        } else {
            $output .= "<p>Error executing query: " . $conn->error . "</p>";
        }
    }

    echo $output;

    $conn->close();
} else {
    echo "<p>No search term was provided.</p>";
}
?>
