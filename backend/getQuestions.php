<?php
header("Content-Type: application/json");
include "db.php";

$sql = "SELECT id, question, option1, option2, option3, option4, correct_answer FROM questions";
$result = $conn->query($sql);

$questions = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $questions[] = $row;
    }
}

echo json_encode($questions);
$conn->close();
?>
