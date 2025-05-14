package com.mvc.controller;

import com.mvc.bean.BookingBean;
import com.mvc.dao.BookingListDAO;

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

@WebServlet("/BookingListServlet")
public class BookingListServlet extends HttpServlet {

    private BookingListDAO bookingListDAO;

    @Override
    public void init() {
        bookingListDAO = new BookingListDAO();
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
        String action2 = request.getParameter("action2");
        System.out.println("BookingListServlet ==> Action = " + action);

        try {
            switch (action) {

                case "/BookingListServlet/edit":
                    displayEditBookingForm(request, response);
                    break;
                case "/BookingListServlet/update":
                    updateBooking(request, response);
                    break;
                case "/BookingListServlet/delete":
                    deleteBooking(request, response);
                    break;
                case "/list":
                    retrieveBooking(request, response);
                    break;
                default:
                    retrieveBooking(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    /* private void displayNewBookingForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/booking.jsp");
        dispatcher.forward(request, response);
    }
     */
    private void displayEditBookingForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        BookingBean currentBooking = bookingListDAO.selectBookingById(id);
        request.setAttribute("booking", currentBooking);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/booking.jsp");
        dispatcher.forward(request, response);
    }

    /* private void createBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        // You should handle date type accordingly
        String date = request.getParameter("date");
        String StartTime = request.getParameter("startTime");
        String StartMinute = request.getParameter("startMinute");
        String EndTime = request.getParameter("endTime");
        String EndMinute = request.getParameter("endMinute");
        String service = request.getParameter("service");
        String delivery = request.getParameter("delivery");

        BookingBean booking = new BookingBean(name, email, phone, date, StartTime, StartMinute, EndTime, EndMinute, service, delivery);
        bookingListDAO.insertBooking(booking);
        response.sendRedirect("bookinglistadmin");
    }
     */
    private void retrieveBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<BookingBean> listBooking = bookingListDAO.selectAllBookings();
        request.setAttribute("listBooking", listBooking);
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/bookinglistadmin.jsp");
        dispatcher.forward(request, response);
    }

    private void updateBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
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

        BookingBean booking = new BookingBean(id, name, email, phone, date, StartTime, StartMinute, EndTime, EndMinute, service, delivery,kilo);
        bookingListDAO.updateBooking(booking);
        response.sendRedirect("bookinglistadmin");  // Use the full path to the servlet
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int bookingId = Integer.parseInt(request.getParameter("id"));
        bookingListDAO.deleteBooking(bookingId);
        response.sendRedirect("bookinglistadmin");
    }
}
