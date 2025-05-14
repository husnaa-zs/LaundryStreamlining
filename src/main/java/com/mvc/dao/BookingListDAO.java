package com.mvc.dao;

import com.mvc.bean.BookingBean;
import com.mvc.controller.BookingListServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingListDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
    private String username = "root";
    private String password = "";

    private static final String INSERT_BOOKING = "INSERT INTO booking(name, email, phone, date, StartTime, StartMinute, EndTime, EndMinute, service, delivery,kilo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
    private static final String SELECT_ALL_BOOKINGS = "SELECT * FROM booking";
    private static final String SELECT_BOOKING_BY_ID = "SELECT * FROM booking WHERE id = ?";
    private static final String UPDATE_BOOKING = "UPDATE booking SET name = ?, email = ?, phone = ?, date = ?, StartTime = ?, StartMinute = ?, EndTime = ?, EndMinute = ?, service = ?, delivery = ?,kilo =? WHERE id = ?";
    private static final String DELETE_BOOKING = "DELETE FROM booking WHERE id = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertBooking(BookingBean booking) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOKING)) {
            preparedStatement.setString(1, booking.getName());
            preparedStatement.setString(2, booking.getEmail());
            preparedStatement.setString(3, booking.getPhone());
            preparedStatement.setString(4, booking.getDate());
            preparedStatement.setString(5, booking.getStarttime());
            preparedStatement.setString(6, booking.getStartminute());
            preparedStatement.setString(7, booking.getEndtime());
            preparedStatement.setString(8, booking.getEndminute());
            preparedStatement.setString(9, booking.getService());
            preparedStatement.setString(10, booking.getDelivery());
            preparedStatement.setString(11, booking.getKilo());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BookingBean selectBookingById(int id) {
        BookingBean booking = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                // You should handle date type accordingly
                String date = rs.getString("date");
                String StartTime = rs.getString("StartTime");
                String StartMinute = rs.getString("StartMinute");
                String EndTime = rs.getString("EndTime");
                String EndMinute = rs.getString("EndMinute");
                String service = rs.getString("service");
                String delivery = rs.getString("delivery");
                String kilo = rs.getString("kilo");
                booking = new BookingBean(id, name, email, phone, date, StartTime, StartMinute, EndTime, EndMinute, service, delivery,kilo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }

    public boolean updateBooking(BookingBean booking) throws SQLException {
        boolean recordUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOKING)) {
            preparedStatement.setString(1, booking.getName());
            preparedStatement.setString(2, booking.getEmail());
            preparedStatement.setString(3, booking.getPhone());
            preparedStatement.setString(4, booking.getDate());
            preparedStatement.setString(5, booking.getStarttime());
            preparedStatement.setString(6, booking.getStartminute());
            preparedStatement.setString(7, booking.getEndtime());
            preparedStatement.setString(8, booking.getEndminute());
            preparedStatement.setString(9, booking.getService());
            preparedStatement.setString(10, booking.getDelivery());
            preparedStatement.setString(11,booking.getKilo());
            preparedStatement.setInt(12, booking.getId());
            

            recordUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recordUpdated;
    }

    public boolean deleteBooking(int bookingId) throws SQLException {
        boolean recordDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOKING)) {
            preparedStatement.setInt(1, bookingId);
            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("deleteBooking => Value for recordDeleted = " + recordDeleted);
        return recordDeleted;
    }

    public List<BookingBean> selectAllBookings() {
        List<BookingBean> bookings = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKINGS);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                // You should handle date type accordingly
                String date = rs.getString("date");
                String starttime = rs.getString("StartTime");
                String startminute = rs.getString("StartMinute");
                String endtime = rs.getString("EndTime");
                String endminute = rs.getString("EndMinute");
                String service = rs.getString("service");
                String delivery = rs.getString("delivery");
                String kilo = rs.getString("kilo");
                bookings.add(new BookingBean(id,name, email, phone, date, starttime, startminute, endtime, endminute, service, delivery,kilo));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    public void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
