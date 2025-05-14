/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author husna
 */
@WebServlet("/trackDelivery")
public class TrackDeliveryServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        String sql = "SELECT d.deliveryName, d.deliveryService, d.deliveryKilo, d.address, d.notes, d.totalWithTax, "
                + "p.outForPickup, p.arrivedAtYourHouse, p.enRouteToShop, p.arrivedToShop "
                + "FROM delivery d "
                + "LEFT JOIN phase p ON d.deliveryName = p.deliveryName";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword); PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            List<Delivery> deliveries = new ArrayList<>();
            while (resultSet.next()) {
                String deliveryName = resultSet.getString("deliveryName");
                String deliveryService = resultSet.getString("deliveryService");
                String deliveryKilo = resultSet.getString("deliveryKilo");
                String address = resultSet.getString("address");
                String notes = resultSet.getString("notes");
                String totalWithTax = resultSet.getString("totalWithTax");
                boolean outForPickup = resultSet.getBoolean("outForPickup");
                boolean arrivedAtYourHouse = resultSet.getBoolean("arrivedAtYourHouse");
                boolean enRouteToShop = resultSet.getBoolean("enRouteToShop");
                boolean arrivedToShop = resultSet.getBoolean("arrivedToShop");

                int status = 0;
                if (arrivedToShop) {
                    status = 3;
                } else if (enRouteToShop) {
                    status = 2;
                } else if (arrivedAtYourHouse) {
                    status = 1;
                } else if (outForPickup) {
                    status = 0;
                }

                Delivery delivery = new Delivery(deliveryName, deliveryService, deliveryKilo, address, notes, totalWithTax, status);
                deliveries.add(delivery);
            }

            request.setAttribute("deliveries", deliveries);
            RequestDispatcher dispatcher = request.getRequestDispatcher("tracking.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }

    // Define Delivery class
    public static class Delivery {

        private String deliveryName;
        private String deliveryService;
        private String deliveryKilo;
        private String address;
        private String notes;
        private String totalWithTax;
        private int status;

        public Delivery(String deliveryName, String deliveryService, String deliveryKilo, String address, String notes, String totalWithTax, int status) {
            this.deliveryName = deliveryName;
            this.deliveryService = deliveryService;
            this.deliveryKilo = deliveryKilo;
            this.address = address;
            this.notes = notes;
            this.totalWithTax = totalWithTax;
            this.status = status;
        }

        // Getters and setters
        public String getDeliveryName() {
            return deliveryName;
        }

        public String getDeliveryService() {
            return deliveryService;
        }

        public String getDeliveryKilo() {
            return deliveryKilo;
        }

        public String getAddress() {
            return address;
        }

        public String getNotes() {
            return notes;
        }

        public String getTotalWithTax() {
            return totalWithTax;
        }

        public int getStatus() {
            return status;
        }
    }
}
