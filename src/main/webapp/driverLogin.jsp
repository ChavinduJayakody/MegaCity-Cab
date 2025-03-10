<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/driverLogin.css">
        <link rel="stylesheet" href="css/header.css">

        <title>Driver Login / SignUp | MegaCity Cab</title>
    </head>
    <body>

        <%@include file="components/header.jsp" %>

        <div class="form-container">
            <!-- Left Column (Image with Gradient Overlay) -->
            <div class="form-image">
                <div class="form-image-content">
                    <h1>Join MegaCity Cab</h1>
                    <p>Drive with us and earn on your own schedule.</p>
                </div>
            </div>

            <!-- Right Column (Form) -->
            <div class="form-content">
                <!-- Driver Login Form -->
                <form action="${pageContext.request.contextPath}/driver-login" method="post" class="form-content" id="driverLoginForm">
                    <h1 class="form-title">Welcome, Driver!</h1>

                    <div class="form-group">
                        <label for="loginEmail">Email</label>
                        <input type="email" id="loginEmail" name="loginEmail" required>
                    </div>

                    <div class="form-group">
                        <label for="loginPassword">Password</label>
                        <input type="password" id="loginPassword" name="loginPassword" required>
                    </div>

                    <button type="submit" class="form-button">Login</button>

                    <div class="form-switch">
                        Don't have an account? <a href="#" id="showDriverSignup">Sign Up Now</a>
                    </div>
                </form>

                <!-- Driver Signup Form -->
                <form action="${pageContext.request.contextPath}/driver-signup" method="post" enctype="multipart/form-data" class="form-content" id="driverSignupForm" style="display: none;">
                    <h1 class="form-title">Create Driver Account</h1>

                    <!-- Progress Bar -->
                    <div class="progress-bar">
                        <div class="progress"></div>
                    </div>

                    <!-- Step 1: Personal Details -->
                    <div class="form-step active" id="step1">
                        <div class="step-title">Personal Details</div>

                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" name="phone" required>
                        </div>

                        <div class="button-group">
                            <button type="button" class="form-button" id="nextButton1">Next</button>
                        </div>

                        <div class="form-switch">
                            Already have an account? <a href="#" id="showDriverLoginFromSignup">Sign In Now</a>
                        </div>
                    </div>

                    <!-- Step 2: Vehicle Details -->
                    <div class="form-step" id="step2">
                        <div class="step-title">Vehicle Details</div>

                        <div class="form-group">
                            <label for="licensePlate">License Plate</label>
                            <input type="text" id="licensePlate" name="licensePlate" required>
                        </div>

                        <div class="form-group">
                            <label for="vehicleModel">Vehicle Model</label>
                            <input type="text" id="vehicleModel" name="vehicleModel" required>
                        </div>

                        <div class="form-group">
                            <label for="vehicleColor">Vehicle Color</label>
                            <input type="text" id="vehicleColor" name="vehicleColor" required>
                        </div>

                        <div class="form-group">
                            <label for="vehicleImage">Vehicle Image</label>
                            <input type="file" id="vehicleImage" name="vehicleImage" accept="image/*" required>
                        </div>

                        <div class="button-group">
                            <button type="button" class="form-button" id="prevButton1">Previous</button>
                            <button type="button" class="form-button" id="nextButton2">Next</button>
                        </div>
                    </div>

                    <!-- Step 3: Password and Final Details -->
                    <div class="form-step" id="step3">
                        <div class="step-title">Password</div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                        </div>

                        <div class="form-group">
                            <label for="rePassword">Re-enter Password</label>
                            <input type="password" id="rePassword" name="rePassword" required>
                        </div>

                        <div class="button-group">
                            <button type="button" class="form-button" id="prevButton2">Previous</button>
                            <button type="submit" class="form-button">Sign Up</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; 2025 MegaCity Cab. All rights reserved.</p>
        </footer>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
    // Toggle between Driver Login and Signup Forms
    document.getElementById("showDriverSignup").addEventListener("click", function () {
        document.getElementById("driverLoginForm").style.display = "none";
        document.getElementById("driverSignupForm").style.display = "block";
        resetFormSteps(); // Reset steps when switching to signup form
    });

    document.getElementById("showDriverLoginFromSignup").addEventListener("click", function () {
        document.getElementById("driverSignupForm").style.display = "none";
        document.getElementById("driverLoginForm").style.display = "block";
    });

    // Multi-Step Form Elements
    const steps = [document.getElementById("step1"), document.getElementById("step2"), document.getElementById("step3")];
    const nextButtons = [document.getElementById("nextButton1"), document.getElementById("nextButton2")];
    const prevButtons = [document.getElementById("prevButton1"), document.getElementById("prevButton2")];
    const progressBar = document.querySelector(".progress");

    let currentStep = 0; // Track current step (0-based index)

    // Function to reset form steps to the first step
    function resetFormSteps() {
        currentStep = 0;
        showStep(currentStep);
        progressBar.style.width = "33.33%";
    }

    // Function to show only the active step
    function showStep(step) {
        steps.forEach((s, index) => {
            s.style.display = index === step ? "block" : "none";
        });

        // Update progress bar
        const progressValues = ["33.33%", "66.66%", "100%"];
        progressBar.style.width = progressValues[step];
    }

    // Function to validate fields in a step
    function validateStep(step) {
        const inputs = steps[step].querySelectorAll("input");
        let isValid = true;
        inputs.forEach(input => {
            if (!input.value.trim()) {
                isValid = false;
                input.style.borderColor = "red"; 
            } else {
                input.style.borderColor = ""; 
            }
        });
        return isValid;
    }

    // Handle "Next" button clicks
    nextButtons.forEach((btn, index) => {
        btn.addEventListener("click", function () {
            if (validateStep(currentStep)) {
                currentStep++;
                showStep(currentStep);
            }
        });
    });

    // Handle "Previous" button clicks
    prevButtons.forEach((btn, index) => {
        btn.addEventListener("click", function () {
            currentStep--;
            showStep(currentStep);
        });
    });

    // Initialize the form with only Step 1 visible
    resetFormSteps();
});
        </script>
    </body>
</html>