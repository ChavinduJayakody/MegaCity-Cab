package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingDAO {
    public void addBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO bookings (customer_id, driver_id, pickup_location, dropoff_location, ride_type, date_time, status, fare, distance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, booking.getCustomerId());
            stmt.setObject(2, booking.getDriverId()); // Can be null
            stmt.setString(3, booking.getPickupLocation());
            stmt.setString(4, booking.getDropoffLocation());
            stmt.setString(5, booking.getRideType());
            stmt.setTimestamp(6, booking.getDateTime());
            stmt.setString(7, booking.getStatus());
            stmt.setDouble(8, booking.getFare());
            stmt.setDouble(9, booking.getDistance());
            stmt.executeUpdate();
        }
    }
}