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
    $studentId = $item['studentId'];
    $marks = $item['marks'];
    $sql = "UPDATE physics_marks_year1a SET marks='$marks' WHERE student_id='$studentId'";

    if (!$conn->query($sql) === TRUE) {
        echo "Error updating record: " . $conn->error;
    }
}

$conn->close();
echo "Marks updated successfully";
?>