<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include 'db.php';

// Get raw POST data
$data = json_decode(file_get_contents("php://input"), true);

if(!$data || !isset($data['username'],$data['subject'],$data['level'],$data['total_questions'],$data['correct_answers'],$data['score'])){
    echo json_encode(['status'=>'error','message'=>'Invalid data']);
    exit;
}

$username = $data['username'];
$subject  = $data['subject'];
$level    = $data['level'];
$total_questions = (int)$data['total_questions'];
$correct_answers = (int)$data['correct_answers'];
$score = (int)$data['score'];

$stmt = $conn->prepare("INSERT INTO results (username, subject, level, total_questions, correct_answers, score) VALUES (?,?,?,?,?,?)");
$stmt->bind_param("sssiii", $username, $subject, $level, $total_questions, $correct_answers, $score);

if($stmt->execute()){
    echo json_encode(['status'=>'success','message'=>'Result saved']);
}else{
    echo json_encode(['status'=>'error','message'=>'Database error: '.$stmt->error]);
}
?>
