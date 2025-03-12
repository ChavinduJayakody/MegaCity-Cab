<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.megacitycab.dao.DriverDAO"%>
<%@page import="com.mycompany.megacitycab.model.Driver"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Driver | MegaCity Cab </title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="staffDashboard.css">
    </head>

    <body>
        <div class="container">
            <div class="navigation">
                <ul>
                    <li>
                        <a href="#">
                            <span class="icon">
                                <ion-icon name="car"></ion-icon>
                            </span>
                            <h2 class="title">Mega City Cab</h2>
                        </a>
                    </li>

                    <li>
                        <a href="staffDashboard.jsp" id="dashboard">
                            <span class="icon">
                                <ion-icon name="home-outline"></ion-icon>
                            </span>
                            <span class="title">Dashboard</span>
                        </a>
                    </li>

                    <li>
                        <a href="bookings.jsp" id="bookings">
                            <span class="icon">
                                <ion-icon name="ticket-outline"></ion-icon>
                            </span>
                            <span class="title">Bookings</span>
                        </a>
                    </li>

                    <li>
                        <a href="customers.jsp" id="customers" class="active">
                            <span class="icon">
                                <ion-icon name="people-outline"></ion-icon>
                            </span>
                            <span class="title">Customers</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" id="drivers">
                            <span class="icon">
                                <ion-icon name="people-outline"></ion-icon>
                            </span>
                            <span class="title">Drivers</span>
                        </a>
                    </li>

                    <li>
                        <a href="inquiries.jsp" id="inquiries">
                            <span class="icon">
                                <ion-icon name="help-outline"></ion-icon>
                            </span>
                            <span class="title">Inquiries</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" id="signoutBtn">
                            <span class="icon">
                                <ion-icon name="log-out-outline"></ion-icon>
                            </span>
                            <span class="title">Sign Out</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- ========================= Main ==================== -->
            <div class="main">
                <%@include file="components/header.jsp" %>

                <%@include file="components/cards.jsp" %>

                <!-- ================ Driver Details ================= -->
                <div class="details1 details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Driver Details</h2>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Name</td>
                                    <td>Email</td>
                                    <td>Phone</td>
                                    <td>License Plate</td>
                                    <td>Vehicle Model</td>
                                    <td>Vehicle Color</td>
                                    <td>Vehicle Image</td>
                                    <td>Created At</td>
                                </tr>
                            </thead>

                            <tbody>
                                <%                                    DriverDAO driverDAOa = new DriverDAO();
                                    List<Driver> drivers = driverDAOa.getAllDrivers();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, HH:mm");
                                    for (Driver driver : drivers) {
                                %>
                                <tr>
                                    <td><%= driver.getDriverId()%></td>
                                    <td><%= driver.getFullName()%></td>
                                    <td><%= driver.getEmail()%></td>
                                    <td><%= driver.getPhone()%></td>
                                    <td><%= driver.getLicensePlate()%></td>
                                    <td><%= driver.getVehicleModel()%></td>
                                    <td><%= driver.getVehicleColor()%></td>
                                    <td>
                                        <% if (driver.getVehicleImage() != null && !driver.getVehicleImage().isEmpty()) {%>
                                        <img src="<%= driver.getVehicleImage()%>" alt="Vehicle Image" class="vehicle-image">
                                        <% } else { %>
                                        No Image
                                        <% }%>
                                    </td>
                                    <td><%= dateFormat.format(driver.getCreatedAt())%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <!-- =========== Scripts =========  -->
            <script>
                // add hovered class to selected list item
                let list = document.querySelectorAll(".navigation li");

                function activeLink() {
                    list.forEach((item) => {
                        item.classList.remove("hovered");
                    });
                    this.classList.add("hovered");
                }

                list.forEach((item) => item.addEventListener("mouseover", activeLink));

                // Menu Toggle
                let toggle = document.querySelector(".toggle");
                let navigation = document.querySelector(".navigation");
                let main = document.querySelector(".main");

                toggle.onclick = function () {
                    navigation.classList.toggle("active");
                    main.classList.toggle("active");
                };

                document.addEventListener('DOMContentLoaded', function () {
                    const sidebarItems = document.querySelectorAll('.navigation ul li a');
                    const defaultActiveItem = document.querySelector('.navigation ul li a[data-page="addStaff"]');
                    const pageContents = document.querySelectorAll('.page-content');

                    function setActiveItem(activeItem) {
                        sidebarItems.forEach(item => {
                            item.classList.remove('active');
                        });
                        activeItem.classList.add('active');

                        const page = activeItem.getAttribute('data-page');
                        pageContents.forEach(content => {
                            if (content.id === `${page}-content`) {
                                content.style.display = 'block';
                            } else {
                                content.style.display = 'none';
                            }
                        });
                    }

                    // Set default active item
                    setActiveItem(defaultActiveItem);

                    // Add click event listeners to sidebar items
                    sidebarItems.forEach(item => {
                        item.addEventListener('click', function (event) {
                            event.preventDefault();
                            setActiveItem(this);
                        });
                    });
                });

            </script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <script>
                document.getElementById("signoutBtn").addEventListener("click", function (event) {
                    event.preventDefault();

                    Swal.fire({
                        title: "Are you sure?",
                        text: "You will be logged out of your session!",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Yes, log me out!"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "components/processSignout.jsp";
                        }
                    });
                });
            </script>

            <!-- ====== ionicons ======= -->
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>