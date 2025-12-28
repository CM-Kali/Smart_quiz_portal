<?php
header("Content-Type: application/json");

// Fixed levels
$levels = ["Easy", "Intermediate", "Pro"];
echo json_encode($levels);
?>
