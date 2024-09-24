<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Display Year 1A Data</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
    }
    .sidebar {
        background-color: #2ecc71;
        color: #fff;
        padding: 20px;
        width: 200px;
        position: fixed;
        height: 100%;
    }
    .content {
        margin-left: 220px; /* Adjust for sidebar width */
        padding: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
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

#prevPageButton:hover {
    background-color: #0f4377;
}
</style>
</head>
<body>
<div class="sidebar">
    <h2>Sidebar Menu</h2>
    <ul>
        <li><a href="#">Dashboard</a></li>
        <li><a href="#">Profile</a></li>
        <li><a href="#">Settings</a></li>
    </ul>
</div>

<div class="content">
    <h1>Year 1A Student Data</h1>

    <form id="teacherForm">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>

        <label for="maxMarks">Max Marks:</label>
        <input type="number" id="maxMarks" name="maxMarks" min="0" max="100" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" id="submitButton">Submit Marks</button>
    </form>

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
            <!-- Student data will be displayed here -->
        </tbody>
    </table>
        
    <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>

</div>

<script>
// Fetch data from the database
fetch('data:text/plain,<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sms";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM year1_a";
$result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

$conn->close();
echo json_encode($data);
?>')
.then(response => response.json())
.then(data => {
    const studentTable = document.getElementById('studentTable');
    data.forEach((student, index) => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${student.student_id}</td>
            <td>${student.name}</td>
            <td>${student.class}</td>
            <td><input type="number" id="marks-${student.student_id}" min="0" max="100" value="${student.marks}" required></td>
        `;
        studentTable.appendChild(row);
    });

    const form = document.getElementById('teacherForm');
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        submitMarks();
    });
})
.catch(error => console.error('Error:', error));

function submitMarks() {
    const markInputs = document.querySelectorAll('input[type="number"]');
    const data = [];
    let allValid = true;

    markInputs.forEach(input => {
        const studentId = input.id.split('-')[1];
        const marks = parseInt(input.value);
        const maxMarks = parseInt(document.getElementById('maxMarks').value);

        if (marks < 0 || marks > maxMarks) {
            allValid = false;
            input.setCustomValidity(`Marks must be between 0 and ${maxMarks}`);
        } else {
            input.setCustomValidity('');
            data.push({
                student_id: studentId,
                marks: marks
            });
        }
    });

    if (allValid && document.getElementById('password').value === 'p') {
        const date = document.getElementById('date').value;
        const maxMarks = document.getElementById('maxMarks').value;

        // Send the data to the server
        fetch('submit_marks.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ date, maxMarks, data })
        })
        .then(response => {
            if (response.ok) {
                alert('Marks submitted successfully!');
            } else {
                alert('Error submitting marks. Please try again.');
            }
        })
        .catch(error => console.error('Error:', error));
    } else {
        alert('Please fill in all the fields correctly.');
    }
}
</script>

</body>
</html>
