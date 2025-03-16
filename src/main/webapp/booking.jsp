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
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book a Ride | MegaCity Cab</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="css/booking.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <%@include file="components/header.jsp" %>

        <div class="booking-container">
            <div class="booking-header">
                <h1 class="main-heading">Book Your Ride</h1>
                <p class="sub-heading">Fast, Safe & Reliable</p>
            </div>

            <div class="booking-content">
                <div class="form-box">
                    <form action="bookride" id="ride-form" method="POST">
                        <!-- Pickup Location -->
                        <div class="form-group">
                            <label for="pickup"> Pickup Location</label>
                            <input type="text" id="pickup" name="pickup" placeholder="Enter pickup address" required>
                            <!--                            <button type="button" id="current-location-btn" class="btn-current-location">
                                                            <i class="fas fa-location-arrow"></i> Use My Current Location
                                                        </button>-->
                        </div>

                        <!-- Drop-off Location -->
                        <div class="form-group">
                            <label for="dropoff"> Drop-off Location</label>
                            <input type="text" id="dropoff" name="dropoff" placeholder="Enter drop-off address" required>
                        </div>

                        <!-- Approximate Distance -->
                        <div class="form-group">
                            <label for="distance"> Approximate Distance (in km)</label>
                            <input type="double" id="distance" name="distance" placeholder="Enter approximate distance" required>
                        </div>

                        <!-- Ride Type -->
                        <div class="form-group">
                            <label>Select Vehicle Type</label>
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
                            <input type="hidden" id="ride-type" name="ride-type" value="standard">
                        </div>

                        <!-- Date & Time -->
                        <div class="form-group">
                            <label for="date-time"> Date & Time</label>
                            <input type="text" id="date-time" name="date-time" placeholder="Select date and time" required>
                        </div>

                        <!-- Hidden Fields for Fare and Distance -->
                        <input type="hidden" id="total-fare" name="fare" value="500.00">
                        <input type="hidden" id="hidden-distance" name="distance" value="0">

                        <!-- Form Buttons -->
                        <div class="form-buttons">
                            <button type="submit" class="btn-submit">Confirm Booking</button>
                            <button type="button" id="reset-form-btn" class="btn-submit btn-reset">Reset Form</button>
                        </div>
                    </form>
                </div>

                <!-- Fare Calculation -->
                <div class="fare-calculation">
                    <h3>💰 Fare Estimate</h3>
                    <div class="fare-details">
                        <p><strong>Ride Type:</strong> <span id="ride-type-display">Standard</span></p>
                        <p><strong>Date & Time:</strong> <span id="date-time-display">Not selected</span></p>
                        <p><strong>Base Fare:</strong> <span id="base-fare">LKR 500.00</span></p>
                        <p><strong>Distance:</strong> <span id="distance-display">0.00 km</span></p>
                        <p><strong>Total Fare:</strong> <span id="total-fare-display">LKR 500.00</span></p>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footer.jsp" %>

        <!-- JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/booking.js"></script>


        <!-- Custom JavaScript -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const baseFare = 500.00;
                const perKmRate = 100.00;

                const now = new Date();
                const currentDateTime = now.toISOString().slice(0, 16);

                const dateTimeInput = flatpickr("#date-time", {
                    enableTime: true,
                    dateFormat: "Y-m-d H:i",
                    minDate: "today",
                    time_24hr: true,
                    defaultDate: currentDateTime,
                    onChange: function (selectedDates, dateStr) {
                        document.getElementById('date-time-display').textContent = dateStr;
                    }
                });

                document.getElementById('date-time').value = currentDateTime.replace('T', ' ');
                document.getElementById('date-time-display').textContent = currentDateTime.replace('T', ' ');

                const vehicleOptions = document.querySelectorAll('.vehicle-option');
                const rideTypeInput = document.getElementById('ride-type');
                const rideTypeDisplay = document.getElementById('ride-type-display');

                vehicleOptions.forEach(option => {
                    option.addEventListener('click', function () {
                        vehicleOptions.forEach(opt => opt.classList.remove('active'));
                        option.classList.add('active');
                        rideTypeInput.value = option.getAttribute('data-value');
                        rideTypeDisplay.textContent = option.querySelector('span').textContent;
                    });
                });

                const distanceInput = document.getElementById('distance');
                const distanceDisplay = document.getElementById('distance-display');
                const totalFareDisplay = document.getElementById('total-fare-display');
                const totalFareInput = document.getElementById('total-fare');
                const hiddenDistanceInput = document.getElementById('hidden-distance');

                distanceInput.addEventListener('input', function () {
                    const distance = parseFloat(distanceInput.value) || 0;
                    const totalFare = baseFare + (distance * perKmRate);
                    distanceDisplay.textContent = `${distance.toFixed(2)} km`;
                    totalFareDisplay.textContent = `LKR ${totalFare.toFixed(2)}`;
                    totalFareInput.value = totalFare.toFixed(2);
                    hiddenDistanceInput.value = distance.toFixed(2);
                });

                document.getElementById('reset-form-btn').addEventListener('click', function () {
                    document.getElementById('ride-form').reset();
                    distanceDisplay.textContent = '0.00 km';
                    totalFareDisplay.textContent = 'LKR 500.00';
                    rideTypeDisplay.textContent = 'Standard';
                    dateTimeDisplay.textContent = currentDateTime.replace('T', ' ');
                    vehicleOptions.forEach(opt => opt.classList.remove('active'));
                    rideTypeInput.value = 'standard';
                    dateTimeInput.setDate(currentDateTime);
                });

                // Handle form submission with SweetAlert
document.getElementById('ride-form').addEventListener('submit', function (e) {
    e.preventDefault(); // Prevent default form submission

    const formData = new FormData(this);

    fetch(this.action, {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text(); // Parse the response as plain text
    })
    .then(status => {
        if (status === "success") {
            Swal.fire({
                icon: 'success',
                title: 'Booking Successful!',
                text: 'Thank you for choosing MegaCity Cab.',
                confirmButtonText: 'OK'
            }).then(() => {
                // Optionally, reset the form after success
                document.getElementById('ride-form').reset();
                document.getElementById('distance-display').textContent = '0.00 km';
                document.getElementById('total-fare-display').textContent = 'LKR 500.00';
                document.getElementById('ride-type-display').textContent = 'Standard';
                document.getElementById('date-time-display').textContent = 'Not selected';
                document.querySelectorAll('.vehicle-option').forEach(opt => opt.classList.remove('active'));
                document.getElementById('ride-type').value = 'standard';
                flatpickr("#date-time").setDate(new Date());
            });
        } else if (status === "login_required") {
            Swal.fire({
                icon: 'warning',
                title: 'Please Login',
                text: 'You need to login to book a ride.',
                confirmButtonText: 'OK'
            }).then(() => {
                // Redirect to login page
                window.location.href = "login.jsp"; 
            });
        } else if (status === "error") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong! Please try again.',
                confirmButtonText: 'OK'
            });
        }
    })
    .catch(error => {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong! Please try again.',
            confirmButtonText: 'OK'
        });
    });
});
                });
            });
        </script>
    </body>
</html>