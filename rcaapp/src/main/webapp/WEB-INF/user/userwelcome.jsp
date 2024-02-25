<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Page</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #3498db; /* Light gray background */
    }
    .container {
        width: 80%;
        max-width: 600px;
        margin: 50px auto;
        background: #fff;
        text-align: center;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        color: #333; /* Dark gray color */
    }
    p {
        text-align: center;
        color: #666; /* Medium gray color */
    }
    .button-container {
        display: flex;
        justify-content: center;
        text-align: center;
        margin: 30px 10px;
    }
    .button {
        padding: 8px 16px;
        margin: 0px 4px;
        background-color: #3498db; /* Blue color */
        color: #fff;
        border: none;
        border-radius: 4px;
        text-decoration: none;
        cursor: pointer;
    }
    .button:hover {
        background-color: #2980b9; /* Darker blue color on hover */
    }
</style>
</head>
<body>

<div class="container">
    <h1>Welcome Page</h1>
    <p>We are excited to have you join us!</p>
    <div class="button-container">
         <p>You want to become admin? <a href="<%= request.getContextPath()%>/userregister" class="button">Confirm</a></p>
    </div>
</div>

</body>
</html>
