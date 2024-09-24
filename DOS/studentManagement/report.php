<?php
include '../../config/config.php'; // Assuming this includes your database connection

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    // Query to retrieve student details and marks for all subjects
    $result = mysqli_query($conn,"
    SELECT students.id, 
    students.name,
    mathematics_marks_year1a.CAT AS math_cat, 
    mathematics_marks_year1a.EXAM AS math_exam,
    physics_marks_year1a.CAT AS physics_cat,
    physics_marks_year1a.EXAM AS physics_exam,
    php_marks_year1a.CAT AS php_cat, 
    php_marks_year1a.EXAM AS php_exam
    FROM students
    LEFT JOIN mathematics_marks_year1a ON students.id = mathematics_marks_year1a.id
    LEFT JOIN physics_marks_year1a ON students.id = physics_marks_year1a.id
    LEFT JOIN php_marks_year1a ON students.id = php_marks_year1a.id
    WHERE students.id = '$id'
    ");

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result); // Fetch associative array for clarity

        // Calculate the total marks for each subject and overall
        $math_total = $row['math_cat'] + $row['math_exam'];
        $physics_total = $row['physics_cat'] + $row['physics_exam'];
        $php_total = $row['php_cat'] + $row['php_exam'];
        $overall_total = $math_total + $physics_total + $php_total;

        // Calculate percentage
        $max_total = 600; // Maximum total marks for all subjects
        $percentage = ($overall_total / $max_total) * 100;

        // Determine grade based on percentage (example logic)
        if ($percentage >= 80) {
            $grade = 'A';
        } elseif ($percentage >= 70) {
            $grade = 'B';
        } elseif ($percentage >= 60) {
            $grade = 'C';
        } elseif ($percentage >= 50) {
            $grade = 'DDD';
        } else {
            $grade = 'E';
        }

        $cat_total = $row['php_cat'] + $row['math_cat'] + $row['physics_cat'];
        $exam_total = $row['php_exam'] + $row['math_exam'] + $row['physics_exam'];
        // HTML output starts here
        ?>
       
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Report Card</title>
            <style>
           table {
    border-collapse: collapse;
    border: 2px solid black;
    padding: 10px;
    width: 100%;
    font-size: 15px;
}

th,
td {
    border: 1px solid black;
    border-collapse: collapse;
    padding: 8px;
    text-align: center;
}

th {
    background-color: rgb(206, 177, 234);
}

td:nth-child(even) {
    /* background-color: grey; */
}

.perc {
    background-color: white;
}

.left {
    position: absolute;
    left: 4rem;
    top: 10rem;
}

.right {
    position: absolute;
    left: 95rem;
    top: 10rem;
}

.rca-logo {
    position: absolute;
    top: 21rem;
    left: 5rem;
}

.address {
    position: absolute;
    top: 38rem;
    left: 4rem;
}

.max {
    background-color: gray;
}

.qr-code {
    display: block;
    margin: 20px auto;
    text-align: center;
}

