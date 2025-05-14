/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;
 import com.mvc.bean.Book;
import java.util.HashMap;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mvc.util.DBConnection;

/**
 *
 * @author husna
 */
public class AvailabilityDAO {
    private Connection connection;

    public AvailabilityDAO() {
        this.connection = DBConnection.createConnection();
    }

    public Map<String, String> getAvailabilityStatus() {
        Map<String, String> availabilityStatus = new HashMap<>();
        try {
            String query = "SELECT COUNT(*) AS count, services, machines, time_slot_id FROM l_book GROUP BY services, machines, time_slot_id";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String service = resultSet.getString("services");
                String machine = resultSet.getString("machines");
                String time = resultSet.getString("time_slot_id");

                int count = resultSet.getInt("count");
                availabilityStatus.put(service + "-" + time + "-" + machine, count > 0 ? "unavailable" : "available");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return availabilityStatus;
    }
}
