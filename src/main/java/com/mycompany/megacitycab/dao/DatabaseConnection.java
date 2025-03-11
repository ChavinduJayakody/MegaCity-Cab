package com.mycompany.megacitycab.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/megacity_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection conn = null;

    // Private constructor to prevent instantiation
    private DatabaseConnection() {}

    static {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing database connection", e);
        }
    }

    public static Connection getConnection() {
        return conn;
    }
}