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

        <!-- Features Section -->
        <section class=" container">
            <h2 class="headings" >Our <span>Services</span></h2>
            <h2 class="headings-mini">Choose the perfect vehicle for your ride.</h2>
            <div class="features">
                <div class="feature">
                    <i class="fas fa-car"></i>
                    <h3>Wide Range of Vehicles</h3>
                    <p>Choose from a variety of vehicles to suit your needs.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-clock"></i>
                    <h3>24/7 Availability</h3>
                    <p>We are always here to serve you, anytime, anywhere.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-shield-alt"></i>
                    <h3>Safe & Secure</h3>
                    <p>Your safety is our top priority.</p>
                </div>
            </div>
        </section>

        <!-- Call to Action Section -->
        <section class="cta">
            <div class="cta-content">
                <h2>Ready to Ride?</h2>
                <p>Book your ride now and experience the best in-city transportation service.</p>
                <a href="#" class="btn">Reserve Your Cab</a>
            </div>
        </section>



        <!-- Vehicle Showcase Section -->
        <section class="vehicle-showcase">
            <div class="container">
                <h2 class="headings">Our <span>Fleet</span></h2>
                <h2 class="headings-mini">Choose the perfect vehicle for your ride.</h2>
                <!-- Swiper Container -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">

                        <!-- Vehicle 1: Standard Sedan -->
                        <div class="swiper-slide vehicle-card">
                            <div class="vehicle-image">
                                <img src="images/slide1.jpg" alt="Standard Sedan">
                            </div>
                            <div class="vehicle-details">
                                <h3>Standard Sedan</h3>
                                <ul>
                                    <li><i class="fas fa-users"></i> Up to 4 passengers</li>
                                    <li><i class="fas fa-suitcase"></i> 2 large suitcases</li>
                                    <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                    <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                </ul>
                            </div>
                        </div>

                        <!-- Vehicle 2: Luxury SUV -->
                        <div class="swiper-slide vehicle-card">
                            <div class="vehicle-image">
                                <img src="images/slide2.jpg" alt="Luxury SUV">
                            </div>
                            <div class="vehicle-details">
                                <h3>Luxury SUV</h3>
                                <ul>
                                    <li><i class="fas fa-users"></i> Up to 6 passengers</li>
                                    <li><i class="fas fa-suitcase"></i> 4 large suitcases</li>
                                    <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                    <li><i class="fas fa-tv"></i> Entertainment System</li>
                                    <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                </ul>
                            </div>
                        </div>

                        <!-- Vehicle 3: Minivan -->
                        <div class="swiper-slide vehicle-card">
                            <div class="vehicle-image">
                                <img src="images/slide3.jpg" alt="Minivan">
                            </div>
                            <div class="vehicle-details">
                                <h3>Minivan</h3>
                                <ul>
                                    <li><i class="fas fa-users"></i> Up to 8 passengers</li>
                                    <li><i class="fas fa-suitcase"></i> 6 large suitcases</li>
                                    <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                    <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                    <li><i class="fas fa-wheelchair"></i> Wheelchair Accessible</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Navigation buttons -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>

                    <!-- Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
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