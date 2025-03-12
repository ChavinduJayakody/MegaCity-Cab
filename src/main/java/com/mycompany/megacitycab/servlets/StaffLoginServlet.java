package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.StaffDAO;
import com.mycompany.megacitycab.model.Staff;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/staff-login")
public class StaffLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("loginEmail");
        String password = request.getParameter("loginPassword");

        StaffDAO staffDAO = new StaffDAO();
        try {
            Staff staff = staffDAO.getStaffByEmail(email);
            if (staff != null && staffDAO.hashPassword(password).equals(staff.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("staff", staff);

                // Redirect based on role
                if ("admin".equals(staff.getRole())) {
                    response.sendRedirect("dashboards/admin/adminDashboard.jsp");
                } else {
                    response.sendRedirect("dashboards/staff/staffDashboard.jsp");
                }
            } else {
                response.sendRedirect("staffLogin.jsp?error=Invalid email or password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Database error: " + e.getMessage());
            response.sendRedirect("staffLogin.jsp?error=Database error");
        }
    }
}