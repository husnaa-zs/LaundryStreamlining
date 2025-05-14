package com.mvc.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mvc.bean.Book;
import com.mvc.dao.BookDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.stream.Collectors;

public class BookServlet extends HttpServlet {

 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String requestBody = request.getReader().lines().collect(Collectors.joining());
    Gson gson = new GsonBuilder()
          .setDateFormat("yyyy-MM-dd")
          .create();

    Book book = gson.fromJson(requestBody, Book.class);
    System.out.println("Received date string: " + book.getDateString());
    try {
        String dateString = book.getDateString();
        if (dateString != null && !dateString.isEmpty()) {
            System.out.println("Date string: " + dateString);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(dateString);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            book.setDate(sqlDate);
        } else {
            book.setDate(new java.sql.Date(System.currentTimeMillis()));
             System.out.println("Defaulting to current date: " + book.getDate());
        }
    } catch (ParseException e) {
        e.printStackTrace();
    }

    BookDao bookDao = new BookDao();
    boolean isBooked = bookDao.book(book);

    if (isBooked) {
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write("{\"success\": true, \"message\": \"Booking successful\"}");
    } else {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("{\"success\": false, \"message\": \"Booking failed\"}");
    }
}
}