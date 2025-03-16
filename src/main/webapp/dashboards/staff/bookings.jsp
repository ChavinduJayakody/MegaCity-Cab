<%--
    Document   : booking
    Created on : Mar 14, 2025, 11:19:47 PM
    Author     : Chavindu Jayakody
--%>

<%--
    Document   : driverDashboard
    Created on : Mar 11, 2025, 2:05:31 AM
    Author     : Chavindu Jayakody
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.megacitycab.dao.BookingDAO" %>
<%@page import="com.mycompany.megacitycab.model.Booking" %>
<%@page import="java.util.List" %>

<%
    // Fetch data from the database
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getAllBookings();
%><!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Driver Dashboard | MegaCity Cab </title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="staffDashboard.css">
    </head>

    <body>
        <%@include file="components/sidebar.jsp" %>

        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user">
                    <img src="assets/imgs/customer01.jpg" alt="">
                </div>
            </div>

            <!-- ======================= Cards ================== -->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">1,504</div>
                        <div class="cardName">Daily Views</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="eye-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">80</div>
                        <div class="cardName">Sales</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="cart-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">284</div>
                        <div class="cardName">Comments</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">$7,842</div>
                        <div class="cardName">Earning</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="cash-outline"></ion-icon>
                    </div>
                </div>
            </div>

            <!-- ================ Order Details List ================= -->
            <div class="details1 details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Bookings</h2>
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
                            <%
                                // Iterate over the list of bookings
                                for (Booking booking : bookings) {
                            %>
                            <tr>
                                <td><%= booking.getPickupLocation()%></td>
                                <td><%= booking.getDropoffLocation()%></td>
                                <td>Customer Name Placeholder</td> <!-- Replace with actual customer name if available -->
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
            const defaultActiveItem = document.querySelector('.navigation ul li a[data-page="dashboard"]');
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

    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>
