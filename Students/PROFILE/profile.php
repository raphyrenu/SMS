<?php
session_start();
include ('../../config/config.php');

if (!isset($_SESSION['email'])) {
    header("Location: ../../registration/form.php");
    exit();
}

$email = $_SESSION['email'];
$query = $conn->prepare("SELECT * FROM students WHERE email = ?");
$query->bind_param("s", $email);
$query->execute();
$result = $query->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    echo "User not found!";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="profile.css">
    <title>User Profile</title>

</head>

<body>
   
    <header>
        <div class="header-left-section">
            <a href="javascript:history.back()"><button class="back_btn">Back</button></a>
        </div>
        <div class="header-right-section">
            <h3>RWANDA CODING ACADEMY</h3>
        </div>
    </header>
   
    <div class="profile">
        <div class="edit-profile">
            <p class="profile-title">My Profile</p>
            <h2 class="personal">Personal Info</h2>
            <div class="edit-form">
                <img src="../../registration/uploads/<?php echo htmlspecialchars($user['image']); ?>" alt="User Image">
                <div>
                    <div class="input-fields">
                        <label for="name">Name:</label>
                        <p><?php echo htmlspecialchars($user['name']); ?></p>
                    </div>
                    <div class="input-fields">
                        <label for="email">Email:</label>
                        <p><?php echo htmlspecialchars($user['email']); ?></p>
                    </div>
                    <div class="input-fields">
                        <label for="age">Age:</label>
                        <p><?php echo htmlspecialchars($user['age']); ?></p>
                    </div>
                    <div class="input-fields">
                        <label for="gender">Gender:</label>
                        <p><?php echo htmlspecialchars($user['gender']); ?></p>
                    </div>
                    <div class="input-fields">
                        <label for="contact">Contact:</label>
                        <p><?php echo htmlspecialchars($user['contact']); ?></p>
                    </div>
                    <div class="input-fields">
                        <label for="academic_year">Academic Year:</label>
                        <p><?php echo htmlspecialchars($user['academic_year']); ?></p>
                    </div>
                    <div class="input-fields">
                        <label for="parent">Parent's Name:</label>
                        <p><?php echo htmlspecialchars($user['parent']); ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</body>

</html>