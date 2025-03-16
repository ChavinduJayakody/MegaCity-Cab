<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- =============== Navigation ================ -->
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
                <a href="staffDashboard.jsp" id="dashboard" class="active">
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
                <a href="#" id="signoutBtn">
                    <span class="icon">
                        <ion-icon name="log-out-outline"></ion-icon>
                    </span>
                    <span class="title">Sign Out</span>
                </a>
            </li>
        </ul>
    </div>
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