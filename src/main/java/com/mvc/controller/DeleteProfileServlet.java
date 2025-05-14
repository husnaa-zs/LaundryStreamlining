///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.mvc.controller;
//import com.mvc.bean.RegisterBean; // Replace with your RegisterBean class
//import com.mvc.dao.UserProfileDao; 
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet("/deleteRegister")
//public class DeleteProfileServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("user") == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//  // Retrieve user details from DAO
//            UserProfileDao userProfileDao = new UserProfileDao();
//            RegisterBean user = userProfileDao.getUserByUsername(username);
//        User currentUser = (User) session.getAttribute("user");
//        int userId = Integer.parseInt(request.getParameter("id"));
//
//        if (currentUser.getId() != userId) {
//            response.sendRedirect("unauthorized.jsp");
//            return;
//        }
//
//        // Proceed with deleting profile
//    }
//}
