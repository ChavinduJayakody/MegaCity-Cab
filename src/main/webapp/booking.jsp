<%-- 
    Document   : booking
    Created on : Mar 8, 2025, 11:04:39 PM
    Author     : Chavindu Jayakody
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book a Ride | MegaCity Cab</title>
        <link rel="stylesheet" href="css/booking.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!--Header-->
        <%@include file="components/header.jsp" %>

        <div class="container">
            <div class="booking-header">
                <h2 class="main-heading">Book Your Ride</h2>
                <h3 class="sub-heading" style="color:black;">Fast, Safe & Reliable</h3>
            </div>
            <section class="ride-booking">


            <div class="booking-content">
                <div class="booking-form">
                    <form id="ride-form">
                        <label for="pickup">📍 Pickup Location:</label>
                        <input type="text" id="pickup" placeholder="Enter pickup address" required>

                        <label for="dropoff">📍 Drop-off Location:</label>
                        <input type="text" id="dropoff" placeholder="Enter drop-off address" required>

                        <label for="ride-type">🚖 Ride Type:</label>
                        <select id="ride-type">
                            <option value="standard">Standard</option>
                            <option value="luxury">Luxury</option>
                            <option value="suv">SUV</option>
                        </select>

                        <label for="date-time">📅 Date & Time:</label>
                        <input type="datetime-local" id="date-time" required>

                        <button type="submit">Confirm Booking</button>
                    </form>
                </div>

                <!-- Google Maps Embed -->
                <div class="map-container">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434508485!2d144.96305771550416!3d-37.81410797975151!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0xf4c8f2cb0d9b8b21!2sMelbourne%20CBD%2C%20VIC%203000%2C%20Australia!5e0!3m2!1sen!2sin!4v1649777745632"
                        width="100%"
                        height="100%"
                        style="border:0;"
                        allowfullscreen=""
                        loading="lazy">
                    </iframe>
                </div>
            </div>
            </section>
        </div>

        <script src="js/booking.js"></script>
        <script src="js/script.js"></script>

    </body>
</html>