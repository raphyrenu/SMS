<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        div{
          width:50rem;
          height:12rem;
          box-shadow: 10px 10px 10px 10px grey;
          position: relative;
          left: 18rem;
          top: 10rem;
        }
        img{
            position: relative;
            top: 2rem;
        }
        #emoji{
            font-size: 60px;
            position: absolute;
            left: 35rem;
            top: 0rem;
        }
        #status{
            font-size: 80px;
            font-weight: bolder;
            color: darkblue;
            position: relative;
            top: -9rem;
            left: 20rem;
        }
        h1{
            position: absolute;
            top: 15rem;
            left: 15rem;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: 50px;
        }
        #back{
            width: 7rem;
            height: 3rem;
            background-color: rgb(16, 16, 75);
            color: white;
            font-weight: bolder;
            border: 0px solid white;
            border-radius: 20px;
            cursor: pointer;
        }
        #refresh{
            width: 7rem;
            height: 3rem;
            background-color: rgb(16, 16, 75);
            color: white;
            font-weight: bolder;
            border: 0px solid white;
            border-radius: 20px;
            position: relative;
            left: 70rem;
            cursor: pointer;
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
    <div>
    <h1>Page Not Found</h1>
    <img src="./download.png" alt="">
    <img src="" alt="">
    <p id="status">404</p>
    <p id="emoji">😊😊</p>
    </div>
           <button id="prevPageButton">Previous Page</button>     
    <script>
    document.getElementById('prevPageButton').addEventListener('click', function() {
    window.history.back();
});

</script>

    <!-- <button type="button" id="back" >BACK</button> -->
    <button type="button" id="refresh">REFRESH</button>
</body>
</html>