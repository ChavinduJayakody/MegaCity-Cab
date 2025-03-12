/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.DriverDAO;
import com.mycompany.megacitycab.model.Driver;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chavindu Jayakody
 */


@WebServlet("/driver-login")
public class DriverLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("loginEmail");
        String password = request.getParameter("loginPassword");

        DriverDAO driverDAO = new DriverDAO();
        try {
            Driver driver = driverDAO.getDriverByEmail(email);
            if (driver != null && driver.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("driver", driver);
                response.sendRedirect("dashboards/drivers/driverDashboard.jsp");
            } else {
                response.sendRedirect("driverLogin.jsp?error=Invalid email or password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("driverLogin.jsp?error=Database error");
        }
    }
}