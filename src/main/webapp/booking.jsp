<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <form id="ride-form">
                        <div class="form-group">
                            <label for="pickup"> Pickup Location</label>
                            <input type="text" id="pickup" placeholder="Enter pickup address" required>
                            <button type="button" id="current-location-btn" class="btn-current-location">
                                <i class="fas fa-location-arrow"></i> Use My Current Location
                            </button>
                        </div>

                        <div class="form-group">
                            <label for="dropoff"> Drop-off Location</label>
                            <input type="text" id="dropoff" placeholder="Enter drop-off address" required>
                        </div>

                        <!-- Vehicle Type Selector -->

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
                                    <i class="fas fa-truck"></i>
                                    <span>SUV</span>
                                    <small>Up to 6 seats</small>
                                </div>
                            </div>
                            <input type="hidden" id="ride-type" name="ride-type" value="standard">
                        </div>

                        <div class="form-group">
                            <label for="date-time"> Date & Time</label>
                            <input type="text" id="date-time" placeholder="Select date and time" required>
                        </div>

                        <button type="submit" class="btn-submit">Confirm Booking</button>
                    </form>
                </div>

                <!-- Map Container -->
                <div class="map-container">
                    <div id="map"></div>

                    <div class="fare-calculation">
                        <h3>💰 Fare Estimate</h3>
                        <div class="fare-details">
                            <p><strong>Base Fare:</strong> <span id="base-fare">LKR 500.00</span></p>
                            <p><strong>Distance:</strong> <span id="distance">0 km</span></p>
                            <p><strong>Total Fare:</strong> <span id="total-fare">LKR 500.00</span></p>
                        </div>
                    </div>
                </div>

                <!-- Fare Calculation Section -->

            </div>
        </div>

        <!-- Leaflet JavaScript -->
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
        <!-- Custom JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="js/booking.js"></script>
        <script src="js/script.js"></script>

    </body>
</html>