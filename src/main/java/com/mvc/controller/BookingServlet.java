/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mvc.bean.BookingBean;
import com.mvc.dao.BookingDAO;
import com.mvc.util.DBConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String StartTime = request.getParameter("StartTime");
        String StartMinute = request.getParameter("StartMinute");
        String EndTime = request.getParameter("EndTime");
        String EndMinute = request.getParameter("EndMinute");
        String service = request.getParameter("service");
        String delivery = request.getParameter("delivery");
        String kilo = request.getParameter("kilo");

        // Create a BookingBean instance
        BookingBean booking = new BookingBean();
        booking.setName(name);
        booking.setEmail(email);
        booking.setPhone(phone);
        booking.setDate(date);
        booking.setStarttime(StartTime);
        booking.setStartminute(StartMinute);
        booking.setEndtime(EndTime);
        booking.setEndminute(EndMinute);
        booking.setService(service);
        booking.setDelivery(delivery);
        booking.setKilo(kilo);
        BookingDAO bookingDAO = new BookingDAO();
        // Get a database connection (you need to implement this)
        // BookingBean book = new BookingBean(name, email, phone, date, StartTime, StartMinute, EndTime, EndMinute, service, delivery);
        boolean bookingSuccessful = bookingDAO.insertBooking(booking);

        if (bookingSuccessful) {
            request.setAttribute("booking", booking);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Bookingdetails.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
