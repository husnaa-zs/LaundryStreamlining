/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

import com.mvc.bean.Delivery;
import com.mvc.dao.DeliveryDAO;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/delivery")
public class DeliveryServlet extends HttpServlet {

    public DeliveryServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String deliveryName = request.getParameter("deliveryName");
        String deliveryService = request.getParameter("deliveryService");
        String deliveryKilo = request.getParameter("deliveryKilo");
        String deliveryTotalPrice = request.getParameter("deliveryTotalPrice");
        String address = request.getParameter("address");
        String notes = request.getParameter("notes");
        String deliveryFeeDisplay = request.getParameter("deliveryFeeDisplay"); // Retrieve delivery fee display
        String subtotal = request.getParameter("subtotal"); // Retrieve subtotal
        String totalWithTax = request.getParameter("totalWithTax"); // Retrieve total with tax

        // Create Delivery object
        Delivery delivery = new Delivery();
        delivery.setDeliveryName(deliveryName);
        delivery.setDeliveryService(deliveryService);
        delivery.setDeliveryKilo(deliveryKilo);
        delivery.setDeliveryTotalPrice(deliveryTotalPrice);
        delivery.setAddress(address);
        delivery.setNotes(notes);
        delivery.setDeliveryFeeDisplay(deliveryFeeDisplay); // Set delivery fee display
        delivery.setSubtotal(subtotal); // Set subtotal
        delivery.setTotalWithTax(totalWithTax); // Set total with tax

        // Call DAO to save delivery details
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        boolean success = deliveryDAO.insertDelivery(delivery);

        if (success) {
            // Redirect to success page
            response.sendRedirect("PaymentForm.jsp");
        } else {
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }

}
