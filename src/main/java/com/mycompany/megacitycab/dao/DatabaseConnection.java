package com.mycompany.megacitycab.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/megacity_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    public static Connection getConnection() throws SQLException {
   System.out.println("Connecting to database...");
    Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
    System.out.println("Connected to database successfully!");
    return conn;    }
    
}

