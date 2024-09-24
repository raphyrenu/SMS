<?php 
include '../../config/config.php';
session_start();
if(isset($_POST['submit'])){
    $email=$_POST['email'];
    $password=$_POST['password'];
    $sql=mysqli_query($conn,"SELECT * FROM students WHERE email='$email' AND password='$password'");
    $num=mysqli_fetch_array($sql);
    $user_id = $num['id'];
    $message='User with email:'.$email.' has login.';
    if($num>0){
        $_SESSION['user_id'] = $num['id'];
        $_SESSION['email']=$email;
        header('Location:report.php?id='.$num['id']);
        exit();
}
    else{
        $_SESSION['msg']='<div class="error" role="alert">
        Invalid email or password</div>';
        header('Location:studentLogin.php'); 
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" href="slogin.css">
   
   
    
</head>
<body>
    <div class="cont">
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


