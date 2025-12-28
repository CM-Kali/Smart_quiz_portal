<?php
header("Content-Type: application/json");
include "db.php";

$sql = "SELECT * FROM results ORDER BY created_at DESC";
$result = $conn->query($sql);

$results = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        $results[] = $row;
    }
}

echo json_encode($results);

$conn->close();
?>
