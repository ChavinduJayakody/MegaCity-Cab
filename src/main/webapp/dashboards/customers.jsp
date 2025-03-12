<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Add Staff | MegaCity Cab </title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="admin/adminDashboard.css">
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
                        <a href="adminDashboard.jsp" id="dashboard">
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
                        <a href="inquiries.jsp" id="inquiries">
                            <span class="icon">
                                <ion-icon name="help-outline"></ion-icon>
                            </span>
                            <span class="title">Inquiries</span>
                        </a>
                    </li>

                    <li>
                        <a href="settings.jsp" id="settings">
                            <span class="icon">
                                <ion-icon name="settings-outline"></ion-icon>
                            </span>
                            <span class="title">Settings</span>
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
                <%@include file="admin/components/header.jsp" %>

                <%@include file="admin/components/cards.jsp" %>

                <!-- ================ Add Staff Form ================= -->
                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Add New Staff</h2>
                        </div>

                        <form action="${pageContext.request.contextPath}/add-admin" method="POST" class="form">
                            <div class="form-group">
                                <label for="fullname">Full Name:</label>
                                <input type="text" id="name" name="fullname" placeholder="Full name" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" placeholder="Email" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" placeholder="Password" required>
                            </div>

                            <div class="form-group">
                                <label for="role">Role:</label>
                                <select id="role" name="role" required>
                                    <option value="staff">Staff</option>
                                    <option value="admin">Admin</option>
                                </select>
                            </div>

                            <button type="submit" class="btn">Add User</button>
                        </form>
                    </div>

                            <!-- ================= Recently Customers Staff ================ -->
                            <div class="recentCustomers">

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
                document.addEventListener("DOMContentLoaded", function () {
                    const urlParams = new URLSearchParams(window.location.search);
                    const status = urlParams.get("status");
                    const message = urlParams.get("message");

                    if (status === "success") {
                        Swal.fire({
                            title: "Success!",
                            text: message,
                            icon: "success",
                            toast: true,
                            position: "top-right",
                            showConfirmButton: false,
                            timer: 3000
                        });
                    } else if (status === "error") {
                        Swal.fire({
                            title: "Error!",
                            text: message,
                            icon: "error",
                            toast: true,
                            position: "top-right",
                            showConfirmButton: false,
                            timer: 3000
                        });
                    }
                });
            </script>

            <!-- ====== ionicons ======= -->
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>