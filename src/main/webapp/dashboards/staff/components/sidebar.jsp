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
                <a href="#" data-page="dashboard">
                    <span class="icon">
                        <ion-icon name="home-outline"></ion-icon>
                    </span>
                    <span class="title">Dashboard</span>
                </a>
            </li>

            <li>
                <a href="#" data-page="customers">
                    <span class="icon">
                        <ion-icon name="people-outline"></ion-icon>
                    </span>
                    <span class="title">Customers</span>
                </a>
            </li>

            <li>
                <a href="#" data-page="messages">
                    <span class="icon">
                        <ion-icon name="chatbubble-outline"></ion-icon>
                    </span>
                    <span class="title">Messages</span>
                </a>
            </li>

            <li>
                <a href="#" data-page="help">
                    <span class="icon">
                        <ion-icon name="help-outline"></ion-icon>
                    </span>
                    <span class="title">Help</span>
                </a>
            </li>

            <li>
                <a href="#" data-page="settings">
                    <span class="icon">
                        <ion-icon name="settings-outline"></ion-icon>
                    </span>
                    <span class="title">Settings</span>
                </a>
            </li>

            <li>
                <a href="#" data-page="messages">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                    <span class="title">Add Staff</span>
                </a>
            </li>

            <li>
                <a href="components/signout.jsp" id="signoutBtn">
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