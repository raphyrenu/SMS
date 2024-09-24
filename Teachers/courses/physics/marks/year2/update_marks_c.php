<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sms";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$data = json_decode(file_get_contents("php://input"), true);

foreach ($data as $item) {
    $studentId = $conn->real_escape_string($item['studentId']); // Sanitize input
    $marks = intval($item['marks']); // Convert marks to integer

    if ($marks < 0 || $marks > 100) {
        echo "Marks for student ID $studentId are invalid. Please enter a number between 0 and 100.";
        $conn->close();
        exit();
    }

    // Prepare SQL statement with a prepared statement
    $sql = "UPDATE physics_marks_year1a SET marks=? WHERE student_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $marks, $studentId);

    if (!$stmt->execute()) {
        echo "Error updating record: " . $conn->error;
    }
}

$conn->close();
echo "Marks updated successfully";
?>
