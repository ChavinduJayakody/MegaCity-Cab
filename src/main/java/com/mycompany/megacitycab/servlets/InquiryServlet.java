/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.InquiryDAO;
import com.mycompany.megacitycab.model.Inquiry;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chavindu Jayakody
 */


@WebServlet("/submit-inquiry")
public class InquiryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // Validate input fields
        if (fullName == null || fullName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {

            response.sendRedirect("about.jsp?error=All fields are required.");
            return;
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            response.sendRedirect("about.jsp?error=Invalid email format.");
            return;
        }


        // Create Inquiry object
        Inquiry inquiry = new Inquiry();
        inquiry.setFullName(fullName);
        inquiry.setEmail(email);
        inquiry.setPhone(phone);
        inquiry.setMessage(message);

        InquiryDAO inquiryDAO = new InquiryDAO();
        try {
            inquiryDAO.addInquiry(inquiry);
            response.sendRedirect("about.jsp?success=true"); // Success message
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("about.jsp?error=Database error. Try again later.");
        }
    }
}