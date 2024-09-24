<?php
include ('../../config/config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt_admin = $conn->prepare("SELECT * FROM teacher WHERE email = ? AND password = ?");
    $stmt_admin->bind_param("ss", $email, $password);
    $stmt_admin->execute();
    $result_admin = $stmt_admin->get_result();

    if ($result_admin->num_rows > 0) {
        if ($email == 'wui@gmail.com' && $password == 'WUI') {
            header("Location: ./WUI/WUI.php");
            exit();
        } elseif ($email == 'gui@gmail.com' && $password == 'GUI') {
            header("Location: ./GUI/GUI.php");
            exit();
        } elseif ($email == 'fundamentals@gmail.com' && $password == 'fundamentals_of_programming') {
            header("Location: ./fundamentals_of_programming/fundamentals_of_programming.php");
            exit();
        } elseif ($email == 'networking@gmail.com' && $password == 'networking') {
            header("Location: ./networking/networking.php");
            exit();
        } elseif ($email == 'php@gmail.com' && $password == 'php') {
            header("Location: ./php/php.php");
            exit();
        } elseif ($email == 'javascript@gmail.com' && $password == 'javascript') {
            header("Location: ./javascript/javascript.php");
            exit();
        } elseif ($email == 'english@gmail.com' && $password == 'english') {
            header("Location: ./english/english.php");
            exit();
        }

    }

    $stmt_student = $conn->prepare("SELECT * FROM teacher WHERE email = ? AND password = ?");
    $stmt_student->bind_param("ss", $email, $password);
    $stmt_student->execute();
    $result_student = $stmt_student->get_result();

    if ($result_student->num_rows > 0) {
        header("Location: ../teacher/dashboard.php");
        exit();
    }

    $error = "Error: Invalid username or password";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <div class="heading">
        <h1>Login</h1>
        <p>Sign in for a better user experience</p>
    </div>
    <div class="container">
        <div class="form-container sign-in-container">
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
                <h1>Sign In</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="social"><i class="fa fa-google"></i></a>
                    <a href="#" class="social"><i class="fa fa-linkedin"></i></a>
                </div>
                <span>or use your account</span>
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="password" placeholder="Password" required />
                <a href="#">Forgot your password?</a>
                <button type="submit">Sign In</button>
                <?php if (isset($error)): ?>
                        <p style="color: red;"><?php echo $error; ?></p>
                <?php endif; ?>
            </form>
        </div>
    </div>
</body>
</html>
