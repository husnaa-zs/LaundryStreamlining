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
import com.mvc.bean.Login;
import com.mvc.dao.LoginDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
 
public class LoginServlet extends HttpServlet {
        public LoginServlet(){ // default constructor
 }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Here username and password are the names which I have given in the input box in Login.jsp page. Here I am retrieving the values entered by the user and keeping in instance variables for further use.

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Login login = new Login(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
        login.setUsername(username); //setting the username and password through the loginBean object then only you can get it in future.
        login.setPassword(password);
        
        LoginDao loginDao = new LoginDao();//sini main logic dia
        Login login2=new Login(username,password);//creating object for LoginDao. This class contains main logic of the application.
        //to be passed to the LoginDao class.

        String userValidate = loginDao.authenticateUser(login2); //Calling authenticateUser function

         if (userValidate.equals("SUCCESS")) {
            // If authentication is successful, create a session and store user information
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("userId", loginDao.getUserIdByUsername(username)); // Assuming you have a method to get the user ID by username
            
            // Forward to the success page
            request.setAttribute("username", username);
            request.getRequestDispatcher("/regSuccess.jsp").forward(request, response);
        } else {
            // If authentication fails, forward back to the login page with an error message
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}