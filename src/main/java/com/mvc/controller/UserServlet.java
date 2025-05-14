/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.UserListDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class UserServlet extends HttpServlet {

    private UserListDAO userlistDAO;

    @Override
    public void init() {
        userlistDAO = new UserListDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        System.out.println("UserServlet ==> Action = " + action);

        try {
            switch (action) {
                case "/edit":
                    displayEditRegisterForm(request, response);
                    break;
                case "/update":
                    updateRegister(request, response);
                    break;
                case "/delete":
                    deleteRegister(request, response);
                    break;
                case "/list":
                    retrieveRegisters(request, response);
                    break;
                default:
                    retrieveRegisters(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void displayEditRegisterForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Editing user with ID: " + id);
        RegisterBean currentRegister = userlistDAO.selectUserById(id);
        System.out.println("Current user: " + currentRegister);

        request.setAttribute("register", currentRegister);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/register.jsp");
        dispatcher.forward(request, response);
    }

    private void retrieveRegisters(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<RegisterBean> listRegisters = userlistDAO.selectAllUsers();
        request.setAttribute("listRegisters", listRegisters);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/registerlistadmin.jsp");
        dispatcher.forward(request, response);
    }

    private void updateRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        RegisterBean register = new RegisterBean(id, username, name, phone_number, password, email);
        userlistDAO.updateUser(register);
        response.sendRedirect("list");
    }

    private void deleteRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int registerId = Integer.parseInt(request.getParameter("id"));
        userlistDAO.deleteUser(registerId);
        response.sendRedirect("registerlistadmin");
    }
}
