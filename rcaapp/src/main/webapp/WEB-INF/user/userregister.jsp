<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            max-width: 400px; /* Set a maximum width */
            margin: auto; /* Center the form */
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
            text-decoration: none;
        }
        .form a:hover {
            text-decoration-line: underline;
        }
        .alert {
            color: #fff;
            font-weight: medium;
            display: none; /* Initially hide the alert */
        }
        .emailExists {
            width: 40%;
            max-width: 200px;
            margin: 5px auto;
            background: #fff;
            text-align: center;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            display: none;
        }
        .h1 {
            text-align: center;
            color: #333; /* Dark gray color */
        }
        .p {
            text-align: center;
            color: #666; /* Medium gray color */
        }
    </style>
</head>
<body>
<% if ("emailExists".equals(request.getAttribute("status"))) { %>
    <div class="emailExists">
        <h1 class="h1">Notifications</h1>
        <p class="p">Email already exists. Please use a different email or Login</p>
    </div>
<% } %>

<div class="container">
    <form class="form" action="<%= request.getContextPath()%>/userregister" method="post">
        <h2>Register</h2>
        <input type="text" name="username" placeholder="Username" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <p class="alert">
            <% if ("invalidPassword".equals(request.getAttribute("status"))) { %>
                Password: at least 8 characters, digits, symbols and both cases.
            <% } else if ("emailExists".equals(request.getAttribute("status"))) { %>
                Email already exists. Please use a different email or login.
            <% } %>
        </p>
        <input type="radio" name="roles" value="Admin" required><label>Admin</label>
        <input type="radio" name="roles" value="Guest" required><label>Guest</label>
        <button type="submit">Register</button>
        <p>Already have an account? <a href="<%= request.getContextPath()%>/userlogin">Login here</a></p>
    </form>
</div>
<script>
    // Get the alert element
    var alertElement = document.querySelector('.emailExists');
    // Show the alert
    if (alertElement) {
        alertElement.style.display = 'block';
        // Hide the alert after 5 seconds if it's visible
        setTimeout(function() {
            alertElement.style.display = 'none';
        }, 5000);
    }
</script>
<script>
    // Get the alert element
    var alertPassword = document.querySelector('.alert');
    // Show the alert
    if (alertPassword) {
    	alertPassword.style.display = 'block';
        // Hide the alert after 5 seconds if it's visible
        setTimeout(function() {
        	alertPassword.style.display = 'none';
        }, 5000);
    }
</script>

</body>
</html>