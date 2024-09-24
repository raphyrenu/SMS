<!DOCTYPE html>
<html>
<head>
    <title>Upload Notes</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #008000;
        }

        form {
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="file"] {
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #008000;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
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


        input[type="submit"]:hover {
            background-color: #006400;
        }
    </style>
</head>
<body>
    <h2>Upload Your Notes</h2>
    <form action="" method="post" enctype="multipart/form-data">
        Select files to upload:
        <input type="file" name="filesToUpload[]" id="filesToUpload" multiple>
        <input type="submit" value="Upload" name="submit">
    </form>
 <button id="prevPageButton">Previous Page</button>
<script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});
</script>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $target_dir = "assignments/";
        $uploadOk = 1;

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

        if (isset($_FILES["filesToUpload"])) {
            $files = $_FILES["filesToUpload"];
            $num_files = count($files['name']);

            for ($i = 0; $i < $num_files; $i++) {
                $target_file = $target_dir . basename($files["name"][$i]);

                if (file_exists($target_file)) {
                    echo "Sorry, file already exists: " . htmlspecialchars($files["name"][$i]) . "<br>";
                    $uploadOk = 0;
                }

                if ($files["size"][$i] > 5000000) { // Increased size limit to 5MB
                    echo "Sorry, your file is too large: " . htmlspecialchars($files["name"][$i]) . "<br>";
                    $uploadOk = 0;
                }

                if ($uploadOk == 1) {
                    if (move_uploaded_file($files["tmp_name"][$i], $target_file)) {
                        echo "The file " . htmlspecialchars($files["name"][$i]) . " has been uploaded.<br>";

                        // Prepare and bind
                        $stmt = $conn->prepare("INSERT INTO uploads (filename, file_path) VALUES (?, ?)");
                        $stmt->bind_param("ss", $filename, $file_path);

                        // Set parameters and execute
                        $filename = basename($files["name"][$i]);
                        $file_path = $target_file;
                        $stmt->execute();

                        echo "File information has been saved in the database.<br>";

                        $stmt->close();
                    } else {
                        echo "Sorry, there was an error uploading your file: " . htmlspecialchars($files["name"][$i]) . "<br>";
                    }
                }
                $uploadOk = 1; // Reset $uploadOk for the next file
            }
        } else {
            echo "No files selected for upload.";
        }

        $conn->close();
    }
    ?>
</body>
</html>
