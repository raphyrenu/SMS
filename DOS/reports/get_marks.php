<?php
// Include database connection code
include "../../config/config.php";

// Fetch marks from the database
$sql = "SELECT * FROM marks ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $marks = array(
        "studentId" => $row["student_id"],
        "catMarks" => $row["cat_marks"],
        "examMarks" => $row["exam_marks"]
    );

    header('Content-Type: application/json');
    echo json_encode($marks);
} else {
    echo "No marks found!";
}

$conn->close();
