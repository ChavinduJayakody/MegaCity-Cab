/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.megacitycab.dao;

/**
 *
 * @author Chavindu Jayakody
 */
import com.mycompany.megacitycab.model.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    // Get driver by email
    public Driver getDriverByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM drivers WHERE email = ?";
        Driver driver = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setFullName(rs.getString("full_name"));
                driver.setEmail(rs.getString("email"));
                driver.setPhone(rs.getString("phone"));
                driver.setLicensePlate(rs.getString("license_plate"));
                driver.setVehicleModel(rs.getString("vehicle_model"));
                driver.setVehicleColor(rs.getString("vehicle_color"));
                driver.setVehicleImage(rs.getString("vehicle_image"));
                driver.setPassword(rs.getString("password"));
            }
        }
        return driver;
    }

    // add new driver
    public void addDriver(Driver driver) throws SQLException {
        String sql = "INSERT INTO drivers (full_name, email, phone, license_plate, vehicle_model, vehicle_color, vehicle_image, password) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, driver.getFullName());
            stmt.setString(2, driver.getEmail());
            stmt.setString(3, driver.getPhone());
            stmt.setString(4, driver.getLicensePlate());
            stmt.setString(5, driver.getVehicleModel());
            stmt.setString(6, driver.getVehicleColor());
            stmt.setString(7, driver.getVehicleImage());
            stmt.setString(8, driver.getPassword());
            stmt.executeUpdate();
        }
    }
    
//    check emails
    public boolean emailExists(String email) throws SQLException {
        String query = "SELECT COUNT(*) FROM drivers WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true; 
                }
            }
        }
        return false; 
    }
    
//    check vehicle
    public boolean licenseExists(String licensePlate) throws SQLException {
        String query = "SELECT COUNT(*) FROM drivers WHERE license_plate = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, licensePlate);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true; 
                }
            }
        }
        return false; 
    }
    
    public List<Driver> getAllDrivers() throws SQLException {
        String sql = "SELECT * FROM drivers ORDER BY driver_id";
        List<Driver> drivers = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setFullName(rs.getString("full_name"));
                driver.setEmail(rs.getString("email"));
                driver.setPhone(rs.getString("phone"));
                driver.setLicensePlate(rs.getString("license_plate"));
                driver.setVehicleModel(rs.getString("vehicle_model"));
                driver.setVehicleColor(rs.getString("vehicle_color"));
                driver.setVehicleImage(rs.getString("vehicle_image"));
                driver.setCreatedAt(rs.getTimestamp("created_at")); 
                drivers.add(driver);
            }
        }
        return drivers;
    }
    
    public int getDriverCount() throws SQLException {
    String sql = "SELECT COUNT(*) AS driver_count FROM drivers";
    int count = 0;
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            count = rs.getInt("driver_count");
        }
    }
    return count;
}
}


