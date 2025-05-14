/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

import java.io.IOException;
import javax.servlet.*;

import jakarta.servlet.http.*;
import com.mvc.bean.laundrybooking;
import com.mvc.dao.LaundryBookingDAO;
import jakarta.servlet.annotation.WebServlet;
import java.sql.SQLException;

/**
 *
 * @author husna
 */
@WebServlet("/laundry")
public class LaundryBookingServlet extends HttpServlet {
    private LaundryBookingDAO bookingDAO;

    public void init() {
        bookingDAO = new LaundryBookingDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        doGet(request, response);
    }
   
    

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int bookingId =Integer.parseInt(request.getParameter("bookingId"));
        String serviceName = request.getParameter("serviceName");
        String timeSlot = request.getParameter("timeSlot");
        int machineId = Integer.parseInt(request.getParameter("machineId"));

        laundrybooking booking = new laundrybooking(bookingId,serviceName,timeSlot,machineId);
        booking.setServiceName(serviceName);
        booking.setTimeSlot(timeSlot);
        booking.setMachineId(machineId);

        try {
            bookingDAO.insertBooking(booking);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("booking-success.jsp");
    }
}

