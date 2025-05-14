package com.mvc.dao;

import com.mvc.bean.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mvc.util.DBConnection;

public class BookDao {

    private Connection connection;

    public BookDao() {
        this.connection = DBConnection.createConnection();
    }

    public boolean book(Book book) {
        try {
            if (!isAvailable(book)) {
                System.out.println("Booking failed: Time slot or machine not available.");
                return false;
            }

            if (book.getDate() == null) {
                System.out.println("Booking failed: Date is null.");
                return false;
            }

            String query = "INSERT INTO l_book (kilo, services, machines, date, time_slot_id, delivery) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, book.getKilo());
            preparedStatement.setString(2, book.getServices());
            preparedStatement.setString(3, book.getMachines());
            preparedStatement.setDate(4, book.getDate());
            preparedStatement.setString(5, book.getTime_slot_id());
            preparedStatement.setString(6, book.getDelivery());

            System.out.println("SQL Query with Parameter Values: " + preparedStatement.toString());
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            if (rowsAffected > 0) {
                System.out.println("Booking successful");
                return true;
            } else {
                System.out.println("Booking failed: No rows affected.");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("SQL exception occurred: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private boolean isAvailable(Book book) {
        try {
            // Check if the timeslot and machine are available for the given service
            String query = "SELECT COUNT(*) FROM l_book WHERE services = ? AND date = ? AND time_slot_id = ? AND machines = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, book.getServices());
            preparedStatement.setDate(2, book.getDate());
            preparedStatement.setString(3, book.getTime_slot_id());
            preparedStatement.setString(4, book.getMachines());

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                System.out.println("Availability check result: " + count + " bookings found.");
                return count == 0;
            } else {
                System.out.println("Availability check failed: No result returned.");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("SQL exception occurred during availability check: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
