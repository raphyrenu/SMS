<?php
include ('../config/config.php');
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['name'])) {
  $name = $_POST['name'];
  $age = $_POST['age'];
  $gender = $_POST['gender'];
  $email = $_POST['email'];
  $password = $_POST['password'];
  $academic_year = $_POST['academic_year'];
  $parent = $_POST['parent'];
  $contact = $_POST['contact'];
  $image = $_FILES['image']['name'];

  $target_dir = "uploads/";
  $target_file = $target_dir . basename($_FILES["image"]["name"]);
  move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);

  $stmt = $conn->prepare("INSERT INTO students (name, age, gender, email, password, academic_year, parent, contact, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
  $stmt->bind_param("sisssssss", $name, $age, $gender, $email, $password, $academic_year, $parent, $contact, $image);

  if ($stmt->execute()) {
    $_SESSION['email'] = $email;
    header('Location: ../Students/dashboard.php');
  } else {
    echo "Error: " . $stmt->error;
  }

  $stmt->close();
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email']) && !isset($_POST['name'])) {
  $email = $_POST['email'];
  $password = $_POST['password'];

  $stmt_admin = $conn->prepare("SELECT * FROM admins WHERE email = ? AND password = ?");
  $stmt_admin->bind_param("ss", $email, $password);
  $stmt_admin->execute();
  $result_admin = $stmt_admin->get_result();

  if ($result_admin->num_rows > 0) {
    $_SESSION['email'] = $email;
    if ($email == 'doctor@doctor.doctor' && $password == 'doctor') {
      header("Location: ../Doctors/dashboard.php");
      exit();
    } elseif ($email == 'accountant@accountant.accountant' && $password == 'accountant') {
      header("Location: ../Accountants/dashboard.php");
      exit();
    } elseif ($email == 'discipline@discipline.discipline' && $password == 'discipline') {
      header("Location: ../Discipline/dashboard.php");
      exit();
    } elseif ($email == 'admin@admin.admin' && $password == 'admin') {
      header("Location: ../PM/dashboard.php");
      exit();
    }
  }

  $stmt_student = $conn->prepare("SELECT * FROM students WHERE email = ? AND password = ?");
  $stmt_student->bind_param("ss", $email, $password);
  $stmt_student->execute();
  $result_student = $stmt_student->get_result();

  if ($result_student->num_rows > 0) {
    $_SESSION['email'] = $email;
    header("Location: ../Students/dashboard.php");
    exit();
  }

  $error = "Error: Invalid username or password";
}
?>

<!DOCTYPE html>
<html>

<head>
  <title>SignUp and Login</title>
  <link rel="stylesheet" type="text/css" href="style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
  <div class="heading">
    <h1>Our F<span>orm</span></h1>
    <p>Signup or sign in for a better user experience</p>
  </div>
  <div class="container" id="container">
    <div class="form-container sign-up-container">
      <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" enctype="multipart/form-data">
        <h1>Create Account</h1>
        <div class="social-container">
          <a href="#" class="social">S</a>
          <a href="#" class="social">M</a>
          <a href="#" class="social">S</a>
        </div>
        <span>or use your email for registration</span>
        <input type="text" name="name" placeholder="Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="number" name="age" placeholder="Age" required />
        <input type="text" name="gender" placeholder="Gender" required />
        <input type="text" name="contact" placeholder="Contact" required />
        <input type="text" name="academic_year" placeholder="Academic Year" required />
        <input type="text" name="parent" placeholder="Parent's Name" required />
        <input type="file" name="image" placeholder="Upload Image" required />
        <button type="submit">Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in-container">
      <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
        <h1>Sign In</h1>
        <div class="social-container">
        <a href="#" class="social">S</a>
          <a href="#" class="social">M</a>
          <a href="#" class="social">S</a>
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
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us please login with your personal info</p>
          <button class="ghost" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start your journey with us</p>
          <button class="ghost" id="signUp">Sign Up</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    const signUpButton = document.getElementById("signUp");
    const signInButton = document.getElementById("signIn");
    const container = document.getElementById("container");

    signUpButton.addEventListener("click", () => {
      container.classList.add("right-panel-active");
    });

    signInButton.addEventListener("click", () => {
      container.classList.remove("right-panel-active");
    });
  </script>
</body>

</html>