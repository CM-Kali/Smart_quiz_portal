<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *"); 

include 'db.php'; // make sure path is correct

$username = isset($_GET['username']) ? $_GET['username'] : '';
$subject  = isset($_GET['subject']) ? $_GET['subject'] : '';
$level    = isset($_GET['level']) ? $_GET['level'] : '';

if(!$username || !$subject || !$level){
    echo json_encode([]);
    exit;
}

$stmt = $conn->prepare("SELECT * FROM results WHERE username=? AND subject=? AND level=? ORDER BY created_at ASC");
$stmt->bind_param("sss", $username, $subject, $level);
$stmt->execute();
$result = $stmt->get_result();

$results = [];
while($row = $result->fetch_assoc()){
    $results[] = $row;
}

echo json_encode($results);
?>
