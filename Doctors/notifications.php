<?php
include '../config/config.php';

$sql = "SELECT * FROM student_messages";
$result = mysqli_query($conn, $sql);

$notifications = [];

if (isset($_POST['closed_notification_id'])) {
    $closedNotificationId = $_POST['closed_notification_id'];

    // Delete the notification from the student_messages table
    $sqlDeleteNotification = "DELETE FROM student_messages WHERE id = $closedNotificationId";
    mysqli_query($conn, $sqlDeleteNotification);

    // Delete the notification from the closed_notifications table
    $sqlDeleteClosedNotification = "DELETE FROM closed_notifications WHERE notification_id = $closedNotificationId";
    mysqli_query($conn, $sqlDeleteClosedNotification);
}

$sqlClosedNotifications = "SELECT notification_id, closed_at FROM closed_notifications";
$resultClosedNotifications = mysqli_query($conn, $sqlClosedNotifications);

$closedNotificationIds = [];
$closedNotificationDates = [];

if (mysqli_num_rows($resultClosedNotifications) > 0) {
    while ($row = mysqli_fetch_assoc($resultClosedNotifications)) {
        $closedNotificationIds[$row['notification_id']] = true;
        $closedNotificationDates[$row['notification_id']] = $row['closed_at'];
    }
}

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $notification = [
            'id' => $row['id'],
            'student_name' => $row['student_name'],
            'student_email' => $row['student_email'],
            'message' => $row['message'],
            'date_written' => $row['date_written'],
            'delivery_date' => $row['delivery_date']
        ];

        if (!isset($closedNotificationIds[$notification['id']]) || (isset($closedNotificationIds[$notification['id']]) && strtotime($row['date_written']) >= strtotime($closedNotificationDates[$notification['id']]))) {
            $notifications[] = $notification;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
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

        .notification {
            background-color: #ffffff;
            padding: 10px;
            margin: 10px auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .notification-content {
            flex: 1;
        }

        .student-name {
            font-weight: bold;
            color: #007bff;
        }

        .student-email {
            font-style: italic;
            color: #28a745;
        }

        #back {
            width: 7rem;
            height: 3rem;
            background-color: rgb(16, 16, 75);
            color: white;
            font-weight: bolder;
            border: 0px solid white;
            border-radius: 20px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
        }

        .date-info {
            font-size: 12px;
            color: #6c757d;
        }

        .cancel-btn {
            cursor: pointer;
            color: #dc3545;
        }
        
    </style>
    <script>
        function closeNotification(notificationId) {
            document.getElementById('closed_notification_id').value = notificationId;
            document.querySelector('.notification-' + notificationId).style.display = 'none';
            document.getElementById('notification-form').submit();
        }
    </script>
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
        <a href="./history.php" class="sideLinks">
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
        <a href="./notifications.php" class="sideLinks sideLinksActive">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Notifications</span>
        </a>
        <a href="../registration/logout.php" class="sideLinks">
            <span><i class='bx bxs-balloon'></i></span>
            <span>Logout</span>
        </a>
    </div>
</aside>
<main>
    <div class="main">
        <header class="header">
            <h1>Notifications</h1>
        </header>
        <div class="main-content">
            <form method="post" action="" id="notification-form">
                <input type="hidden" name="closed_notification_id" id="closed_notification_id" value="">
                <?php
                foreach ($notifications as $notification) {
                    ?>
                        <div class="notification notification-<?php echo $notification['id']; ?>">
                            <div class="notification-content">
                                <span class="student-name"><?php echo $notification['student_name']; ?></span> -
                                <span class="student-email"><?php echo $notification['student_email']; ?></span><br>
                                <?php echo $notification['message']; ?><br>
                                <span class="date-info">Date Written: <?php echo $notification['date_written']; ?> | Delivery Date: <?php echo $notification['delivery_date']; ?></span>
                            </div>
                            <div class="cancel-btn" onclick="closeNotification(<?php echo $notification['id']; ?>);">✖</div>
                        </div>
                        <?php
                }
                ?>
            </form>
            <button type="button" id="back" onclick="window.history.back();">BACK</button>
        </div>
    </div>
</main>
</body>
</html>
