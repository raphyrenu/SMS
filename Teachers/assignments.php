<!DOCTYPE html>
<html>
<head>
    <title>Assignments</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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


        h2 {
            color: #008000;
            text-align: center;
            margin-top: 20px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #008000;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Uploaded Assignments</h2>
    <div class="container">
        <table>
            <tr>
                <th>Filename</th>
                <th>Uploaded At</th>
                <th>Download</th>
            </tr>
            <?php
            // Database connection parameters
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "sms";

            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            $sql = "SELECT filename, file_path, uploaded_at FROM uploads";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    // Check if file exists before showing the link
                    $file_path = "../teachers/" . htmlspecialchars($row["file_path"]);
                    if (file_exists($file_path)) {
                        echo "<tr>
                                <td>" . htmlspecialchars($row["filename"]) . "</td>
                                <td>" . htmlspecialchars($row["uploaded_at"]) . "</td>
                                <td><a href='" . $file_path . "' download>Download</a></td>
                              </tr>";
                    } else {
                        echo "<tr>
                                <td>" . htmlspecialchars($row["filename"]) . "</td>
                                <td>" . htmlspecialchars($row["uploaded_at"]) . "</td>
                                <td>File not available</td>
                              </tr>";
                    }
                }
            } else {
                echo "<tr><td colspan='3'>No assignments uploaded yet.</td></tr>";
            }

            $conn->close();
            ?>
        </table>
        <button id="prevPageButton">Previous Page</button>
        <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>
    </div>
</body>
</html>
