<%-- 
    Document   : addAdminTest
    Created on : Mar 12, 2025, 12:42:06 PM
    Author     : Chavindu Jayakody
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Admin</title>
    </head>
    <body>
        <h1>Add Admin User</h1>
        <form action="${pageContext.request.contextPath}/add-admin" method="post">
            <div>
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" value="staff" readonly>
            </div>
            <button type="submit">Add Admin</button>
        </form>
    </body>
</html>