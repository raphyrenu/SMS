<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        
    </style>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script defer src="./script.js"></script>
    <title>Document</title>
</head>
<body>
<aside class="sideMenu">
    <div id="this">
        <div class="profile">
            <img src="./nurse.jpg" alt="Profile" class='w-30 h-30 rounded-full'>
            <h3>Dr.nurse</h3>
            <span>centrifuger</span>
        </div>
        <div>
            <a href="#" class="sideLinks sideLinksActive">
                <span><i class='bx bxs-balloon'></i></span>
                <span>Dashboard</span>
            </a> 
            <a href="./student_appointments.php" class="sideLinks sideLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <span>student Appointments</span>
            </a>
            <a href="./medicalAssistance_requests.php" class="sideLinks sideLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <span>M A R</span>
            </a>
            <a href="./history.php" class="sideLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <span>history</span>
            </a>
            <a href="./student_health_reports.php" class="sideLinks sideLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <span>health reports</span>
            </a>
            <a href="./analytics.php" class="sideLinks sideLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <span>analytics</span>
            </a>
            <a href="./profile.php" class="sideLinks sideLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <span>Profile</span>
            </a>
            <a href="./notifications.php" class="sideLinks sideLinks">
                <i class='bx bx-message-rounded-dots'></i>
                <span>Notifications</span>
            </a>
        </div>
        <a href="../registration/logout.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Logout</span>
        </a>
    </div>
</aside>
<main>
    <div class="main">
        <header class="header">
            <div>DashBoard</div>
            <div class="headerLinks">
                <span><i class='bx bxs-balloon'></i></span>
                <a href="#">Alert</a>
                <a href="#">Help</a>
            </div>
        </header>
        <section class="overview">
            <div class="overviewDiv">
                <span><i class='bx bxs-balloon'></i></span>
                <div>
                    <p>Patients</p>
                    <span>444</span>
                </div>
            </div>
            <div class="overviewDiv">
                <span><i class='bx bxs-balloon'></i></span>
                <div>
                    <p>Appointments</p>
                    <span>444</span>
                </div>
            </div>
            <div class="overviewDiv">
                <span><i class='bx bxs-balloon'></i></span>
                <div>
                    <p>Treatments</p>
                    <span>444</span>
                </div>
            </div>
            <div class="overviewDiv">
                <span><i class='bx bxs-balloon'></i></span>
                <div>
                    <p>Jeremy</p>
                    <span>444</span>
                </div>
            </div>
        </section>
        <section class="appointments">
            <div class="appointmentsDiv">
                <div class="IndividualAppointment">
                    <img src="./nurse.jpg" alt="Profile">
                    <div>
                        <h3>Jeremy Germany</h3>
                        <span>Sick</span>
                    </div>
                    <div class="time">
                        12:00
                        <i class="bx bx-x absolute"></i>
                    </div>
                </div>
            </div>
            <div class="appDetails">
                <div class="appUser">
                    <img src="./nurse.jpg" alt="Profile">
                    <div>
                        <p>2235 A ids dsdsds dsdsd</p>
                        <p>aadsdfasdfasdfasdfasdf</p>
                    </div>
                </div>
                <div class="otherInfo">
                    <article></article>
                </div>
            </div>
        </section>
        <section class="main-content">
            <header class="header">
                <h1>Student Appointments</h1>
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

// Fetch appointments from the database
$sql = "SELECT * FROM appointments";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
     // Output data of each row
     while ($row = $result->fetch_assoc()) {
          echo "<tr>";
          echo "<td>" . $row["date"] . "</td>";
          echo "<td>" . $row["time"] . "</td>";
          echo "<td>" . $row["student_id"] . "</td>"; // Assuming student_id is stored here
          echo "<td>" . $row["reason"] . "</td>";
          echo "<td>" . $row["status"] . "</td>";
          echo "</tr>";
     }
} else {
     echo "<tr><td colspan='5'>No appointments found</td></tr>";
}
$conn->close();
?>
                    </tbody>
                </table>
                  <div id="pagination">
    <button id="prevPage" onclick="prevPage()">Prev</button>
    <span id="pageInfo"></span>
    <button id="nextPage" onclick="nextPage()">Next</button>
</div>
            </div>

        </section>
    </div>
    <script>
    let currentPage = 1;
    const rowsPerPage = 5; // Adjust the number of rows per page as needed
    let rows = Array.from(document.querySelectorAll("tbody tr"));
    const paginationInfo = document.getElementById("pageInfo");

    function displayRows() {
        rows.forEach((row, index) => {
            row.style.display = (index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage) ? "" : "none";
        });
        paginationInfo.innerText = `Page ${currentPage} of ${Math.ceil(rows.length / rowsPerPage)}`;
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            displayRows();
        }
    }

    function nextPage() {
        if (currentPage < Math.ceil(rows.length / rowsPerPage)) {
            currentPage++;
            displayRows();
        }
    }

    // Initial display of rows
    displayRows();
</script>

</main>
</body>
</html>
