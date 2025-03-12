package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.model.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StaffDAO {
    // Get staff by email
    public Staff getStaffByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM staff WHERE email = ?";
        Staff staff = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setFullName(rs.getString("full_name"));
                staff.setEmail(rs.getString("email"));
                staff.setPassword(rs.getString("password"));
                staff.setRole(rs.getString("role"));
            }
        }
        return staff;
    }

    // Add a new staff member
    public void addStaff(Staff staff) throws SQLException {
        String sql = "INSERT INTO staff (full_name, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staff.getFullName());
            stmt.setString(2, staff.getEmail());
            stmt.setString(3, hashPassword(staff.getPassword())); // Hash password
            stmt.setString(4, staff.getRole());
            stmt.executeUpdate();
        }
    }

    // Hash password 
    public String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Failed to hash password", e);
        }
    }
}