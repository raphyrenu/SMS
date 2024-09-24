<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HISTORY</title>
    <style>
        /* GENERAL CSS */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: monospace;
        }
        ::-webkit-scrollbar {
            display: none;
        }
        body {
            position: relative;
            background: #eee;
        }

        /* SIDE NAV CSS */
        .sideMenu {
            background: #2c3e50;
            width: 15%;
            top: 0;
            left: 0;
            bottom: 0;
            color: #fff;
            position: fixed;
            padding: 1rem 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow-y: auto;
        }

        .sideLinks {
            color: #fff;
            padding: .7rem 1rem;
            text-decoration: none;
            display: flex;
            border-radius: 10px;
            margin: 1rem 0;
        }

        .sideLinks:hover {
            color: #fff;
            background: #1f6391;
            transition: .2s;
        }

        .sideLinks i {
            margin: 0 .3rem;
        }

        .sideLinksActive {
            background: #fff;
            color: #2c3e50;
        }

        main {
            width: 85%;
            float: right;
        }

        .header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
            background-color: #1f6391;
            color: white;
        }

        .main-content {
            margin: 20px auto;
            width: 80%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #1f6391;
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
    </style>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<aside class="sideMenu">
    <div>
        <a href="./dashboard.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Dashboard</span>
        </a>
        <a href="./student_appointments.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Student Appointments</span>
        </a>
        <a href="./medicalAssistance_requests.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>M A R</span>
        </a>
        <a href="./history.php" class="sideLinks sideLinksActive">
            <span><i class='bx bxs-balloon'></i></span>
            <span>History</span>
        </a>
        <a href="./student_health_reports.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Health Reports</span>
        </a>
        <a href="./analytics.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Analytics</span>
        </a>
        <a href="./profile.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Profile</span>
        </a>
        <a href="./notifications.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Notifications</span>
        </a>
        <a href="./logout.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Logout</span>
        </a>
    </div>
</aside>
<main>
    <div class="main">
        <header class="header">
            <h1>Patient Students History</h1>
        </header>
        <div class="main-content">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Student</th>
                        <th>Reason</th>
                        <th>Status</th>
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

                    // Fetch medical care history from the database
                    $sql = "SELECT students.name AS student_name, medical_care_history.date, medical_care_history.diagnosis, medical_care_history.treatment FROM medical_care_history JOIN students ON medical_care_history.student_id = students.id";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        // Output data of each row
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $row["student_name"] . "</td>";
                            echo "<td>" . $row["date"] . "</td>";
                            echo "<td>" . $row["diagnosis"] . "</td>";
                            echo "<td>" . $row["treatment"] . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>No medical care history found</td></tr>";
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
    </div>
</main>
</body>
</html>
