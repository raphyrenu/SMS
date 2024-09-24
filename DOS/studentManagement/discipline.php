<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Year 1A Student Data</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #F0F0F0; }
        .sidebar { background-color: #2ECC71; color: #fff; padding: 20px; width: 200px; position: fixed; height: 100%; }
        .content { margin-left: 220px; padding: 20px; }
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
        <h1>Year 1A Student Data</h1>
       
        <form id="teacherForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Cat Marks</th>
                        <th>Exam Marks</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                   
                    include('db.php');
                    $studentQuery = "SELECT * FROM student";
                    $studentResult = mysqli_query($conn, $studentQuery);

                    if (mysqli_num_rows($studentResult) > 0) {
                        while ($studentRow = mysqli_fetch_assoc($studentResult)) {
                            echo "<tr>";
                            echo "<td>" . $studentRow["stud_id"] . "</td>";
                            echo "<td>" . $studentRow["studentName"] . "</td>";

                            $physicsQuery = "SELECT * FROM discipline WHERE stud_id = " . $studentRow["stud_id"];
                            $physicsResult = mysqli_query($conn, $physicsQuery);
                            $physicsRow = mysqli_fetch_assoc($physicsResult);

                            
                            if (!$physicsRow) {
                                $insertQuery = "INSERT INTO discipline (stud_id, cat_marks) VALUES (" . $studentRow["stud_id"] . ", 0)";
                                mysqli_query($conn, $insertQuery);
                                $physicsRow = array("cat" => "");
                            }

                            
                            $disciplineQuery = "SELECT * FROM discipline WHERE stud_id = " . $studentRow["stud_id"];
                            $disciplineResult = mysqli_query($conn, $disciplineQuery);
                            $disciplineRow = mysqli_fetch_assoc($disciplineResult);

                            echo "<td><input type='number' name='cat_marks[" . $studentRow["stud_id"] . "]' value='" . $physicsRow["cat_marks"] . "'></td>";
                            echo "<td><input type='number' name='exam_marks[" . $studentRow["stud_id"] . "]' value='" . $physicsRow["exam"] . "'></td>";
                            echo "<td><button type='submit' name='action[" . $studentRow["stud_id"] . "]' value='submit'>Submit Marks</button></td>"; // Button to submit marks
                            echo "</tr>";
                        }
                    }
                    
                   
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                        foreach ($_POST['action'] as $studentId => $action) {
                            $catMarks = $_POST['cat_marks'][$studentId];
                            $examMarks = $_POST['exam_marks'][$studentId];
                    
                         
                            $updatePhysicsQuery = "UPDATE discipline SET cat_marks = '$catMarks',exam='$examMarks' WHERE stud_id = $studentId";
                            mysqli_query($conn, $updatePhysicsQuery);
                    
                        }
                    }
                    ?>
                </tbody>
            </table>
        </form>
    </div>
    <button id="prevPageButton">Previous Page</button>
</body>
</html>
