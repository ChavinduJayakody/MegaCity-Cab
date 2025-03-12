<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/staffLogin.css">
        <link rel="stylesheet" href="css/header.css">

        <title>Driver Login / SignUp | MegaCity Cab</title>
    </head>
    <body>

        <%@include file="components/header.jsp" %>

        <div class="form-container">
            <!-- Left Column (Image with Gradient Overlay) -->
            <div class="form-image">
                <div class="form-image-content">
                    <h1>MegaCity Cab Staff Portal</h1>
                    <p>Log in to manage your shifts and stay connected.</p>
                </div>
            </div>

            <!-- Right Column (Form) -->
            <div class="form-content">
                <!-- Driver Login Form -->
                <form action="${pageContext.request.contextPath}/staff-login" method="post" class="form-content" id="driverLoginForm">
                    <h1 class="form-title">Welcome, MegaCity Staff!</h1>

                    <div class="form-group">
                        <label for="loginEmail">Email</label>
                        <input type="email" id="loginEmail" name="loginEmail" required>
                    </div>

                    <div class="form-group">
                        <label for="loginPassword">Password</label>
                        <input type="password" id="loginPassword" name="loginPassword" required>
                    </div>

                    <button type="submit" class="form-button">Login</button>
                </form>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; 2025 MegaCity Cab. All rights reserved.</p>
        </footer>
    </body>
</html>