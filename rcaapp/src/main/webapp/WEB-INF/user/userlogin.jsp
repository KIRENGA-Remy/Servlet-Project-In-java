<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
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

    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
    <div class="container">
        <form class="form" action="<%= request.getContextPath()%>/userlogin" method="post"> <!-- Added action attribute -->
    <h2>Login</h2>
    <input type="text" name="email" placeholder="Email" > <!-- Added name attribute -->
    <input type="password" name="password" placeholder="Password" > <!-- Added name attribute -->
                    <p class="alert"> 
            <% if ("invalidPassword".equals(request.getAttribute("status"))) { %>
                Password: at least 8 characters, digits, symbols and both cases.
            <% } %>
        </p>
    <button type="submit">Login</button>
    <p>Don't have an account? <a href="<%= request.getContextPath()%>/userregister">Register here</a></p>
</form>

    </div>
    
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://upkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status == "failed"){
    	swal("Sorry", "Wrong email or password", "error");
    }
    else if(status == "invalidEmail"){
    	swal("Sorry ", "Please Enter Email", "error");
    }
    else if(status == "invalidPassword"){
    	swal("Sorry", "Please Enter Password", "error");
    }
    </script>
    
    <script>
    // Get the alert element
    var alertElement = document.querySelector('.alert');

    // Show the alert
    alertElement.style.display = 'block';

    // Hide the alert after 5 seconds
    setTimeout(function() {
        alertElement.style.display = 'none';
    }, 5000);
</script>
</body>
</html>
