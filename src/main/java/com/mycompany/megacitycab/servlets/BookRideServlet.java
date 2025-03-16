package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.model.Booking;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookride")
public class BookRideServlet extends HttpServlet {
    private static final double BASE_FARE_STANDARD = 500.00;
    private static final double BASE_FARE_LUXURY = 800.00;
    private static final double BASE_FARE_SUV = 1000.00;
    private static final double PER_KM_RATE = 100.00;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form data
            String pickupLocation = request.getParameter("pickup");
            String dropoffLocation = request.getParameter("dropoff");
            double distance = Double.parseDouble(request.getParameter("distance"));
            String rideType = request.getParameter("ride-type");
            String dateTime = request.getParameter("date-time");

            // Validate form data
            if (pickupLocation == null || dropoffLocation == null || rideType == null || dateTime == null) {
                throw new IllegalArgumentException("Missing form data");
            }

            // Calculate fare based on ride type
            double baseFare;
            switch (rideType) {
                case "luxury":
                    baseFare = BASE_FARE_LUXURY;
                    break;
                case "suv":
                    baseFare = BASE_FARE_SUV;
                    break;
                default:
                    baseFare = BASE_FARE_STANDARD;
                    break;
            }
            double fare = baseFare + (distance * PER_KM_RATE);

            // Create a Booking object
            Booking booking = new Booking(pickupLocation, dropoffLocation, distance, rideType, dateTime, fare);

            // Insert booking into the database
            BookingDAO bookingDAO = new BookingDAO();
            bookingDAO.insertBooking(booking);

            // Return "success" response
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("success");
        } catch (Exception e) {
            // Return "error" response
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("error");
        }
    }
}