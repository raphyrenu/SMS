<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Year 1 php Students Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .content {
            margin: 20px;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
        }

        input[type="number"] {
            width: 80px;
            text-align: center;
        }

        #submitButton {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #teacherForm {
            margin-top: 20px;
        }

        #teacherForm input {
            margin-right: 10px;
        }

        #prevPageButton {
            padding: 10px 20px;
            background-color: #1f6391;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        h1 {
            text-align: center;
        }

        #prevPageButton:hover {
            background-color: #0f4377;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin: 20px auto;
            max-width: 400px;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
        }

        .blurred {
            filter: blur(5px);
        }

        .hidden {
            display: none;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        input {
            width: 100%;
            padding: 12px 20px;
            margin-bottom: 20px;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        a {
            display: block;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
        }

        .submit {
            background-color: rgba(17, 101, 8, 0.775);
            width: 25rem;
            height: 3rem;
            text-align: center;
            vertical-align: middle;
            color: white;
            font-size: 20px;
            border-radius: 10px;
        }

        .eye {
            cursor: pointer;
            position: absolute;
            right: 30px;
            top: 180px;
        }

        .hidden-password {
            position: relative;
        }
    </style>
</head>

<body>
    <div id="formContainer" class="container">
        <form id="marksForm" onsubmit="return submitForm()">
            <div>
                <label for="date">Date</label>
                <input type="date" id="date" name="date" />
            </div>
            <div>
                <label for="maxMarks">Max Marks</label>
                <input type="number" id="maxMarks" name="maxMarks" />
            </div>
            <div>
                <label for="course">Course</label>
                <select id="course" name="course">
                    <option value="physics">Physics</option>
                    <option value="chemistry">Chemistry</option>
                    <option value="biology">Biology</option>
                    <option value="math">Math</option>
                </select>
            </div>
            <div class="hidden-password">
                <label for="course-password">Course Password</label>
                <input type="password" id="course-password" name="password" />
                <span class="eye" onclick="togglePassword()">👁️</span>
            </div>
            <button type="submit" class="submit">Submit Marks</button>
        </form>
    </div>

    <div id="content" class="content">
        <h1>Year 1 D php Students Marks</h1>
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Class</th>
                    <th>Marks</th>
                </tr>
            </thead>
            <tbody id="studentTable">
                <?php
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "sms";

                $conn = new mysqli($servername, $username, $password, $dbname);

                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT student_id, name, class, marks FROM php_marks_year1d";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["student_id"] . "</td>";
                        echo "<td>" . $row["name"] . "</td>";
                        echo "<td>" . $row["class"] . "</td>";
                        echo "<td contenteditable='true' class='editable'>" . $row["marks"] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>No records found.</td></tr>";
                }

                $conn->close();
                ?>
            </tbody>
        </table>
        <button id="saveButton" onclick="saveMarks()">Save Marks</button>
    </div>

    <button id="prevPageButton">Previous Page</button>

    <script>
        document.getElementById('prevPageButton').addEventListener('click', function () {
            window.history.back();
        });

        function submitForm() {
            const date = document.getElementById('date').value;
            const maxMarks = document.getElementById('maxMarks').value;
            const coursePassword = document.getElementById('course-password').value;
            const currentYear = new Date().getFullYear();

            if (new Date(date).getFullYear() !== currentYear) {
                alert('The year entered must be the current year.');
                return false;
            }

            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
            if (!passwordPattern.test(coursePassword)) {
                alert('Course password must contain at least one uppercase letter, one lowercase letter, and one number.');
                return false;
            }

            document.getElementById('formContainer').classList.add('hidden');
            document.getElementById('content').classList.remove('blurred');
            return false; // Prevent form submission
        }

        window.onload = function () {
            document.getElementById('content').classList.add('blurred');
        }

        function togglePassword() {
            var passwordField = document.getElementById("course-password");
            var type = passwordField.getAttribute("type") === "password" ? "text" : "password";
            passwordField.setAttribute("type", type);
        }

        function saveMarks() {
            const rows = document.querySelectorAll('#studentTable tr');
            const marksData = [];
            const maxMarks = parseInt(document.getElementById('maxMarks').value);

            let valid = true;

            rows.forEach(row => {
                const studentId = row.cells[0].innerText;
                const marks = parseInt(row.cells[3].innerText);
                if (isNaN(marks) || marks < 0 || marks > maxMarks) {
                    alert('Marks for student ID ' + studentId + ' are invalid. Please enter a number between 0 and ' + maxMarks);
                    valid = false;
                }
                marksData.push({ studentId, marks });
            });

            if (!valid) return;

            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'update_marks_d.php', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    alert(xhr.responseText);
                }
            };
            xhr.send(JSON.stringify(marksData));
        }
    </script>
</body>

</html>