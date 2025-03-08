
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/login.css">


        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


        <title>SignIn / SignUp | MegaCity Cab</title>
    </head>
    <body>
        <!-- Include Header -->
        <%@ include file="components/header.jsp" %>

        <div class="l-form">
            <div class="shape1"></div>
            <div class="shape2"></div>

            <div class="form">
                <img src="images/login.png" alt="" class="form__img">

                <form action="" class="form__content" id="loginForm">
                    <h1 class="form__title">Welcome !</h1>

                    <div class="form__div form__div-one">
                        <div class="form__icon">
                            <i class='bx bx-user-circle'></i>
                        </div>

                        <div class="form__div-input">
                            <label for="" class="form__label">Username</label>
                            <input type="text" class="form__input" required>
                        </div>
                    </div>

                    <div class="form__div">
                        <div class="form__icon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="form__div-input">
                            <label for="" class="form__label">Password</label>
                            <input type="password" class="form__input" required>
                        </div>
                    </div>
                    <a href="#" class="form__forgot">Forgot Password?</a>

                    <input type="submit" class="form__button" value="Login">

                    <div class="form__social">
                        <span class="form__social-text">Our Sign In with</span>
                        <button type="submit" class="form__button google" >Sign Up With<i class='fa-brands fa-google form__social-icon' ></i></button>
                        <span >Don't have an account? <a href="#" id="showSignup"class="switch">Sign Up Now</a></span>

                    </div>
                </form>

                <!-- Signup Form -->
                <form action="" class="form__content" id="signupForm" style="display: none;">
                    <h1 class="form__title">Create Account</h1>
                    <div class="form__div">
                        <div class="form__icon"><i class='bx bx-user'></i></div>
                        <div class="form__div-input">
                            <label class="form__label">Full Name</label>
                            <input type="text" class="form__input" required>
                        </div>
                    </div>
                    <div class="form__div">
                        <div class="form__icon"><i class='bx bx-envelope'></i></div>
                        <div class="form__div-input">
                            <label class="form__label">Email</label>
                            <input type="email" class="form__input" required>
                        </div>
                    </div>
                    <div class="form__div">
                        <div class="form__icon"><i class='bx bx-id-card'></i></div>
                        <div class="form__div-input">
                            <label class="form__label">NIC</label>
                            <input type="text" class="form__input" required>
                        </div>
                    </div>
                    <div class="form__div">
                        <div class="form__icon"><i class='bx bx-phone'></i></div>
                        <div class="form__div-input">
                            <label class="form__label">Telephone</label>
                            <input type="text" class="form__input" required>
                        </div>
                    </div>
                    <div class="form__div">
                        <div class="form__icon"><i class='bx bx-lock'></i></div>
                        <div class="form__div-input">
                            <label class="form__label">Password</label>
                            <input type="password" class="form__input" required>
                        </div>
                    </div>
                    <div class="form__div">
                        <div class="form__icon"><i class='bx bx-lock'></i></div>
                        <div class="form__div-input">
                            <label class="form__label">Re-enter Password</label>
                            <input type="password" class="form__input" required>
                        </div>
                    </div>
                    <input type="submit" class="form__button" value="Sign Up Now">
                    <span class="form__signup">Already have an account? <a href="#" id="showLogin" class="switch">Sign In Now</a></span>
                </form>
            </div>
        </div>
        <footer class="footer">
            <p>&copy; 2025 MegaCity Cab. All rights reserved.</p>
        </footer>
        <script src="js/login.js"></script>
        <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>

    </body>
</html>