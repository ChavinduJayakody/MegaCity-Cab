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

@WebServlet("/add-admin")
public class AddAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (!role.equals("admin") && !role.equals("staff")) {
            response.sendRedirect("dashboards/admin/addStaff.jsp?status=error&message=Invalid role specified");
            return;
        }

        Staff staff = new Staff();
        staff.setFullName(fullName);
        staff.setEmail(email);
        staff.setPassword(password);
        staff.setRole(role);

        StaffDAO staffDAO = new StaffDAO();
        try {
            staffDAO.addStaff(staff);
            response.sendRedirect("dashboards/admin/addStaff.jsp?status=success&message=" + role + " added successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dashboards/admin/addStaff.jsp?status=error&message=" + e.getMessage());
        }
    }
}