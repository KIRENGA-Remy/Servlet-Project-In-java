<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Data</title>
    <style>
        body {
            background-color: #e6e6ff; /* Blue background */
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4d94ff; /* Light blue header */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternate row color */
        }
    </style>
</head>
<body>
    <h2>Student Data</h2>
    <table>
        <thead>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Age</th>
                <th>School</th>
                <th>Email</th>
                <th>Mobile Phone</th>
            </tr>
        </thead>
        <tbody>
            <sql:setDataSource var="dataSource" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/student" user="postgres" password="remy2020" />
            <sql:query dataSource="${dataSource}" var="result">
                SELECT * FROM student
            </sql:query>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.code}" /></td>
                    <td><c:out value="${row.name}" /></td>
                    <td><c:out value="${row.age}" /></td>
                    <td><c:out value="${row.school}" /></td>
                    <td><c:out value="${row.email}" /></td>
                    <td><c:out value="${row.mobilephone}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
