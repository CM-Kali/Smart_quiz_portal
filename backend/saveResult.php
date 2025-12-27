<?php
include "db.php";

$username = $_POST['username'] ?? '';
$score = $_POST['score'] ?? 0;

if (!empty($username)) {
    $stmt = $conn->prepare("INSERT INTO results (username, score) VALUES (?, ?)");
    $stmt->bind_param("si", $username, $score);
    $stmt->execute();
    $stmt->close();

    echo "Result saved successfully";
} else {
    echo "Invalid data";
}

$conn->close();
?>
