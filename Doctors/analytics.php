<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Analytics</title>
    <!-- <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .main-content {
            margin: 20px auto;
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
                  #prevPageButton {
    padding: 10px 20px;
    background-color: #1f6391;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#prevPageButton:hover {
    background-color: #0f4377;
}
    </style> -->
</head>
<body>
    <div class="header">
        <h1>Analytics</h1>
    </div>
    <div class="main-content">
        <h2>Appointment Statistics</h2>
        <table>
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Total Appointments</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Connect to database (replace values with your actual database credentials)
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "sms";
                $conn = new mysqli($servername, $username, $password, $dbname);

                // Check connection
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Fetch appointment statistics by month from the database
                $sql = "SELECT MONTHNAME(date) AS month, COUNT(*) AS total_appointments FROM appointments GROUP BY MONTH(date)";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    // Output data of each row
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["month"] . "</td>";
                        echo "<td>" . $row["total_appointments"] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='2'>No appointment statistics found</td></tr>";
                }
                $conn->close();
                ?>
            </tbody>
        </table>
            
    <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>

    </div>
</body>
</html>

<?php

include '../config/config.php';

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["email"]) && isset($_POST["password"]) && !empty($_POST["email"]) && !empty($_POST["password"])) {
        if ($_POST["email"] === "doctor@gmail.com" && $_POST["password"] === "doctor") {
            $_SESSION["loggedin"] = true;
            header("location: analytics.php");
            exit;
        } else {
            $error = "Invalid email or password.";
        }
    } else {
        $error = "Please enter email and password.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Analytics</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .main-content {
            margin: 20px auto;
            width: 80%;
            max-width: 600px;
        }
        .login-form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Analytics</h1>
    </div>
    <div class="main-content">
        <canvas id="gradeChart" width="600" height="400"></canvas>
    </div>

    <div class="login-form">
        <!-- <h2>Login</h2> -->
        <?php
        // if (isset($error)) {
        //     echo "<p style='color: red;'>$error</p>";
        // }
        ?>
        <!-- <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <input type="text" name="email" placeholder="Email" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">
        </form> -->
    </div>

    <script>
        <?php
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "sms";
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT grade, COUNT(*) AS total_students FROM student_records GROUP BY grade";
        $result = $conn->query($sql);

        $grades = [];
        $counts = [];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $grades[] = $row["grade"];
                $counts[] = $row["total_students"];
            }
        }
        $conn->close();
        ?>

        var ctx = document.getElementById('gradeChart').getContext('2d');
        var gradeChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: <?php echo json_encode($grades); ?>,
                datasets: [{
                    label: 'Number of Students',
                    data: <?php echo json_encode($counts); ?>,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw;
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
