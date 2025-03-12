<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.megacitycab.dao.InquiryDAO"%>
<%@page import="com.mycompany.megacitycab.model.Inquiry"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Inquiries | MegaCity Cab </title>
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
                        <a href="adminDashboard.jsp">
                            <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                            <span class="title">Dashboard</span>
                        </a>
                    </li>

                    <li>
                        <a href="bookings.jsp">
                            <span class="icon"><ion-icon name="ticket-outline"></ion-icon></span>
                            <span class="title">Bookings</span>
                        </a>
                    </li>

                    <li>
                        <a href="customers.jsp">
                            <span class="icon"><ion-icon name="people-outline"></ion-icon></span>
                            <span class="title">Customers</span>
                        </a>
                    </li>

                    <li>
                        <a href="drivers.jsp">
                            <span class="icon"><ion-icon name="people-outline"></ion-icon></span>
                            <span class="title">Drivers</span>
                        </a>
                    </li>

                    <li>
                        <a href="inquiries.jsp" class="active">
                            <span class="icon"><ion-icon name="help-outline"></ion-icon></span>
                            <span class="title">Inquiries</span>
                        </a>
                    </li>

                    <li>
                        <a href="addStaff.jsp">
                            <span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
                            <span class="title">Add Staff</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" id="signoutBtn">
                            <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                            <span class="title">Sign Out</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- ========================= Main ==================== -->
            <div class="main">
                <%@include file="components/header.jsp" %>
                <%@include file="components/cards.jsp" %>

                <!-- ================ Inquiry Details ================= -->
                <div class="details1 details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Customer Inquiries</h2>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Name</td>
                                    <td>Email</td>
                                    <td>Phone</td>
                                    <td>Message</td>
                                    <td>Submitted At</td>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    InquiryDAO inquiryDAO = new InquiryDAO();
                                    List<Inquiry> inquiries = inquiryDAO.getAllInquiries();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, HH:mm");
                                    for (Inquiry inquiry : inquiries) {
                                %>
                                <tr>
                                    <td><%= inquiry.getId()%></td>
                                    <td><%= inquiry.getFullName()%></td>
                                    <td><%= inquiry.getEmail()%></td>
                                    <td><%= inquiry.getPhone() != null ? inquiry.getPhone() : "N/A"%></td>
                                    <td><%= inquiry.getMessage()%></td>
                                    <td><%= dateFormat.format(inquiry.getCreatedAt())%></td>
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

        <!-- ====== ionicons ======= -->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>