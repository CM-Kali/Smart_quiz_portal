<?php
header("Content-Type: application/json");
include "db.php";

// Get POST data
$data = json_decode(file_get_contents("php://input"), true);

$username = $data['username'] ?? '';
$subject = $data['subject'] ?? '';
$level = $data['level'] ?? '';
$total_questions = $data['total_questions'] ?? 0;
$correct_answers = $data['correct_answers'] ?? 0;
$score = $data['score'] ?? 0;

if(empty($username) || empty($subject) || empty($level)){
    echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    exit;
}

$stmt = $conn->prepare(
    "INSERT INTO results (username, subject, level, total_questions, correct_answers, score) 
     VALUES (?, ?, ?, ?, ?, ?)"
);
$stmt->bind_param("sssiii", $username, $subject, $level, $total_questions, $correct_answers, $score);
$stmt->execute();

if($stmt->affected_rows > 0){
    echo json_encode(["status" => "success", "message" => "Result saved successfully"]);
}else{
    echo json_encode(["status" => "error", "message" => "Failed to save result"]);
}

$stmt->close();
$conn->close();
?>
