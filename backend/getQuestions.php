<?php
header("Content-Type: application/json");
include "db.php";

$subject = $_GET['subject'] ?? '';
$level = $_GET['level'] ?? '';

if (empty($subject) || empty($level)) {
    echo json_encode([]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT id, question, option1, option2, option3, option4, correct_answer
     FROM questions
     WHERE subject = ? AND level = ?
     ORDER BY RAND()
     LIMIT 10"
);

$stmt->bind_param("ss", $subject, $level);
$stmt->execute();

$result = $stmt->get_result();
$questions = [];

while ($row = $result->fetch_assoc()) {
    $questions[] = $row;
}

echo json_encode($questions);

$stmt->close();
$conn->close();
?>
