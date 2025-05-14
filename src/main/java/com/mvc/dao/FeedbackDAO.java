package com.mvc.dao;

import com.mvc.bean.Feedback;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/dobi";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_FEEDBACK = "INSERT INTO feedback(message) VALUES (?)";
    private static final String SELECT_ALL_FEEDBACK = "SELECT * FROM feedback";
    private static final String SELECT_FEEDBACK_BY_ID = "SELECT * FROM feedback WHERE id = ?";
    private static final String UPDATE_FEEDBACK = "UPDATE feedback SET message = ? WHERE id = ?";
    private static final String DELETE_FEEDBACK = "DELETE FROM feedback WHERE id = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertFeedback(Feedback feedback) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FEEDBACK)) {
            preparedStatement.setString(1, feedback.getMessage());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Feedback selectFeedbackbyID(int id) {
    Feedback feedback = null;
    String sql = "SELECT * FROM feedback WHERE id = ?";
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            String message = rs.getString("message");
            feedback = new Feedback(id, message);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return feedback;
}

    public List<Feedback> selectAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FEEDBACK);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String message = rs.getString("message");
                feedbackList.add(new Feedback(id, message));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public boolean updateFeedback(Feedback feedback) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FEEDBACK)) {
            preparedStatement.setString(1, feedback.getMessage());
            preparedStatement.setInt(2, feedback.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteFeedback(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FEEDBACK)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
