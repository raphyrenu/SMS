<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="./dashboard.css">
    <style>
      
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">Dashboard Menu</div>
        <ul class="sidebar-nav">
            <li><a href="./dashboard.php">Dashboard</a></li>
            <li><a href="./assignments.php">Assignments</a></li>
            <li><a href="./notes.php">View Notes</a></li>
            <li><a href="../DOS/studentManagement/studentLogin.php">Manage Marks</a></li>
            <li><a href="./doctor.php">Message Doctor</a></li>
            <li><a href="./PROFILE/profile.php">Profile</a></li>
            <li><a href="../registration/logout.php">Logout</a></li>
        </ul>
    </div>
    <div class="dashboard">
        <h1 class=''>Student Dashboard</h1>
        <div class="dashboard-items">
            <div class="dashboard-item">
                <h2 class=''>Assignments</h2>
                <img src="../Teachers/student1.jpg" class='images' alt="Assignments">
               <a href="./assignments.php"><button class="button">View Assignments</button></a> 
            </div>
            <div class="dashboard-item">
                <h2>Upload Notes</h2>
                <img src="../Teachers/student2.jpg " class='images' alt="Upload Notes">
              <a href="./notes.php"><button class="button">Available Notes</button></a> 
            </div>
            <div class="dashboard-item">
                <h2>Manage Marks</h2>
                <img src="../Teachers/assign.jpeg" class='images' alt="Manage Marks">
             <a href="../DOS/studentManagement/studentLogin.php"><button class="button">Manage marks</button></a> 
            </div>
        </div>
    </div>
</body>
</html>






