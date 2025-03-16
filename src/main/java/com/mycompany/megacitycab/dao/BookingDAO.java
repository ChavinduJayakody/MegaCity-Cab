package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private static final String INSERT_BOOKING_SQL = "INSERT INTO bookings (pickup_location, dropoff_location, distance, ride_type, date_time, fare) VALUES (?, ?, ?, ?, ?, ?)";

    public void insertBooking(Booking booking) {
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_BOOKING_SQL)) {

            ps.setString(1, booking.getPickupLocation());
            ps.setString(2, booking.getDropoffLocation());
            ps.setDouble(3, booking.getDistance());
            ps.setString(4, booking.getRideType());
            ps.setString(5, booking.getDateTime());
            ps.setDouble(6, booking.getFare());

            int rowsInserted = ps.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error inserting booking into the database", e);
        }
    }
    
     private static final String SELECT_ALL_BOOKINGS_SQL = "SELECT * FROM bookings";

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_BOOKINGS_SQL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String pickupLocation = rs.getString("pickup_location");
                String dropoffLocation = rs.getString("dropoff_location");
                double distance = rs.getDouble("distance");
                String rideType = rs.getString("ride_type");
                String dateTime = rs.getString("date_time");
                double fare = rs.getDouble("fare");

                Booking booking = new Booking(pickupLocation, dropoffLocation, distance, rideType, dateTime, fare);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching bookings from the database", e);
        }
        return bookings;
    }
}