<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = request.getParameter("error");
    if (error != null && error.equals("1")) {
%>
<div class="error-message">
    <p>⚠️ An error occurred while processing your booking. Please try again.</p>
</div>
<%
    }
%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book a Ride | MegaCity Cab</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="css/booking.css">
        <link rel="stylesheet" href="css/styles.css">

    </head>
    <body>
        <!--Header-->
        <%@include file="components/header.jsp" %>

        <div class="booking-container">
            <div class="booking-header">
                <h1 class="main-heading">Book Your Ride</h1>
                <p class="sub-heading">Fast, Safe & Reliable</p>
            </div>

            <div class="booking-content">
                <!-- Booking Form -->
                <div class="form-box">
                    <form action="${pageContext.request.contextPath}/bookride" id="ride-form" method="POST">
                        <div class="form-group">
                            <label for="pickup"> Pickup Location</label>
                            <input type="text" id="pickup" name="pickup" placeholder="Enter pickup address" required>
                            <button type="button" id="current-location-btn" class="btn-current-location">
                                <i class="fas fa-location-arrow"></i> Use My Current Location
                            </button>
                        </div>

                        <div class="form-group">
                            <label for="dropoff"> Drop-off Location</label>
                            <input type="text" id="dropoff" name="dropoff" placeholder="Enter drop-off address" required>
                        </div>

                        <div class="form-group">
                            <div class="vehicle-type-selector">
                                <div class="vehicle-option" data-value="standard" data-seats="4">
                                    <i class="fas fa-car"></i>
                                    <span>Standard</span>
                                    <small>Up to 4 seats</small>
                                </div>
                                <div class="vehicle-option" data-value="luxury" data-seats="4">
                                    <i class="fas fa-car-side"></i>
                                    <span>Luxury</span>
                                    <small>Up to 4 seats</small>
                                </div>
                                <div class="vehicle-option" data-value="suv" data-seats="6">
                                    <i class="fas fa-car"></i>
                                    <span>SUV</span>
                                    <small>Up to 6 seats</small>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="date-time"> Date & Time</label>
                            <input type="text" id="date-time" name="date-time" placeholder="Select date and time" required>
                        </div>
                        <input type="hidden" id="ride-type" name="ride-type" value="standard">
                        <input type="hidden" id="total-fare" name="fare" value="500.00">
                        <input type="hidden" id="distance" name="distance" value="0">

                        <div class="form-buttons">
                            <button type="submit" class="btn-submit">Confirm Booking</button>
                            <button type="button" id="reset-form-btn" class="btn-submit btn-reset">Reset Form</button>
                        </div>
                    </form>
                </div>

                <!-- Map Container -->
                <div class="map-container">
                    <div id="map"></div>

                    <div class="fare-calculation">
                        <h3>💰 Fare Estimate</h3>
                        <div class="fare-details">
                            <p><strong>Base Fare:</strong> <span id="base-fare">LKR 500.00</span></p>
                            <p><strong>Distance:</strong> <span id="distance">0.00 km</span></p>
                            <p><strong>Total Fare:</strong> <span id="total-fare">LKR 500.00</span></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@include file="components/footer.jsp" %>>

        <!-- Leaflet JavaScript -->
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
        <!-- Custom JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script src="js/booking.js"></script>
        <script src="js/script.js"></script>

    </body>
</html>