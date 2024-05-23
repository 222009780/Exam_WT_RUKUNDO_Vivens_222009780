<?php
session_start();
//<!-----RUKUNDO VIVENS 222009780---->
// Unset all of the session variables
$_SESSION = array();
//rukundo vivens 222009780 on 02th may 2024
// Destroy the session
session_destroy();

// Redirect to index.php
header("Location: index.html");
exit();
?>
