<?php
header("Content-Type: application/json");
include "db.php";

$sql = "SELECT DISTINCT subject FROM questions";
$result = $conn->query($sql);

$subjects = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $subjects[] = $row['subject'];
    }
}

echo json_encode($subjects);

$conn->close();
?>
