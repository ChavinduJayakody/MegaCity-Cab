<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.megacitycab.dao.CustomerDAO"%>
<%@page import="com.mycompany.megacitycab.dao.DriverDAO"%>
<div class="cardBox">
    <div class="card">
        <div>
            <div class="numbers">
                <%
                    CustomerDAO customerDAO = new CustomerDAO();
                    int customerCount = customerDAO.getCustomerCount();
                %>
                <%= customerCount%>
            </div>
            <div class="cardName">Customers</div>
        </div>

        <div class="iconBx">
            <ion-icon name="people-outline"></ion-icon>
        </div>
    </div>

    <div class="card">
        <div>
            <div class="numbers">
                <%
                    DriverDAO driverDAO = new DriverDAO();
                    int driverCount = driverDAO.getDriverCount();
                %>
                <%= driverCount%>
            </div>
            <div class="cardName">Drivers</div>
        </div>

        <div class="iconBx">
            <ion-icon name="car-outline"></ion-icon>
        </div>
    </div>

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
            <div class="numbers">284</div>
            <div class="cardName">Comments</div>
        </div>

        <div class="iconBx">
            <ion-icon name="chatbubbles-outline"></ion-icon>
        </div>
    </div>
</div>