//package com.mvc.controller;
//
//
//import com.mvc.bean.RegisterBean; // Replace with your RegisterBean class
//import com.mvc.dao.UserProfileDao; // Replace with your DAO class
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//@WebServlet("/viewProfile")
//public class ViewProfileServlet extends HttpServlet {
//    private static final Logger LOGGER = Logger.getLogger(ViewProfileServlet.class.getName());
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession(false);
//        if (session != null && session.getAttribute("username") != null) {
//            String username = (String) session.getAttribute("username");
//            LOGGER.log(Level.INFO, "Username from session: {0}", username);
//
//            UserProfileDao userProfileDao = new UserProfileDao();
//            RegisterBean user = userProfileDao.getUserByUsername(username);
//
//            if (user == null) {
//                LOGGER.log(Level.INFO, "User found: {0}", user);
//                request.setAttribute("user", user);
//                request.getRequestDispatcher("/viewProfile.jsp").forward(request, response);
//            } else {
//                LOGGER.log(Level.WARNING, "User not found for username: {0}", username);
//                response.sendRedirect(request.getContextPath() + "/login.jsp");
//            }
//        } else {
//            LOGGER.log(Level.WARNING, "Invalid session or missing username");
//            response.sendRedirect(request.getContextPath() + "/login.jsp");
//        }
//    }
//}
