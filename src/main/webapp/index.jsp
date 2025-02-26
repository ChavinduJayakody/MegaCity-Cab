<%-- 
    Document   : index
    Created on : Feb 26, 2025, 7:53:59 PM
    Author     : Chavindu Jayakody
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab - Online Vehicle Reservation System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
             body {
                 font-family: 'Arial', sans-serif;
                 margin: 0;
                 padding: 0;
                 background: linear-gradient(135deg, #1e3c72, #2a5298);
                 color: white;
             }
             .navbar {
                 display: flex;
                 justify-content: space-between;
                 align-items: center;
                 padding: 20px 50px;
                 background: rgba(0, 0, 0, 0.7);
             }
             .navbar .logo {
                 font-size: 24px;
                 font-weight: bold;
             }
             .navbar .nav-links a {
                 color: white;
                 text-decoration: none;
                 margin: 0 15px;
                 font-size: 18px;
             }
             .navbar .nav-links a:hover {
                 color: #ff6f61;
             }
             .hero {
                 height: 100vh;
                 display: flex;
                 justify-content: center;
                 align-items: center;
                 text-align: center;
                 background: url('https://via.placeholder.com/1920x1080') no-repeat center center/cover;
             }
             .hero h1 {
                 font-size: 48px;
                 margin-bottom: 20px;
             }
             .hero p {
                 font-size: 24px;
                 margin-bottom: 40px;
             }
             .hero .btn {
                 padding: 15px 30px;
                 background: #ff6f61;
                 color: white;
                 text-decoration: none;
                 border-radius: 5px;
                 font-size: 18px;
             }
             .hero .btn:hover {
                 background: #ff3b2f;
             }
             .features {
                 padding: 50px;
                 background: white;
                 color: #333;
                 text-align: center;
             }
             .features h2 {
                 font-size: 36px;
                 margin-bottom: 40px;
             }
             .features .feature-item {
                 display: inline-block;
                 width: 30%;
                 margin: 0 1.5%;
                 vertical-align: top;
             }
             .features .feature-item i {
                 font-size: 48px;
                 color: #ff6f61;
                 margin-bottom: 20px;
             }
             .features .feature-item h3 {
                 font-size: 24px;
                 margin-bottom: 15px;
             }
             .features .feature-item p {
                 font-size: 16px;
                 color: #666;
             }
             footer {
                 background: #333;
                 color: white;
                 text-align: center;
                 padding: 20px;
             }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Mega City Cab</div>
            <div class="nav-links">
                <a href="#home">Home</a>
                <a href="#features">Features</a>
                <a href="#about">About</a>
                <a href="#contact">Contact</a>
                <a href="login.jsp">Login</a>
            </div>
        </div>

        <div class="hero" id="home">
            <div>
                <h1>Welcome to Mega City Cab</h1>
                <p>Your reliable partner for hassle-free cab reservations in Colombo City.</p>
                <a href="register.jsp" class="btn">Get Started</a>
            </div>
        </div>

        <div class="features" id="features">
            <h2>Why Choose Us?</h2>
            <div class="feature-item">
                <i class="fas fa-car"></i>
                <h3>Easy Booking</h3>
                <p>Book your cab in just a few clicks. Fast, simple, and reliable.</p>
            </div>
            <div class="feature-item">
                <i class="fas fa-clock"></i>
                <h3>24/7 Availability</h3>
                <p>We are available round the clock to serve you anytime, anywhere.</p>
            </div>
            <div class="feature-item">
                <i class="fas fa-shield-alt"></i>
                <h3>Safe & Secure</h3>
                <p>Your safety is our priority. Enjoy secure rides with trusted drivers.</p>
            </div>
        </div>

        <footer>
            <p>&copy; 2024 Mega City Cab. All rights reserved.</p>
        </footer>
    </body>
</html>