@media (max-width: 768px) {
    .left, .right, .rca-logo, .address {
        position: static;
        text-align: center;
        margin: 10px 0;
    }
    .right h3, .right h2 {
        margin: 5px 0;
    }
}

            </style>
        </head>

        <body>
            <!-- <h2>Report Card</h2>          -->
                <table>
                    <tr>
                        <td colspan="26" height="600rem">
                            <div class="left">
                               <h3>REPUBLIC OF RWANDA</h3>
                               <h3>MINISTRY OF EDUCATION</h3>
                               <h3>RWANDA CODING ACADEMY</h3>
                            </div>
                            <img src="./logo.png" alt="RWANDA CODING ACADEMY logo" class="rca-logo">
                            <div class="address">
                            <h3>Telephone:(+250)798963223</h3>
                            <h3>Email: irasubizasalynelson@gmail.com</h3>
                            </div>
                            <div class="center">
                                <img src="./nelson.png" alt="IRASUBIZA SALY NELSON image">
                            </div>
                            <div class="right">
                                <h3>Academic Year : 2023-2024</h3>
                                <h3>Class: Year 1A</h3>
                                <h3>Student ID: <?php echo $row['id'] ?></h3>
                                <h2>Name: <?php echo $row['name'] ?></h2>
                            </div>
                        </td>

                        <?php

                            $math_percentage = ($math_total / 200) * 100;
                            if ($math_percentage >= 80) {
                                $math_grade = 'A';
                            } elseif ($math_percentage >= 70) {
                                $math_grade = 'B';
                            } elseif ($math_percentage >= 60) {
                                $math_grade = 'C';
                            } elseif ($math_percentage >= 50) {
                                $math_grade = 'D';
                            } else {
                                $math_grade = 'E';
                            }
                            ?>
                            <?php

                                $physics_percentage = ($physics_total / 200) * 100;
                                if ($physics_percentage >= 80) {
                                    $physics_grade = 'A';
                                } elseif ($physics_percentage >= 70) {
                                    $physics_grade = 'B';
                                } elseif ($physics_percentage >= 60) {
                                    $physics_grade = 'C';
                                } elseif ($physics_percentage >= 50) {
                                    $physics_grade = 'D';
                                } else {
                                    $physics_grade = 'E';
                                }
                                ?>

                                <?php

                                    $php_percentage = ($php_total / 200) * 100;
                                    if ($php_percentage >= 80) {
                                        $php_grade = 'A';
                                    } elseif ($php_percentage >= 70) {
                                        $php_grade = 'B';
                                    } elseif ($php_percentage >= 60) {
                                        $php_grade = 'C';
                                    } elseif ($php_percentage >= 50) {
                                        $php_grade = 'D';
                                    } else {
                                        $php_grade = 'E';
                                    }
                                    ?>

                    </tr>
                    <tr>
                       <td rowspan="2">COURSES</td>
                       <td colspan="6">FIRST TERM</td>
                       <td colspan="6">SECOND TERM</td>
                       <td colspan="6">THIRD TERM</td>
                       <td colspan="3">YEAR</td>
                       <td rowspan="2">GRADE</td>
                    </tr>
                   <tr>
                       <td colspan="2">CAT</td>
                       <td colspan="2">EXAM</td>
                       <td colspan="2">TOT</td>
                       <td colspan="2">CAT</td>
                       <td colspan="2">EXAM</td>
                       <td colspan="2">TOT</td>
                       <td colspan="2">CAT</td>
                       <td colspan="2">EXAM</td>
                       <td colspan="2">TOT</td>
                       <td colspan="2">TOT</td>
                       <td>%</td>                       
                    </tr>
                    <tr>
                        <td>Discipline</td>
                        <td colspan="4"></td>
                        <td></td>
                        <td class="max">100</td>
                        <td colspan="4"></td>
                        <td></td>
                        <td class="max">100</td>
                        <td colspan="4"></td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">120</td>
                        <td></td>                      
                    </tr>
                    <tr>
                       <strong><td colspan="26">Marks</td></strong> 
                    </tr>
                    <tr>
                        <td>Applied Mathematics</td>
                        <td><?php echo $row['math_cat'] ?></td>
                        <td class="max">100</td>
                        <td><?php echo $row['math_exam'] ?></td>
                        <td class="max">100</td>
                        <td><?php echo $math_total?></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                         <td class="max">100</td>
                        <td></td>
                        <td class="max">200</td>
                       <td></td>
                        <td class="max">100</td>
                        <td></td>
                         <td class="max">100</td>
                        <td></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">120</td>
                        <td><?php echo number_format($math_percentage, 2) ?>%</td>
                        <td><?php echo  $math_grade ?></td>                       
                    </tr>
                     <tr>
                        <td>Applied Physics</td>
                        <td><?php echo $row['physics_cat'] ?></td>
                        <td class="max">100</td>
                        <td><?php echo $row['physics_exam'] ?></td>
                        <td class="max">100</td>
                        <td><?php echo $physics_total ?></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">120</td>
                        <td><?php echo number_format($physics_percentage, 2) ?>%</td>
                        <td><?php echo $physics_grade ?></td>
                        
                    </tr>
                      <tr>
                        <td>PhP</td>
                        <td><?php echo $row['php_cat'] ?></td>
                        <td class="max">100</td>
                        <td><?php echo $row['php_exam'] ?></td>
                        <td class="max">100</td>
                        <td><?php echo $php_total ?></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">100</td>
                        <td></td>
                        <td class="max">200</td>
                        <td></td>
                        <td class="max">120</td>
                        <td><?php echo number_format($php_percentage, 2) ?>%</td>
                        <td><?php echo $php_grade ?></td>
                    
                    </tr>
                     <tr>
                        <td>Total</td>
                        <td><?php echo $cat_total ?></td>
                        <td class="max">300</td>
                        <td><?php echo $exam_total ?></td>
                        <td class="max">300</td>
                        <td><?php echo $overall_total ?></td>
                        <td class="max">600</td>
                        <td></td>
                        <td class="max">300</td>
                        <td></td>
                        <td class="max">300</td>
                        <td></td>
                        <td class="max">600</td>
                        <td></td>
                        <td class="max">300</td>
                        <td></td>
                        <td class="max">300</td>
                        <td></td>
                        <td class="max">600</td>
                        <td></td>
                        <td class="max">120</td>
                        <td></td>
                        <td></td>                     
                    </tr>
                    <tr>
                        <td>Percentage</td>
                        <td colspan="6"><?php echo number_format($percentage, 2)?>%</td>
                        <td colspan="6"></td>
                        <td colspan="6"></td>
                        <td colspan="2"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td rowspan="">Signature Of Class Advisor</td>
                        <td colspan="6"></td>
                        <td colspan="6"></td>
                        <td colspan="6"></td>
                        <td colspan="3"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="26" rowspan="2" height="400rem"></td>
                    </tr>
                </table>
            </div>
        </body>
        </html>
        <?php
    } else {
        echo "No data found for the given ID.";
    }
    mysqli_free_result($result);
    mysqli_close($conn);
}
?>