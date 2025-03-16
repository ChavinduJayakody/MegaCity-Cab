<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.megacitycab.dao.CustomerDAO"%>
<%@page import="com.mycompany.megacitycab.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mycompany.megacitycab.dao.BookingDAO" %>
<%@page import="com.mycompany.megacitycab.model.Booking" %>

<%
    // Fetch data from the database
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getAllBookings();
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Admin Dashboard | MegaCity Cab </title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="adminDashboard.css">
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
                        <a href="adminDashboard.jsp" id="dashboard" class="active">
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
                        <a href="customers.jsp" id="customers">
                            <span class="icon">
                                <ion-icon name="people-outline"></ion-icon>
                            </span>
                            <span class="title">Customers</span>
                        </a>
                    </li>

                    <li>
                        <a href="drivers.jsp" id="drivers">
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
                        <a href="addStaff.jsp" id="addStaff">
                            <span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
                            <span class="title">Add Staff</span>
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

                <!-- ================ Order Details List ================= -->
                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Recent Orders</h2>
                            <a href="#" class="btn">View All</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <td>Pickup Location</td>
                                    <td>Drop off Location</td>
                                    <td>Customer Name</td>
                                    <td>Date & Time</td>
                                    <td>Fare</td>
                                    <td>Distance</td>
                                    <td>Status</td>
                                </tr>
                            </thead>

                            <tbody>
                                <%                                // Iterate over the list of bookings
                                    for (Booking booking : bookings) {
                                %>
                                <tr>
                                    <td><%= booking.getPickupLocation()%></td>
                                    <td><%= booking.getDropoffLocation()%></td>
                                    <td></td> <!-- Replace with actual customer name if available -->
                                    <td><%= booking.getDateTime()%></td>
                                    <td><%= booking.getFare()%></td>
                                    <td><%= booking.getDistance()%></td>
                                    <td><span class="status delivered">Completed</span></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <!-- ================= New Customers ================ -->
                    <div class="recentCustomers">
                        <div class="cardHeader">
                            <h2>Recent Customers</h2>
                        </div>

                        <table>
                            <%                            CustomerDAO customerDAO1 = new CustomerDAO();
                                List<Customer> recentCustomers = customerDAO1.getAllCustomers();
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                                for (Customer customer : recentCustomers) {
                            %>
                            <tr>
                                <td width="60px">
                                    <div class="imgBx"><img src="components/user.png" alt=""></div>
                                </td>
                                <td>
                                    <h4><%= customer.getFullName()%> <br> <span><%= dateFormat.format(customer.getCreatedAt())%></span></h4>
                                </td>
                            </tr>
                            <%
                                }
                            %>
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

                    function setActiveItem(activeItem) {
                        sidebarItems.forEach(item => {
                            item.classList.remove('active');
                        });
                        activeItem.classList.add('active');
                    }

                    // Add click event listeners to sidebar items
                    sidebarItems.forEach(item => {
                        item.addEventListener('click', function (event) {
                            // Only prevent default behavior for items with data-page attribute
                            if (this.getAttribute('data-page')) {
                                event.preventDefault();
                                setActiveItem(this);
                            }
                            // Allow default behavior for other links (e.g., href to addStaff.jsp)
                        });
                    });

                    // Set default active item
                    const defaultActiveItem = document.querySelector('.navigation ul li a[data-page="dashboard"]');
                    if (defaultActiveItem) {
                        setActiveItem(defaultActiveItem);
                    }
                });

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
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>