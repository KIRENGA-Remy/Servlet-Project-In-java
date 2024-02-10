<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <style>
        body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #3498db; /* Blue background color */
    color: white; /* Text color */
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form {
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    text-align: center;
}

.form h2 {
    margin-bottom: 20px;
}

.form input[type="text"],
.form input[type="password"],
.form input[type="email"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: none;
    border-radius: 5px;
}

.form button {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    background-color: #2980b9; /* Button background color */
    color: white;
    cursor: pointer;
}

.form button:hover {
    background-color: #1f618d; /* Button hover color */
}

.form p {
    margin-top: 10px;
}

.form a {
    color: #fff;
}

    </style>
</head>
<body>
    <div class="container">
        <form class="form">
            <h2>Register</h2>
            <input type="text" placeholder="Username" required>
            <input type="email" placeholder="Email" required>
            <input type="password" placeholder="Password" required>
            <button type="submit">Register</button>
            <p>Already have an account? <a href="userlogin.jsp">Login here</a></p>
        </form>
    </div>
</body>
</html>