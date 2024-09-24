<?php

include '../../../config/config.php';

// Function to insert default values into the English table for a student if no records exist
function insertDefaultEnglishMarks($conn, $studentId)
{
    $insertQuery = "INSERT INTO physics (id, cat, exam) VALUES ($studentId, 0, 0)";
    mysqli_query($conn, $insertQuery);
}

$studentQuery = "SELECT * FROM students";
$studentResult = mysqli_query($conn, $studentQuery);

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
    foreach ($_POST['cat'] as $studentId => $catMarks) {
        $examMarks = $_POST['exam'][$studentId];

        // Update English marks
        $updateEnglishQuery = "UPDATE physics SET cat = '$catMarks', exam = '$examMarks' WHERE id = $studentId";
        mysqli_query($conn, $updateEnglishQuery);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FUNDAMENTALS OF PROGRAMMING MARKS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #F0F0F0; }
        table { width: 100%; border-collapse: collapse; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
        #submitButton { display: block; margin-top: 20px; padding: 10px 20px; background-color: #2ECC71; color: #fff; border: none; border-radius: 5px; cursor: pointer; }
        #teacherForm { margin-top: 20px; }
        #teacherForm input { margin-right: 10px; }
        #prevPageButton {
            padding: 10px 20px;
            background-color: #1F6391;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #prevPageButton:hover {
            background-color: #0F4377;
        }
    </style>
</head>
<body>
    <div class="sidebar">
    </div>
    <div class="content">
        <h1>physics</h1>
        <form id="teacherForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Cat Marks</th>
                        <th>Exam Marks</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (mysqli_num_rows($studentResult) > 0) {
                        while ($studentRow = mysqli_fetch_assoc($studentResult)) {
                            echo "<tr>";
                            echo "<td>" . $studentRow["id"] . "</td>";
                            echo "<td>" . $studentRow["name"] . "</td>";
                            $EnglishQuery = "SELECT * FROM physics WHERE id = " . $studentRow["id"];
                            $EnglishResult = mysqli_query($conn, $EnglishQuery);
                            $EnglishRow = mysqli_fetch_assoc($EnglishResult);
                            if (!$EnglishRow) {
                                // If no record exists for the student in the English table, insert default values
                                insertDefaultEnglishMarks($conn, $studentRow["id"]);
                                $EnglishRow = array("cat" => 0, "exam" => 0);
                            }
                            echo "<td><input type='number' name='cat[" . $studentRow["id"] . "]' value='" . $EnglishRow["cat"] . "'></td>";
                            echo "<td><input type='number' name='exam[" . $studentRow["id"] . "]' value='" . $EnglishRow["exam"] . "'></td>";
                            echo "</tr>";
                        }
                    }
                    ?>
                </tbody>
            </table>
            <button id="submitButton" type="submit" name="submit">Submit Marks</button>
        </form>
    </div>
    <button id="prevPageButton">Previous Page</button>
</body>
</html>
