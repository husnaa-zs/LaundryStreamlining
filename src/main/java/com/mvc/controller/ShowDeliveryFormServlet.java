///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.mvc.controller;
//import jakarta.servlet.annotation.WebServlet;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
///**
// *
// * @author husna
// */
//@WebServlet("/ShowDeliveryForm")
//public class ShowDeliveryFormServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String deliveryId = request.getParameter("deliveryId");
//
//        // JDBC connection details
//        String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
//        String jdbcUsername = "root";
//        String jdbcPassword = "";
//
//        String selectSQL = "SELECT deliveryName, deliveryService, deliveryKilo, address, notes, totalWithTax FROM delivery WHERE id = ?";
//
//        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//             PreparedStatement preparedStatement = connection.prepareStatement(selectSQL)) {
//
//            preparedStatement.setString(1, deliveryId);
//            ResultSet resultSet = preparedStatement.executeQuery();
//
//            if (resultSet.next()) {
//                request.setAttribute("deliveryId", deliveryId);
//                request.setAttribute("name", resultSet.getString("deliveryName"));
//                request.setAttribute("services", resultSet.getString("deliveryService"));
//                request.setAttribute("kilo", resultSet.getString("deliveryKilo"));
//                request.setAttribute("address", resultSet.getString("address"));
//                request.setAttribute("notes", resultSet.getString("notes"));
//                request.setAttribute("totalWithTax", resultSet.getString("totalWithTax"));
//            }
//
//            // Forward to the JSP/HTML form
//            request.getRequestDispatcher("/deliveryForm.jsp").forward(request, response);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("errorPage.jsp");
//        }
//    }
//}