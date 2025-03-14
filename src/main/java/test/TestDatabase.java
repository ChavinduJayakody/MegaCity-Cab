package test;

import com.mycompany.megacitycab.dao.DatabaseConnection;
import com.mycompany.megacitycab.dao.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestDatabase {
    public static void main(String[] args) {
        String sql = "INSERT INTO bookings (customer_id, driver_id, pickup_location, dropoff_location, ride_type, date_time, status, fare, distance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, 3); // customer_id
            stmt.setObject(2, null); // driver_id
            stmt.setString(3, "123 Main St"); // pickup_location
            stmt.setString(4, "456 Elm St"); // dropoff_location
            stmt.setString(5, "standard"); // ride_type
            stmt.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis())); // date_time
            stmt.setString(7, "Pending"); // status
            stmt.setDouble(8, 500.00); // fare
            stmt.setDouble(9, 10.00); // distance

            int rowsInserted = stmt.executeUpdate();
            System.out.println("Rows inserted: " + rowsInserted);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}