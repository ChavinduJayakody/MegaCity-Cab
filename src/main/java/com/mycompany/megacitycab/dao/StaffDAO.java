package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.model.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

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
                staff.setCreatedAt(rs.getTimestamp("created_at"));
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
            stmt.setString(3, hashPassword(staff.getPassword())); 
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

    // Fetch recently added staff
    public List<Staff> getRecentlyAddedStaff() throws SQLException {
        String sql = "SELECT * FROM staff WHERE role = 'staff' ORDER BY created_at DESC LIMIT 5";  
        List<Staff> staffList = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setFullName(rs.getString("full_name"));
                staff.setEmail(rs.getString("email"));
                staff.setRole(rs.getString("role"));
                staff.setCreatedAt(rs.getTimestamp("created_at")); 
                staffList.add(staff);
            }
        }
        return staffList;
    }
}