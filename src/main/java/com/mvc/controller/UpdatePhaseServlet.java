package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePhaseServlet")
public class UpdatePhaseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        String insertSQL = "INSERT INTO phase (deliveryName, deliveryService, deliveryKilo, address, notes, totalWithTax, outForPickup, arrivedAtYourHouse, enRouteToShop, arrivedToShop) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) "
                + "ON DUPLICATE KEY UPDATE "
                + "deliveryService = VALUES(deliveryService), "
                + "deliveryKilo = VALUES(deliveryKilo), "
                + "address = VALUES(address), "
                + "notes = VALUES(notes), "
                + "totalWithTax = VALUES(totalWithTax), "
                + "outForPickup = VALUES(outForPickup), "
                + "arrivedAtYourHouse = VALUES(arrivedAtYourHouse), "
                + "enRouteToShop = VALUES(enRouteToShop), "
                + "arrivedToShop = VALUES(arrivedToShop)";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            Enumeration<String> paramNames = request.getParameterNames();

            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                if (paramName.startsWith("deliveryName_")) {
                    String deliveryName = request.getParameter(paramName);
                    String deliveryService = request.getParameter("deliveryService_" + deliveryName);
                    String deliveryKilo = request.getParameter("deliveryKilo_" + deliveryName);
                    String address = request.getParameter("address_" + deliveryName);
                    String notes = request.getParameter("notes_" + deliveryName);
                    String totalWithTax = request.getParameter("totalWithTax_" + deliveryName);

                    boolean outForPickup = request.getParameter("out_for_pickup_" + deliveryName) != null;
                    boolean arrivedAtHouse = request.getParameter("arrived_at_house_" + deliveryName) != null;
                    boolean enRouteToShop = request.getParameter("en_route_to_shop_" + deliveryName) != null;
                    boolean arrivedToShop = request.getParameter("arrived_to_shop_" + deliveryName) != null;

                    try (PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
                        preparedStatement.setString(1, deliveryName);
                        preparedStatement.setString(2, deliveryService);
                        preparedStatement.setString(3, deliveryKilo);
                        preparedStatement.setString(4, address);
                        preparedStatement.setString(5, notes);
                        preparedStatement.setString(6, totalWithTax);
                        preparedStatement.setBoolean(7, outForPickup);
                        preparedStatement.setBoolean(8, arrivedAtHouse);
                        preparedStatement.setBoolean(9, enRouteToShop);
                        preparedStatement.setBoolean(10, arrivedToShop);

                        preparedStatement.executeUpdate();
                    }
                }
            }

            response.sendRedirect("successPage.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
