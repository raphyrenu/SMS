<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      
body {
  font-family: "Times New Roman", serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 0;
}



.container {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  padding: 40px;
  margin: 50px auto;
  max-width: 400px;
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
.submit{
    background-color:rgba(17, 101, 8, 0.775);
    width: 25rem;
    height: 3rem;
    text-align: center;
    vertical-align: middle;
    color: white;
    font-size: 20px;
    border-radius: 10px ;
}
    </style>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    />
  
  </head>
  <body>
    <div class="container bg-white rounded shadow p-4 my-5 max-w-400">
      <form>
        <div class="mb-3">
          <label for="name" class="form-label">Date</label>
          <input type="date" class="form-control" id="name" />
        </div>
        <div class="mb-3">
          <label for="mobile" class="form-label">Max Marks</label>
          <input type="number" class="form-control" id="mobile" />
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Course</label>
          <input type="text" class="form-control" id="email" />
        </div>
         <div class="mb-3">
          <label for="email" class="form-label">Course Password</label>
          <input type="password" class="form-control" id="email" />
        </div>
        <a href="#" class="submit">
        Submit Marks
        </a>
      </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
