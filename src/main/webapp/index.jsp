<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab - Online Vehicle Reservation System</title>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    </head>
    <body>
        <!-- Include Header -->
        <%@ include file="components/header.jsp" %>

        <!-- Hero Section with Image Slider -->
        <section class="hero">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url('images/slide1.jpg');"></div>
                    <div class="swiper-slide" style="background-image: url('images/slide2.jpg');"></div>
                    <div class="swiper-slide" style="background-image: url('images/slide3.jpg');"></div>
                </div>

                <div class="swiper-pagination"></div>
            </div>
            <div class="hero-content">
                <h1>Welcome to Mega City Cab</h1>
                <p>Your reliable in-city transportation service.</p>
                <a href="#" class="btn">Book Your Ride</a>
            </div>
        </section>



        <!-- Include Footer -->
        <%@ include file="components/footer.jsp" %>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="js/script.js"></script>
        <script>
            
        </script>
    </body>
</html>