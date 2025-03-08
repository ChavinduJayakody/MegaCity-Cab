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
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("loginEmail");
        String password = request.getParameter("loginPassword");

        CustomerDAO customerDAO = new CustomerDAO();
        try {
            Customer customer = customerDAO.getCustomerByEmail(email);
            if (customer != null && customer.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("customer", customer);
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("login.jsp?error=Invalid email or password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Database error in LoginServlet: " + e.getMessage()); // Error message
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}
