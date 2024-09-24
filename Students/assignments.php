<!DOCTYPE html>
<html>
<head>
    <title>Assignments</title>
    <link rel="stylesheet" href="assignments.css">
</head>
<body>
    <h2>Uploaded Assignments</h2>
    <div class="container">
        <table>
            <tr class='upper'>
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
                        echo "<tr class:'hey'>
                                <td>" . htmlspecialchars($row["filename"]) . "</td>
                                <td>" . htmlspecialchars($row["uploaded_at"]) . "</td>
                                <td><a href='" . $file_path . "' download>Get assigment</a></td>
                                
                              </tr>";
                    } else {
                        echo "<tr>
                                <td>" . htmlspecialchars($row["filename"]) . "</td>
                                <td>" . htmlspecialchars($row["uploaded_at"]) . "</td>
                                <td class='you'>File not available</td>
                              </tr>";
                    }
                }
            } else {
                echo "<tr><td colspan='3'>No assignments uploaded yet.</td></tr>";
            }

            $conn->close();
            ?>
             <button id="prevPageButton">Previous Page</button>
        </table>
      
    <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>

    </div>
</body>
</html>
