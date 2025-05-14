/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    public RegisterServlet() {
        // default constructor
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Copying all the input parameters into local variables
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        RegisterBean registerBean = new RegisterBean(username, name, phone_number, password, email);

        registerBean.setUsername(username);
        registerBean.setName(name);
        registerBean.setPhone_number(phone_number);
        registerBean.setPassword(password);
        registerBean.setEmail(email);

        RegisterDao registerDao = new RegisterDao();

        // The core Logic of the Registration application is present here.
        // We are going to insert user data into the database.
        // The core Logic of the Registration application is present here.
// We are going to insert user data into the database.
        String registrationResult = registerDao.registerUser(registerBean);

        System.out.println("Registration Result: " + registrationResult);  // Add this line for debugging

        if ("SUCCESS".equals(registrationResult)) {
            // Pass parameters to the booking.jsp
            request.setAttribute("name",name);
            request.setAttribute("phone_number",phone_number);
            request.setAttribute("email",email);
            // On success, you can display a message to the user on the Login page
            System.out.println("Redirecting to login.jsp");  // Add this line for debugging
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            // On Failure, display a meaningful message to the User.
            System.out.println("Redirecting to error.jsp");  // Add this line for debugging
            request.setAttribute("errMessage", registrationResult);
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
