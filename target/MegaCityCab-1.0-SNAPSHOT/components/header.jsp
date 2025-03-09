<%@page import="com.mycompany.megacitycab.model.Customer" %>
<header id="header" class="header">
    <a class="navbar-logo" href="index.jsp">Mega City <span class="theme-accent-color">Cab</span></a>

    <nav class="navbar">
        <a id="homebutton" href="index.jsp">Home</a>
        <a id="bookingbutton" href="booking.jsp">Book a Ride</a>
        <a id="mybookingsbutton" href="#">My Bookings</a>
        <a id="driverscarsbutton" href="#">Drivers & Cars</a>
        <a id="pricingbutton" href="#">Pricing & Billing</a>
        <a id="helpbutton" href="#">Help & Support</a>
    </nav>

    <%
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
    %>
    <a href="login.jsp" class="btn signin-btn" id="signin-btn">Sign In / Sign Up</a>
    <% } else {%>

    <div class="profile-dropdown">
        <div class="profile-info">
            <span class="username"><%= customer.getFullName()%></span>
            <button class="profile-btn" id="profile-btn">
                <i class="fas fa-user-circle"></i> 
            </button>
        </div>
        <div class="dropdown-content" id="dropdown-content">
            <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    <% }%>
</header>

<script>

document.getElementById("profile-btn").addEventListener("click", function() {
    var dropdown = document.getElementById("dropdown-content");
    if (dropdown.style.display === "block") {
        dropdown.style.display = "none";
    } else {
        dropdown.style.display = "block";
    }
});

window.addEventListener("click", function(event) {
    var dropdown = document.getElementById("dropdown-content");
    var profileBtn = document.getElementById("profile-btn");
    if (event.target !== profileBtn && !profileBtn.contains(event.target)) {
        dropdown.style.display = "none";
    }
});
</script>