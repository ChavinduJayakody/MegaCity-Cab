/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.megacitycab.dao;

/**
 *
 * @author Chavindu Jayakody
 */
import com.mycompany.megacitycab.model.Inquiry;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class InquiryDAO {

    // Add a new inquiry
public void addInquiry(Inquiry inquiry) throws SQLException {
    String sql = "INSERT INTO inquiries (full_name, email, phone, message, created_at) VALUES (?, ?, ?, ?, NOW())";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, inquiry.getFullName());
        stmt.setString(2, inquiry.getEmail());
        stmt.setString(3, inquiry.getPhone());
        stmt.setString(4, inquiry.getMessage());
        stmt.executeUpdate();
    }
}

    // Fetch all inquiries
    public List<Inquiry> getAllInquiries() {
        List<Inquiry> inquiries = new ArrayList<>();
        String sql = "SELECT * FROM inquiries ORDER BY created_at DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Inquiry inquiry = new Inquiry();
                inquiry.setId(rs.getInt("id"));
                inquiry.setFullName(rs.getString("full_name"));
                inquiry.setEmail(rs.getString("email"));
                inquiry.setPhone(rs.getString("phone"));
                inquiry.setMessage(rs.getString("message"));
                inquiry.setCreatedAt(rs.getTimestamp("created_at"));
                inquiries.add(inquiry);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inquiries;
    }
}