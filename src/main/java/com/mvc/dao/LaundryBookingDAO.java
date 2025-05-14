/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;

/**
 *
 * @author husna
 */

import com.mvc.bean.laundrybooking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LaundryBookingDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
    private String jdbcUsername = "yourusername";
    private String jdbcPassword = "yourpassword";
    private Connection jdbcConnection;

    public void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    public void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public boolean insertBooking(laundrybooking booking) throws SQLException {
        String sql = "INSERT INTO t_book (serviceName, timeSlot, machineId) VALUES (?, ?, ?)";
        connect();
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, booking.getServiceName());
        statement.setString(2, booking.getTimeSlot());
        statement.setInt(3, booking.getMachineId());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    // Other CRUD methods (update, delete, get) as needed
}

