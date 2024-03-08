<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notification Alert</title>
<style>
    .container {
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
    h1 {
        text-align: center;
        color: #333; /* Dark gray color */
    }
    p {
        text-align: center;
        color: #666; /* Medium gray color */
    }
</style>
</head>
<body>
<div class="container">
        <% if ("invalidEmail".equals(request.getAttribute("status")) || "invalidPassword".equals(request.getAttribute("status"))) { %>
              <h1>Notifications</h1>
              <p>Email already exist, Login!</p>
        <% } %>
</div>
<script>
    // Get the alert element
    var alertElement = document.querySelector('.container');

    // Show the alert
    alertElement.style.display = 'block';

    // Hide the alert after 5 seconds if it's visible
    if (alertElement.style.display !== 'none') {
        setTimeout(function() {
            alertElement.style.display = 'none';
        }, 4000);
    }
</script>
</body>
</html>
