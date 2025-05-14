package com.mvc.controller;

import com.mvc.bean.Book;
import com.mvc.dao.BookListDao;
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

@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {

    private BookListDao booklistDao;

    @Override
    public void init() {
        booklistDao = new BookListDao();
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

        System.out.println("BookListServlet ==> Action = " + action);

         try {
            switch (action) {
                case "/BookListServlet/edit":
                    displayEditBookForm(request, response);
                    break;
                case "/BookListServlet/update":
                    updateBook(request, response);
                    break;
                case "/BookListServlet/delete":
                    deleteBook(request, response);
                    break;
                case "/BookListServlet/list":
                    retrieveBook(request, response);
                    break;
                default:
                    retrieveBook(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    

    private void displayEditBookForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book currentBook = booklistDao.selectBookById(id);
        request.setAttribute("book", currentBook);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/contoh.jsp");
        dispatcher.forward(request, response);
    }

    private void retrieveBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<Book> listBook = booklistDao.selectAllBook();

        // Debug statement to print the size of listBook
        System.out.println("Debug: Number of books retrieved: " + listBook.size());

        for (Book book : listBook) {
            System.out.println("Debug: Book ID: " + book.getId() + ", Title: " + book.getServices()); // Print additional book details as needed
        }

        request.setAttribute("listBook", listBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/BookListAdmin.jsp");
        dispatcher.forward(request, response);
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String kilo = request.getParameter("kilo");
        String services = request.getParameter("services");
        String machines = request.getParameter("machines");
        String dateString = request.getParameter("date");
        String time_slot_id = request.getParameter("time_slot_id");
        String delivery = request.getParameter("delivery");

        java.sql.Date date = null;
        if (dateString != null && !dateString.isEmpty()) {
            date = java.sql.Date.valueOf(dateString);
        }

        Book book = new Book(id, kilo, services, machines, date, time_slot_id, delivery);
        booklistDao.updateBook(book);
        response.sendRedirect("BookListAdmin.jsp");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Debug statement to check parameter extraction
        System.out.println("Deleting book with ID: " + id);

        boolean deleted = booklistDao.deleteBook(id);

        if (deleted) {
            // Redirect or forward after successful deletion
            response.sendRedirect("BookListAdmin.jsp"); // Assuming "list" is your list action
        } else {
            // Handle deletion failure
            // Optionally redirect or forward to an error page
        }
    }
}
