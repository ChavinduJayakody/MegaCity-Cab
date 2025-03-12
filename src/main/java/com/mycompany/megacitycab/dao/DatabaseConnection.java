package com.mycompany.megacitycab.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/megacity_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection conn = null;

    private DatabaseConnection() {}

    static {
        initializeConnection();
    }

    // db connection
    private static void initializeConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Create the connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing database connection", e);
        }
    }

    // Get the database connection
    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                System.out.println("Reconnecting to the database...");
                initializeConnection(); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error checking database connection", e);
        }
        return conn;
    }

    // Close db connection
    public static void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Error closing database connection", e);
            }
        }
    }
}