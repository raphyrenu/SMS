<?php

$messageSent = false;
$errorMessage = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $student_name = $_POST['student_name'];
    $student_email = $_POST['student_email'];
    $message = $_POST['message'];

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "sms";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        $errorMessage = "Connection failed: " . $conn->connect_error;
    } else {
        $stmt = $conn->prepare("INSERT INTO student_messages (student_name, student_email, message) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $student_name, $student_email, $message);

        if ($stmt->execute()) {
            $messageSent = true;
        } else {
            $errorMessage = "Error: " . $stmt->error;
        }

        $stmt->close();
        $conn->close();
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Send Message to Doctor</title>
    <link rel="stylesheet" href="doctor.css">
    <style>
      
    </style>
</head>
<body>
   
        <h1>Send Message to Doctor</h1>
    
    <div class="main-content">
        <?php if ($messageSent): ?>
                <div class="success-message">Message sent to Doctor</div>
                <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        var successMessage = document.querySelector('.success-message');
                        successMessage.style.display = 'block';
                        setTimeout(function() {
                            successMessage.style.display = 'none';
                        }, 3000);
                    });
                </script>
        <?php elseif ($errorMessage): ?>
                <div class="error"><?php echo $errorMessage; ?></div>
        <?php endif; ?>
        
            <form action="" method="post">
            <label for="name">Enter your name</label>
                <input type="text" id='name' name="student_name" placeholder="irasubiza saly nelson" required><br>
                <label for="email">Your email</label>
                <input type="email" id='email' name="student_email" placeholder="example: nelson@saly.me" required><br>
                <label for="message">Enter message</label>
                <textarea name="message" id='message' placeholder="Your Message" rows="5" required></textarea><br>
                <label for=""></label>
                <button type="submit">Send message</button>
            </form>
              <button id="prevPageButton" class='prev'>Previous Page</button>   
    <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>

        
    </div>
</body>
</html>
