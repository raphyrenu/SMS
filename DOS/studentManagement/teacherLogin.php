<?php
include '../../config/config.php';
session_start();
if (isset($_POST['submit'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $sql = mysqli_query($conn, "SELECT * FROM teacher WHERE email='$email' AND password='$password'");
    $num = mysqli_fetch_array($sql);

    $user_id = $num['id'];
    $message = 'User with email:' . $email . ' has login.';
    if ($num > 0) {
        $_SESSION['user_id'] = $num['id'];
        $_SESSION['email'] = $email;
        if ($num['subject'] == 'physics') {
            header('Location:physics.php?id=' . $num['id']);
            exit();
        } else if ($num['subject'] == 'discipline') {
            header('Location:discipline.php?id=' . $num['id']);
            exit();
        }


    } else {
        $_SESSION['msg'] = '<div class="alert alert-danger" role="alert">
        Invalid email or password</div>';
        header('Location:studentLogin.php');


        exit();
    }
}
?>


<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
body {
    background-color: #f8f9fa;
}

.container {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

form {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-label {
    font-weight: bold;
}

.btn-primary {
    width: 100%;
}

.create-account {
    margin-top: 10px;
    text-align: center;
}

.create-account a {
    color: #007bff;
    text-decoration: none;
}

.create-account a:hover {
    text-decoration: underline;
}

.alert {
    margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="container">
    <form method="post" class="w-50">
        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        ?>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Email address</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" name="email">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Password</label>
            <input type="password" class="form-control" id="exampleFormControlInput1" name="password">
        </div>
        <button class="btn btn-primary" type="submit" name="submit">Login</button>
        <div class="create-account">
            <a href="create.php">Don't have an account? Create one</a>
        </div>
    </form>
</div>
</body>
</html>
