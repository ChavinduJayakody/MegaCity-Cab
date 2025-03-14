package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.model.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bookRide")
public class BookRideServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        if (customerId == null) {
            out.print("error:You must be logged in to system.");
        } else {
            // Retrieve and validate form data
            String pickupLocation = request.getParameter("pickup");
            String dropoffLocation = request.getParameter("dropoff");
            String rideType = request.getParameter("ride-type");
            String dateTimeStr = request.getParameter("date-time");
            String totalFareStr = request.getParameter("fare");
            String distanceStr = request.getParameter("distance");

            if (pickupLocation == null || dropoffLocation == null || rideType == null || dateTimeStr == null || totalFareStr == null || distanceStr == null) {
                out.print("error:All fields are required.");
                return;
            }

            try {
                // Parse fare and distance
                double fare = Double.parseDouble(totalFareStr);
                double distance = Double.parseDouble(distanceStr);

                // Parse date-time
                Timestamp dateTime = Timestamp.valueOf(dateTimeStr + ":00");

                // Create a Booking object
                Booking booking = new Booking();
                booking.setCustomerId(customerId);
                booking.setDriverId(null); // Driver ID is null initially
                booking.setPickupLocation(pickupLocation);
                booking.setDropoffLocation(dropoffLocation);
                booking.setRideType(rideType);
                booking.setDateTime(dateTime);
                booking.setStatus("Pending"); // Default status
                booking.setFare(fare);
                booking.setDistance(distance);

                // Insert the booking into the database
                BookingDAO bookingDAO = new BookingDAO();
                bookingDAO.addBooking(booking);
                out.print("success:🚖 Ride Confirmed!\n\nPickup: " + pickupLocation + "\nDrop-off: " + dropoffLocation + "\nRide Type: " + rideType + "\nDate & Time: " + dateTimeStr);
            } catch (SQLException e) {
                e.printStackTrace();
                out.print("error:Database error. Please try again.");
            } catch (NumberFormatException e) {
                e.printStackTrace();
                out.print("error:Invalid fare or distance format.");
            }catch (IllegalArgumentException e) {
                e.printStackTrace();
                out.print("error:Invalid date-time format.");
            }
        }
        out.flush();
    }
}