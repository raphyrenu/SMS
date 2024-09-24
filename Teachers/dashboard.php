<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard</title>
   
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .header {
            background-color: #34495e; /* Deep blue */
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .sidebar {
            background-color: #ecf0f1; /* Light grey */
            color: #2c3e50; /* Dark blue */
            padding: 20px;
            width: 220px;
            position: fixed;
            height: 100%;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar a {
            color: #2c3e50; /* Dark blue */
            text-decoration: none;
            display: block;
            padding: 15px 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar a:hover {
            background-color: #bdc3c7; /* Hover light grey */
            color: #34495e; /* Deep blue */
        }
        .content {
            margin-left: 240px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            gap: 20px;
            transition: margin-left 0.3s;
        }
        .section {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex: 1;
            max-width: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .section h2 {
            margin-bottom: 20px;
            color: #34495e; /* Deep blue */
            border-bottom: 2px solid #2980b9; /* Blue */
            padding-bottom: 5px;
            font-size: 20px;
            width: 100%;
            text-align: center;
        }
        .section img {
            width: 80%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .button {
            background-color: #2980b9; /* Blue */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #1f6391; /* Darker blue */
        }
        .dropdown {
            position: relative;
            display: inline-block;
            margin-bottom: 10px;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            /* background-color: #fff; */
            min-width: 160px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            z-index: 1;
        }
        .dropdown-content a {
            color: #2c3e50; /* Dark blue */
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }
        .dropdown-content a:hover {
            background-color: green; /* Hover light grey */
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
li {
     color: #2c3e50; /* Dark blue */
            text-decoration: none;
            display: block;
            padding: 15px 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: #ecf0f1;
   background-color: #bdc3c7; /* Hover light grey */
            color: #34495e; /* Deep blue */
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  /* color: black; */
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: red;}

.dropdown:hover .dropdown-content {
  display: block;
}
    </style>
</head>
<body>
    <div class="header">
        <h1>PHYSICS Teachers Dashboard</h1>
    </div>
    <div class="sidebar">
        <a href="./assignments/assignments.php">Assignments</a>
        <a href="./upload.php">Upload Notes</a>
        <strong><a href="./upload.php">MANAGE MARKS</a></strong> 
  <li class="dropdown">
    <a href="#">YEAR 1</a>
    <div class="dropdown-content">
     <a href="../../DOS/marks/year1a.php">Year 1 A </a>
     <a href="../marks/year1b.php">Year 1 B</a>
     <a href="../marks/year1c.php">Year 1 C</a>
     <a href="../marks/year1d.php">Year 1 D</a>
    </div>
  </li>
   <li class="dropdown">
    <a href="#">YEAR 2</a>
    <div class="dropdown-content">
     <a href="../marks/year2a.php">Year 2 A </a>
     <a href="../marks/year2b.php">Year 2 B</a>
     <a href="../marks/year2c.php">Year 2 C</a>
     <a href="../marks/year2d.php">Year 2 D</a>
    </div>
  </li>

    </div>
    <div class="content">
        <div class="section">
            <h2>Assignments</h2>
            <img src="assign.jpeg" alt="Assignments">
            <button class="button">Add Assignment</button>
        </div>
        <div class="section">
            <h2>Upload Notes</h2>
            <img src="assign.jpeg" alt="Upload Notes">
            <button class="button">Add Notes</button>
        </div>
        <div class="section">
            <h2>YEAR 1</h2>
            <img src="assign.jpeg" alt="Manage Marks">
            <div class="dropdown">
                <button class="button">Year 1</button>
                <div class="dropdown-content">
                    <a href="#">Year A</a>
                    <a href="#">Year B</a>
                    <a href="#">Year C</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="button">Year 2</button>
                <div class="dropdown-content">
                    <a href="#">Year A</a>
                    <a href="#">Year B</a>
                    <a href="#">Year C</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="button">Year 3</button>
                <div class="dropdown-content">
                    <a href="#">Year A</a>
                    <a href="#">Year B</a>
                    <a href="#">Year C</a>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
