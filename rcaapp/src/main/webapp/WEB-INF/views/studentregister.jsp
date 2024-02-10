<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #2980b9; /* High-resolution blue color */
        color: #2980b9; /* White text color */
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 95vh;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
        padding: 16px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        align-items: center;
    }
    .form-group {
        margin-bottom: 16px;
    }
    .form-group label {
        display: block;
        margin-bottom: 4px;
        font-weight: bold;
    }
    .form-group input {
        width: 96%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .form-group input[type="submit"] {
        background-color: #2980b9; /* Blue submit button */
        color: #fff;
        cursor: pointer;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Student Registration Form</h2>
    <form action="<%= request.getContextPath()%>/register" method="post">
        <div class="form-group">
            <label for="code">Code:</label>
            <input type="number" id="code" name="code" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>
        </div>
        <div class="form-group">
            <label for="school">School:</label>
            <input type="text" id="school" name="school" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="mobilephone">Mobile Phone:</label>
            <input type="text" id="mobilephone" name="mobilephone" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>
</body>
</html>