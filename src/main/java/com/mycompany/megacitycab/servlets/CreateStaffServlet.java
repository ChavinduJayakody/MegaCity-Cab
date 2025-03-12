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

@WebServlet("/create-staff")
public class CreateStaffServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Staff loggedInStaff = (Staff) session.getAttribute("staff");

        // Only admin can create staff accounts
        if (loggedInStaff == null || !"admin".equals(loggedInStaff.getRole())) {
            response.sendRedirect("staff-login.jsp?error=Unauthorized access");
            return;
        }

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Staff newStaff = new Staff();
        newStaff.setFullName(fullName);
        newStaff.setEmail(email);
        newStaff.setPassword(password);
        newStaff.setRole("staff"); // Default role is staff

        StaffDAO staffDAO = new StaffDAO();
        try {
            staffDAO.addStaff(newStaff);
            response.sendRedirect("admin-dashboard.jsp?success=Staff account created successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin-dashboard.jsp?error=Error creating staff account");
        }
    }
}