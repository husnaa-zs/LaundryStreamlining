package com.mvc.dao;

import com.mvc.bean.Book;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookListDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
    private String username = "root";
    private String password = "";

    private static final String SELECT_ALL_BOOK = "SELECT * FROM l_book";
    private static final String SELECT_BOOK_BY_ID = "SELECT * FROM l_book WHERE id = ?";
    private static final String UPDATE_BOOK = "UPDATE l_book SET kilo = ?, services=?, machines = ?, date = ?, time_slot_id = ?, delivery = ? WHERE id = ?";
    private static final String DELETE_BOOK = "DELETE FROM l_book WHERE id = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public Book selectBookById(int id) {
        Book book = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String kilo = rs.getString("kilo");
                String services = rs.getString("services");
                String machines = rs.getString("machines");
                Date date = rs.getDate("date");
                String time_slot_id = rs.getString("time_slot_id");
                String delivery = rs.getString("delivery");
                book = new Book(id, kilo, services, machines, date, time_slot_id, delivery);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public boolean updateBook(Book book) throws SQLException {
        boolean recordUpdated = false;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK)) {
            preparedStatement.setString(1, book.getKilo());
            preparedStatement.setString(2, book.getServices());
            preparedStatement.setString(3, book.getMachines());
            preparedStatement.setDate(4, book.getDate());
            preparedStatement.setString(5, book.getTime_slot_id());
            preparedStatement.setString(6, book.getDelivery());
            preparedStatement.setInt(7, book.getId());
            recordUpdated = preparedStatement.executeUpdate() > 0;
  System.out.println("Update operation executed for book ID: " + book.getId()); // Debug statement
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recordUpdated;
    }

    public boolean deleteBook(int id) throws SQLException {
        boolean recordDeleted = false;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK)) {
            preparedStatement.setInt(1, id);

            // Debug statement to check SQL query execution
            System.out.println("Executing SQL query: " + preparedStatement);

            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recordDeleted;
    }

    public List<Book> selectAllBook() {
        List<Book> books = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK); ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String kilo = rs.getString("kilo");
                String services = rs.getString("services");
                String machines = rs.getString("machines");
                Date date = rs.getDate("date");
                String time_slot_id = rs.getString("time_slot_id");
                String delivery = rs.getString("delivery");
                books.add(new Book(id, kilo, services, machines, date, time_slot_id, delivery));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
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
