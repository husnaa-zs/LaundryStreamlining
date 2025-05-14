/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.IOException;
import java.net.URLEncoder;
import jakarta.servlet.http.HttpServletResponse;

import com.mvc.bean.BookingBean;
import java.sql.DriverManager;

public class BookingDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
    private String username = "root";
    private String password = "";

    public BookingDAO() {
    }

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public boolean insertBooking(BookingBean booking) {
        boolean success = false;

        try (Connection connection = getConnection()) {
            String insertQuery = "INSERT INTO booking (name, email, phone, date, StartTime, StartMinute, EndTime, EndMinute, service, delivery,kilo) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, booking.getName());
                preparedStatement.setString(2, booking.getEmail());
                preparedStatement.setString(3, booking.getPhone());
                preparedStatement.setString(4, booking.getDate());
                preparedStatement.setString(5, booking.getStarttime());
                preparedStatement.setString(6, booking.getStartminute());
                preparedStatement.setString(7, booking.getEndtime());
                preparedStatement.setString(8, booking.getEndminute());
                preparedStatement.setString(9, booking.getService());
                preparedStatement.setString(10, booking.getDelivery());
                preparedStatement.setString(11,booking.getKilo());

                int rowsAffected = preparedStatement.executeUpdate();
                success = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }
}