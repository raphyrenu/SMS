<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sms";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get JSON data from POST request
$data = json_decode(file_get_contents("php://input"), true);

// Iterate through each data item
foreach ($data as $item) {
    $studentId = $conn->real_escape_string($item['studentId']); // Sanitize input
    $CAT = intval($item['CAT']); // Convert CAT to integer
    $EXAM = intval($item['EXAM']); // Convert EXAM to integer

    // Prepare SQL statement with a prepared statement
    $sql = "UPDATE physics_marks_year1a SET CAT=?, EXAM=? WHERE student_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iii", $CAT, $EXAM, $studentId);

    // Execute SQL statement
    if (!$stmt->execute()) {
        echo "Error updating record: " . $conn->error;
    }
}

// Close connection
$conn->close();

echo "Marks updated successfully";
?>