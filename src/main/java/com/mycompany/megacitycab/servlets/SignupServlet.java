/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.megacitycab.servlets;

/**
 *
 * @author Chavindu Jayakody
 */
import com.mycompany.megacitycab.dao.CustomerDAO;
import com.mycompany.megacitycab.model.Customer;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        if (!password.equals(rePassword)) {
            response.sendRedirect("login.jsp?error=Passwords do not match");
            return;
        }

        Customer customer = new Customer();
        customer.setFullName(fullName);
        customer.setEmail(email);
        customer.setNic(nic);
        customer.setPhone(phone);
        customer.setPassword(password);

        CustomerDAO customerDAO = new CustomerDAO();
        try {
            customerDAO.addCustomer(customer);
            response.sendRedirect("login.jsp?success=Registration successful! Please login.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Database error in SignupServlet: " + e.getMessage()); // Error message
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}
