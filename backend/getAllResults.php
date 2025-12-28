<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *"); 

include 'db.php';

$stmt = $conn->prepare("SELECT * FROM results ORDER BY created_at DESC");
$stmt->execute();
$result = $stmt->get_result();

$results = [];
while($row = $result->fetch_assoc()){
    $results[] = $row;
}

echo json_encode($results);
?>
