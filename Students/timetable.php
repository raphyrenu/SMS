<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
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
         <button id="prevPageButton">Previous Page</button>
    <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>

</body>
</html>