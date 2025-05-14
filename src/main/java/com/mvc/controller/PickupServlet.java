package com.mvc.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/pickup")
public class PickupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String service = request.getParameter("service");
        String kiloParam = request.getParameter("kilo");
        String totalPriceParam = request.getParameter("totalPrice");
        String totalWithTaxParam = request.getParameter("totalWithTax");
        
    
// Check if parameters are not null before parsing
        if (kiloParam != null && totalPriceParam != null && totalWithTaxParam != null) {
            int kilo = Integer.parseInt(kiloParam);
            double totalPrice = Double.parseDouble(totalPriceParam);
            double totalWithTax = Double.parseDouble(totalWithTaxParam);

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/dobi";
            String username = "root";
            String password = "";

            // Attempt to establish a database connection
            try (Connection conn = DriverManager.getConnection(url, "root", "")) {
                // If connection is successful, print a success message
                System.out.println("Database connection established successfully.");

                // Insert data into database
                String sql = "INSERT INTO pickup (name, service, kilo, totalPrice, totalWithTax) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, name);
                statement.setString(2, service);
                statement.setInt(3, kilo);
                statement.setDouble(4, totalPrice);
                statement.setDouble(5, totalWithTax);
                System.out.println(statement);
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    // Data inserted successfully, redirect to success page
                    response.sendRedirect("pickupSuccess.jsp");
                    return; // Stop further execution of the servlet
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

// Handle the case where parameters are null or insertion failed
// You can display an error message or redirect the user to an error page
        response.sendRedirect("error.jsp");
    }
}
