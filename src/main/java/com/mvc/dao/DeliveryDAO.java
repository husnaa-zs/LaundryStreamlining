/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.IOException;
import java.net.URLEncoder;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;

import com.mvc.bean.Delivery;
import java.sql.DriverManager;

public class DeliveryDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
    private String username = "root";
    private String password = "";

    public DeliveryDAO() {
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

    public boolean insertDelivery(Delivery delivery) {
        boolean success = false;

        try (Connection connection = getConnection()) {
            String insertQuery = "INSERT INTO delivery (deliveryName, deliveryService, deliveryKilo, deliveryTotalPrice, address, notes, deliveryFeeDisplay, subtotal, totalWithTax)"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, delivery.getDeliveryName());
                preparedStatement.setString(2, delivery.getDeliveryService());
                preparedStatement.setString(3, delivery.getDeliveryKilo());
                preparedStatement.setString(4, delivery.getDeliveryTotalPrice());
                preparedStatement.setString(5, delivery.getAddress());
                preparedStatement.setString(6, delivery.getNotes());
                preparedStatement.setString(7, delivery.getDeliveryFeeDisplay());
                preparedStatement.setString(8, delivery.getSubtotal());
                preparedStatement.setString(9, delivery.getTotalWithTax());

                int rowsAffected = preparedStatement.executeUpdate();
                success = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }
}
