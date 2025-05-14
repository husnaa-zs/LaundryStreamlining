/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.Feedback;
import com.mvc.dao.FeedbackDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author husna
 */
@WebServlet("/feedback")
public class FeedbackServlet extends jakarta.servlet.http.HttpServlet {

    private FeedbackDAO feedbackDAO;

    public void init() {
        feedbackDAO = new FeedbackDAO();
    }

    @Override
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {

        String action = request.getParameter("action");

        System.out.println("FeedbackServlet ==> Action = " + action);

        try {
            switch (action) {
                case "new":
                    displayNewFeedbackForm(request, response);
                    break;
                case "edit":
                    displayEditFeedbackForm(request, response);
                    break;
                case "insert":
                    createFeedback(request, response);
                    break;
                case "update":
                    updateFeedback(request, response);
                    break;
                case "delete":
                    deleteFeedback(request, response);
                    break;
                default:
                    retrieveFeedback(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new jakarta.servlet.ServletException(ex);
        }
    }

    private void displayNewFeedbackForm(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/feedback.jsp");
        dispatcher.forward(request, response);

    }

    private void displayEditFeedbackForm(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        Feedback currentfeedback = feedbackDAO.selectFeedbackbyID(id);
        request.setAttribute("feedback", currentfeedback);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/feedback.jsp");
        dispatcher.forward(request, response);
    }

    private void createFeedback(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException, SQLException {

        System.out.println("createFeedback method called");

        String message = request.getParameter("message");
        System.out.println("Message from form: " + message);

        if (message != null && !message.trim().isEmpty()) {
            Feedback feedback = new Feedback(message);
            feedbackDAO.insertFeedback(feedback);
            System.out.println("Feedback inserted into the database");

            response.sendRedirect("feedback?action=list");
            System.out.println("Redirecting to feedbacklist");
        } else {
            System.out.println("Message is null or empty, not inserting feedback");
            // Optionally, handle the error case by showing an error message or redirecting
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page or show an error message
        }

    }

    private void retrieveFeedback(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException, SQLException {

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> listfeedback = feedbackDAO.selectAllFeedback();

        request.setAttribute("listfeedback", listfeedback);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/feedbacklist.jsp");
        dispatcher.forward(request, response);

    }

    private void updateFeedback(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String message = request.getParameter("message");

        Feedback feedback = new Feedback(id, message);
        boolean updated = feedbackDAO.updateFeedback(feedback);
        if (updated) {
            System.out.println("Feedback updated successfully: " + id);
            response.sendRedirect("feedback.jsp");
        } else {
            System.out.println("Failed to update feedback with ID: " + id);
            response.sendRedirect("about.jsp");
        }
    }

    private void deleteFeedback(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException, SQLException {
        String idParam = request.getParameter("id");
        System.out.println("Delete action received for ID: " + idParam);

        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            boolean deleted = feedbackDAO.deleteFeedback(id);
            if (deleted) {
                System.out.println("Feedback deleted successfully: " + id);
                response.sendRedirect("feedback?action=list");
            } else {
                System.out.println("Failed to delete feedback with ID: " + id);
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            System.out.println("Invalid ID parameter for delete action.");
            response.sendRedirect("errorPage.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for managing feedback";

    }// </editor-fold>

}// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
