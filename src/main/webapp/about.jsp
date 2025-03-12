<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>About MegaCity Cab</title>
        <meta name="description" content="About MegaCity Cab - Safe and Reliable Rides">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/about.css">
        <link rel="stylesheet" href="css/styles.css">

        <!-- Fontawesome icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    </head>
    <body>

        <%@include file="components/header.jsp" %>

        <section class = "contact-section">
            <div class = "contact-bg">
                <h3>Get in Touch with Us</h3>
                <h2>contact us</h2>
                <div class = "line">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <p class = "text">MegaCity Cab is dedicated to providing safe, reliable, and affordable rides across the city. With our fleet of modern vehicles and professional drivers, we ensure a smooth and comfortable travel experience for our passengers.</p>
            </div>


            <div class = "contact-body">
                <div class = "contact-info">
                    <div>
                        <span><i class = "fas fa-mobile-alt"></i></span>
                        <span>Phone No.</span>
                        <span class = "text">+94-712-858-489</span>
                    </div>
                    <div>
                        <span><i class = "fas fa-envelope-open"></i></span>
                        <span>E-mail</span>
                        <span class = "text">admin@megacitycab.com</span>
                    </div>
                    <div>
                        <span><i class = "fas fa-map-marker-alt"></i></span>
                        <span>Address</span>
                        <span class = "text">No 58/A, Sri Jayewardenepura, Kotte, Sri Lanka</span>
                    </div>
                    <div>
                        <span><i class = "fas fa-clock"></i></span>
                        <span>Opening Hours</span>
                        <span class = "text">Monday - Friday (9:00 AM to 5:00 PM)</span>
                    </div>
                </div>

                <div class = "contact-form">
                    <h2>Inquiries</h2>
                    <form id="inquiryForm" action="${pageContext.request.contextPath}/submit-inquiry" method="post">
                        <div>
                            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Full Name">
                        </div>
                        <div>
                            <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone">
                        </div>
                        <textarea rows="5" placeholder="Message" id="message" name="message" class="form-control"></textarea>
                        <input type="submit" class="send-btn" value="Send Message">
                    </form>
                </div>
            </div>

            <%@include file="components/footer.jsp" %>

        </section>

    </body>
</html>
